//
//  PerformanceMonitor.m
//  iOSAppProject
//
//  Created by zhangpeng on 2019/1/16.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "PerformanceMonitor.h"
#import <mach/mach.h>
#include <sys/syscall.h>

@interface PerformanceMonitor () {
    int timeoutCount;
    CFRunLoopObserverRef observer;
    
@public
    dispatch_semaphore_t semaphore;
    CFRunLoopActivity activity;
}
@end

//为通用回溯设计结构支持栈地址由小到大，地址里存储上个栈指针的地址
typedef struct SMStackFrame {
    const struct SMStackFrame *const previous;
    const uintptr_t return_address;
} SMStackFrame;

@implementation PerformanceMonitor

+ (instancetype)sharedInstance {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

static void runLoopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    PerformanceMonitor *monitor = (__bridge PerformanceMonitor*)info;
    
    monitor->activity = activity;
    
    dispatch_semaphore_t semaphore = monitor->semaphore;
    dispatch_semaphore_signal(semaphore);
}

- (void)stopMonitor {
    if (!observer)
        return;
    CFRunLoopRemoveObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    CFRelease(observer);
    observer = NULL;
}

- (void)startMonitor {
    
    if (observer)
        return;
    
    // 信号,Dispatch Semaphore保证同步
    semaphore = dispatch_semaphore_create(0);
    
    // 注册RunLoop状态观察
    CFRunLoopObserverContext context = {0,(__bridge void*)self,NULL,NULL};
    observer = CFRunLoopObserverCreate(kCFAllocatorDefault,
                                       kCFRunLoopAllActivities,
                                       YES,
                                       0,
                                       &runLoopObserverCallBack,
                                       &context);
    //将观察者添加到主线程runloop的common模式下的观察中
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    
    // 在子线程监控时长 开启一个持续的loop用来进行监控
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while (YES)
        {
            NSInteger millisecond = 200;
            
            long st = dispatch_semaphore_wait(self->semaphore, dispatch_time(DISPATCH_TIME_NOW, millisecond * NSEC_PER_MSEC));
            if (st != 0)
            {
                if (!self->observer)
                {
                    self->timeoutCount = 0;
                    self->semaphore = 0;
                    self->activity = 0;
                    return;
                }
                //两个runloop的状态，BeforeSources和AfterWaiting这两个状态区间时间能够检测到是否卡顿
                if (self->activity==kCFRunLoopBeforeSources || self->activity==kCFRunLoopAfterWaiting)
                {
                    if (++self->timeoutCount < 1)
                        continue;
                    NSLog(@"即将发生卡顿");
                    
                    thread_act_array_t threads; //int 组成的数组比如 thread[1] = 5635
                    mach_msg_type_number_t thread_count = 0; //mach_msg_type_number_t 是 int 类型
                    const task_t this_task = mach_task_self(); //int
                    //根据当前 task 获取所有线程
                    kern_return_t kr = task_threads(this_task, &threads, &thread_count);
                    if (kr != KERN_SUCCESS) {
                        NSLog(@"fail get all threads");
                    }
                    NSMutableString *reStr = [NSMutableString stringWithFormat:@"Call %u threads:\n", thread_count];
                    
                    NSMutableArray *stackAddrs = [NSMutableArray arrayWithCapacity:10];
                    for (int j = 0; j < thread_count; j++) {
                        //当前执行的指令
                        uintptr_t buffer[100];
                        
                        int i = 0;
                        //回溯栈的算法
                        /*
                         栈帧布局参考：
                         https://en.wikipedia.org/wiki/Call_stack
                         http://www.cs.cornell.edu/courses/cs412/2008sp/lectures/lec20.pdf
                         http://eli.thegreenplace.net/2011/09/06/stack-frame-layout-on-x86-64/
                         */
                        _STRUCT_MCONTEXT machineContext; //线程栈里所有的栈指针
                        //通过 thread_get_state 获取完整的 machineContext 信息，包含 thread 状态信息
                        mach_msg_type_number_t state_count = smThreadStateCountByCPU();
                        kern_return_t kr = thread_get_state(threads[j], smThreadStateByCPU(), (thread_state_t)&machineContext.__ss, &state_count);
                        if (kr != KERN_SUCCESS) {
                            continue;
                        }
                        //通过指令指针来获取当前指令地址
                        const uintptr_t instructionAddress = smMachInstructionPointerByCPU(&machineContext);
                        buffer[i] = instructionAddress;
                        ++i;
                        
                        //
                        uintptr_t linkRegisterPointer = smMachThreadGetLinkRegisterPointerByCPU(&machineContext);
                        if (linkRegisterPointer) {
                            buffer[i] = linkRegisterPointer;
                            i++;
                        }
                        
                        if (instructionAddress == 0) {
                            continue;
                        }
                        SMStackFrame stackFrame = {0};
                        //通过栈基址指针获取当前栈帧地址
                        const uintptr_t framePointer = smMachStackBasePointerByCPU(&machineContext);
                        if (framePointer == 0 || smMemCopySafely((void *)framePointer, &stackFrame, sizeof(stackFrame)) != KERN_SUCCESS) {
                            continue;
                        }
                        for (; i < 32; i++) {
                            buffer[i] = stackFrame.return_address;
                            if (buffer[i] == 0 || stackFrame.previous == 0 || smMemCopySafely(stackFrame.previous, &stackFrame, sizeof(stackFrame)) != KERN_SUCCESS) {
                                break;
                            }
                        }
                        
                        for (int m = 0; m < i; m++) {
                            [stackAddrs addObject:@(buffer[m])];
                        }
                    }
                    
                    // 这里收集到所有的 stackFrame 保存到 变量 stackAddrs
                    
                    //task info
                    NSString *memStr = @"";
                    struct mach_task_basic_info taskBasicInfo;
                    mach_msg_type_number_t taskInfoCount = sizeof(taskBasicInfo) / sizeof(integer_t);
                    if (task_info(mach_task_self(), MACH_TASK_BASIC_INFO, (task_info_t)&taskBasicInfo, &taskInfoCount) == KERN_SUCCESS) {
                        memStr = [NSString stringWithFormat:@"used %llu MB \n",taskBasicInfo.resident_size / (1024 * 1024)];
                    }
                    
                    NSLog(@"内存使用情况%@%@",memStr,reStr);
                    //释放虚存缓存，防止leak
                    assert(vm_deallocate(mach_task_self(), (vm_address_t)threads, thread_count * sizeof(thread_t)) == KERN_SUCCESS);
                    
                    
                }//end activity
            }// end semaphore wait
            self->timeoutCount = 0;
        }// end while
    });
}

