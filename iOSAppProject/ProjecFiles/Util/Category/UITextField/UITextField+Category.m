//
//  UITextField+Category.m
//  iOSAppProject
//
//  Created by zhangpeng on 2019/1/8.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "UITextField+Category.h"
#import "NSObject+Category.h"
#import <pthread/pthread.h>
#import <objc/runtime.h>

@interface LimitInfo : NSObject
@property(nonatomic, weak) id<UITextFieldDelegate> tempDelegate;

@property(nonatomic, assign) NSInteger maxLength;
@property(nonatomic, copy) void (^action)(void);

@property(nonatomic, copy) P_InputBlock inputBlock;
@property(nonatomic, copy) void (^inputAction)(void);
//
@property(nonatomic, copy) P_InputBlock response;
@property(nonatomic, copy) void (^responseAction)(void);
@end

@implementation LimitInfo

@end

@interface UITextFieldInputManager : NSObject <UITextFieldDelegate>
{
    NSMapTable<id,LimitInfo *> *_infos;
    pthread_mutex_t _mutex;
}
+ (instancetype)sharedInstance;
- (void)removeLimitForKey:(id)key;

- (void)limitWithMaxLength:(NSInteger)maxLength
                inputBlock:(P_InputBlock)inputBlock
                       key:(id)key
                    target:(id<UITextFieldDelegate>)target
       inputFailedCallBack:(void(^)(void))inputFailedCallBack;
@end

@implementation UITextFieldInputManager

Singleton()

- (void)dealloc
{
    pthread_mutex_destroy(&_mutex);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        pthread_mutex_init(&_mutex, NULL);
        NSPointerFunctionsOptions keyOptions =  NSPointerFunctionsWeakMemory|NSPointerFunctionsObjectPointerPersonality;
        _infos = [[NSMapTable alloc] initWithKeyOptions:keyOptions valueOptions:NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPersonality capacity:0];
    }
    return self;
}

- (void)removeLimitForKey:(id)key {
    if (!key) {
        return;
    }
    pthread_mutex_lock(&_mutex);
    LimitInfo* info = [_infos objectForKey:key];
    ((UITextField*)key).delegate = info.tempDelegate;
    [_infos removeObjectForKey:key];
    pthread_mutex_unlock(&_mutex);
}

- (void)addLimitWithDisturb:(BOOL)disturb andCondition:(P_InputBlock)condition andNums:(NSInteger)num key:(id)key target:(id<UITextFieldDelegate>)target action:(void (^)(void))action{
    if (!key) {
        return;
    }
    pthread_mutex_lock(&_mutex);
    LimitInfo *info = [_infos objectForKey:key];
    
    if (!info) {
        info = [[LimitInfo alloc] init];
        info.tempDelegate = target;
    }
    if (disturb) {
        if (condition) {
            info.inputBlock = condition;
            info.inputAction = action;
        }
        if (num > 0) {
            info.maxLength = num;
            [info setAction:action];
        }
    }else{
        info.response = condition;
        [info setResponseAction:action];
    }
    
    [_infos setObject:info forKey:key];
    pthread_mutex_unlock(&_mutex);
}

- (LimitInfo *)safeReadForKey:(id)key {
    if (!key) {
        return nil;
    }
    pthread_mutex_lock(&_mutex);
    LimitInfo *info = [_infos objectForKey:key];
    pthread_mutex_unlock(&_mutex);
    return info;
}

