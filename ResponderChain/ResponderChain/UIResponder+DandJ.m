//
//  UIResponder+DandJ.m
//  ResponderChain
//
//  Created by dangercheng on 2018/5/23.
//  Copyright © 2018年 DandJ. All rights reserved.
//

#import "UIResponder+DandJ.h"
#import <objc/runtime.h>

@implementation UIResponder (DandJ)

+ (void)load {
    Method origin = class_getInstanceMethod([UIResponder class], @selector(touchesBegan:withEvent:));
    Method custom = class_getInstanceMethod([UIResponder class], @selector(dandJ_touchesBegan:withEvent:));
    method_exchangeImplementations(origin, custom);

    origin = class_getInstanceMethod([UIResponder class], @selector(touchesMoved:withEvent:));
    custom = class_getInstanceMethod([UIResponder class], @selector(dandJ_touchesMoved:withEvent:));
    method_exchangeImplementations(origin, custom);
    
    origin = class_getInstanceMethod([UIResponder class], @selector(touchesEnded:withEvent:));
    custom = class_getInstanceMethod([UIResponder class], @selector(dandJ_touchesEnded:withEvent:));
    method_exchangeImplementations(origin, custom);
}

- (void)dandJ_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesBegan", NSStringFromClass([self class]));
    [self dandJ_touchesBegan:touches withEvent:event];
}

- (void)dandJ_touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesMoved", NSStringFromClass([self class]));
    [self dandJ_touchesMoved:touches withEvent:event];
}

- (void)dandJ_touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesEnded", NSStringFromClass([self class]));
    [self dandJ_touchesEnded:touches withEvent:event];
}

@end

