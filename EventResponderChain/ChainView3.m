//
//  ChainView3.m
//  EventResponseChain
//
//  Created by  kcs on 2018/2/23.
//  Copyright © 2018年 KCS. All rights reserved.
//

#import "ChainView3.h"

@implementation ChainView3

- (void)addTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self addGestureRecognizer:tap];
}
- (void)tapGesture:(UITapGestureRecognizer *)gesture {
    NSLog(@"ChainView3 >>> %s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"ChainView3 >>> %s", __func__);
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"ChainView3 >>> %s", __func__);
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"ChainView3 >>> %s", __func__);
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"ChainView3 >>> %s", __func__);
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    return YES;
//}

@end
