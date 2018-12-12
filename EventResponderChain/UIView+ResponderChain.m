//
//  UIView+ResponderChain.m
//  EventResponseChain
//
//  Created by  kcs on 2018/2/26.
//  Copyright © 2018年 KCS. All rights reserved.
//

#import "UIView+ResponderChain.h"
#import <objc/runtime.h>

@implementation UIView (ResponderChain)

+ (void)load {
    Method origin = class_getInstanceMethod([UIView class], @selector(touchesBegan:withEvent:));
    Method custom = class_getInstanceMethod([UIView class], @selector(lxd_touchesBegan:withEvent:));
    method_exchangeImplementations(origin, custom);

    origin = class_getInstanceMethod([UIView class], @selector(touchesMoved:withEvent:));
    custom = class_getInstanceMethod([UIView class], @selector(lxd_touchesMoved:withEvent:));
    method_exchangeImplementations(origin, custom);

    origin = class_getInstanceMethod([UIView class], @selector(touchesEnded:withEvent:));
    custom = class_getInstanceMethod([UIView class], @selector(lxd_touchesEnded:withEvent:));
    method_exchangeImplementations(origin, custom);
    
    origin = class_getInstanceMethod([UIView class], @selector(hitTest:withEvent:));
    custom = class_getInstanceMethod([UIView class], @selector(lxd_hitTest:withEvent:));
    method_exchangeImplementations(origin, custom);
    
    origin = class_getInstanceMethod([UIView class], @selector(pointInside:withEvent:));
    custom = class_getInstanceMethod([UIView class], @selector(lxd_pointInside:withEvent:));
    method_exchangeImplementations(origin, custom);
}

- (void)lxd_touchesBegan: (NSSet *)touches withEvent: (UIEvent *)event {
    NSLog(@"%@ --- begin", self.class);
    [self lxd_touchesBegan:touches withEvent:event];
}

- (void)lxd_touchesMoved: (NSSet *)touches withEvent: (UIEvent *)event {
    NSLog(@"%@ --- move", self.class);
    [self lxd_touchesMoved:touches withEvent:event];
}

- (void)lxd_touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
    NSLog(@"%@ --- end", self.class);
    [self lxd_touchesEnded:touches withEvent:event];
}

- (UIView *)lxd_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"lxd_hitTest开始");
    NSLog(@"%@ >>> %s", self.class, __func__);
    NSLog(@"+++ %@ -> %@ : tag = %ld", self.class, self.nextResponder.class, self.tag);
    UIView *tempView = [self lxd_hitTest:point withEvent:event];
    NSLog(@"lxd_hitTest结束");
    return tempView;
}

- (BOOL)lxd_pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    NSLog(@"lxd_pointInside开始");
    NSLog(@"%@ >>> %s", self.class, __func__);
    BOOL tempBool = [self lxd_pointInside:point withEvent:event];
    NSLog(@"lxd_pointInside结束");
    return tempBool;
}

@end