mach_msg_type_number_t smThreadStateCountByCPU() {
#if defined(__arm64__)
    return ARM_THREAD_STATE64_COUNT;
#elif defined(__arm__)
    return ARM_THREAD_STATE_COUNT;
#elif defined(__x86_64__)
    return x86_THREAD_STATE64_COUNT;
#elif defined(__i386__)
    return x86_THREAD_STATE32_COUNT;
#endif
}

/*
 * target_thread 的执行状态，比如机器寄存器
 * THREAD_STATE_FLAVOR_LIST 0
 * these are the supported flavors
 #define x86_THREAD_STATE32      1
 #define x86_FLOAT_STATE32       2
 #define x86_EXCEPTION_STATE32   3
 #define x86_THREAD_STATE64      4
 #define x86_FLOAT_STATE64       5
 #define x86_EXCEPTION_STATE64   6
 #define x86_THREAD_STATE        7
 #define x86_FLOAT_STATE         8
 #define x86_EXCEPTION_STATE     9
 #define x86_DEBUG_STATE32       10
 #define x86_DEBUG_STATE64       11
 #define x86_DEBUG_STATE         12
 #define THREAD_STATE_NONE       13
 14 and 15 are used for the internal x86_SAVED_STATE flavours
 #define x86_AVX_STATE32         16
 #define x86_AVX_STATE64         17
 #define x86_AVX_STATE           18
 */
thread_state_flavor_t smThreadStateByCPU() {
#if defined(__arm64__)
    return ARM_THREAD_STATE64;
#elif defined(__arm__)
    return ARM_THREAD_STATE;
#elif defined(__x86_64__)
    return x86_THREAD_STATE64;
#elif defined(__i386__)
    return x86_THREAD_STATE32;
#endif
}
uintptr_t smMachThreadGetLinkRegisterPointerByCPU(mcontext_t const machineContext) {
#if defined(__i386__)
    return 0;
#elif defined(__x86_64__)
    return 0;
#else
    return machineContext->__ss.__lr;
#endif
}

uintptr_t smMachInstructionPointerByCPU(mcontext_t const machineContext) {
    //Instruction pointer. Holds the program counter, the current instruction address.
#if defined(__arm64__)
    return machineContext->__ss.__pc;
#elif defined(__arm__)
    return machineContext->__ss.__pc;
#elif defined(__x86_64__)
    return machineContext->__ss.__rip;
#elif defined(__i386__)
    return machineContext->__ss.__eip;
#endif
}

/*
 //X86 for example
 SP/ESP/RSP: 栈顶部地址的栈指针
 BP/EBP/RBP: 栈基地址指针
 IP/EIP/RIP: 指令指针保留程序计数当前指令地址
 */
uintptr_t smMachStackBasePointerByCPU(mcontext_t const machineContext) {
    //Stack base pointer for holding the address of the current stack frame.
#if defined(__arm64__)
    return machineContext->__ss.__fp;
#elif defined(__arm__)
    return machineContext->__ss.__r[7];
#elif defined(__x86_64__)
    return machineContext->__ss.__rbp;
#elif defined(__i386__)
    return machineContext->__ss.__ebp;
#endif
}

kern_return_t smMemCopySafely(const void *const src, void *const dst, const size_t byteSize) {
    vm_size_t bytesCopied = 0;
    return vm_read_overwrite(mach_task_self(), (vm_address_t)src, (vm_size_t)byteSize, (vm_address_t)dst, &bytesCopied);
}
@end