- (void)limitWithMaxLength:(NSInteger)maxLength inputBlock:(P_InputBlock)inputBlock key:(id)key target:(id<UITextFieldDelegate>)target inputFailedCallBack:(void (^)(void))inputFailedCallBack {
    [self addLimitWithDisturb:YES andCondition:inputBlock andNums:maxLength key:key target:target action:inputFailedCallBack];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    BOOL checkInLimit = NO;
    LimitInfo *info = [self safeReadForKey:textField];
    if (info.response && !info.response(string) && string.length > 0) {
        info.responseAction();
    }
    if (info.inputBlock && !info.inputBlock(string) && string.length > 0) {
        info.inputAction();
        checkInLimit = YES;
    }
    if (info.maxLength != 0) {
        if (info && textField.text.length == info.maxLength && string.length > 0) {
            info.action();
            checkInLimit = YES;
        }
    }
    if (checkInLimit) {
        return NO;
    }
    if (!info.tempDelegate) {
        return YES;
    }
    if (![info.tempDelegate respondsToSelector:_cmd]) {
        return YES;
    }
    return [info.tempDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    LimitInfo *info = [self safeReadForKey:textField];
    if (!info.tempDelegate || ![info.tempDelegate respondsToSelector:_cmd]) {
        return YES;
    }
    return [info.tempDelegate textFieldShouldBeginEditing:textField];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    LimitInfo *info = [self safeReadForKey:textField];
    if ([info.tempDelegate respondsToSelector:_cmd]) {
        return [info.tempDelegate textFieldDidBeginEditing:textField];
    }
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    LimitInfo *info = [self safeReadForKey:textField];
    if (!info.tempDelegate || ![info.tempDelegate respondsToSelector:_cmd]) {
        return YES;
    }
    return [info.tempDelegate textFieldShouldEndEditing:textField];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    LimitInfo *info = [self safeReadForKey:textField];
    if ([info.tempDelegate respondsToSelector:_cmd]) {
        return [info.tempDelegate textFieldDidEndEditing:textField];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason  API_AVAILABLE(ios(10.0)){
    LimitInfo *info = [self safeReadForKey:textField];
    if ([info.tempDelegate respondsToSelector:_cmd]) {
        return [info.tempDelegate textFieldDidEndEditing:textField reason:reason];
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    LimitInfo *info = [self safeReadForKey:textField];
    if (!info.tempDelegate || ![info.tempDelegate respondsToSelector:_cmd]) {
        return YES;
    }
    return [info.tempDelegate textFieldShouldClear:textField];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    LimitInfo *info = [self safeReadForKey:textField];
    if (!info.tempDelegate || ![info.tempDelegate respondsToSelector:_cmd]) {
        return YES;
    }
    return [info.tempDelegate textFieldShouldReturn:textField];
}

@end

@implementation UITextField (Category)

#pragma mark - Load

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(removeFromSuperview);
        SEL swizzledSelector = @selector(p_removeFromSuperview);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)p_removeFromSuperview {
    [[UITextFieldInputManager sharedInstance] removeLimitForKey:self];
    return [self p_removeFromSuperview];
}

#pragma mark - Limit

- (void)limitWithMaxLength:(NSInteger)maxLength
                inputBlock:(P_InputBlock)inputBlock
       inputFailedCallBack:(void(^)(void))inputFailedCallBack {
    [[UITextFieldInputManager sharedInstance] limitWithMaxLength:maxLength
                                                      inputBlock:inputBlock
                                                             key:self
                                                          target:self.delegate
                                             inputFailedCallBack:inputFailedCallBack];
    self.delegate = [UITextFieldInputManager sharedInstance];
}

#pragma mark - 

- (NSString *)primaryLanguage {
    return [self.textInputMode primaryLanguage];
}

- (void)setPlaceholder:(NSString *)placeholder color:(UIColor *)color font:(UIFont *)font {
    if (!placeholder || placeholder.length <= 0) {
        return;
    }
    NSMutableAttributedString *placeholderAttstr = [[NSMutableAttributedString alloc] initWithString:placeholder];
    if (color) {
        [placeholderAttstr addAttribute:NSForegroundColorAttributeName
                                  value:color
                                  range:NSMakeRange(0, placeholder.length)];
    }
    if (font) {
        [placeholderAttstr addAttribute:NSFontAttributeName
                                  value:font
                                  range:NSMakeRange(0, placeholder.length)];
    }
    self.attributedPlaceholder = placeholderAttstr;
}

@end
