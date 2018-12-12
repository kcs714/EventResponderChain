//
//  ChainView2.m
//  EventResponseChain
//
//  Created by  kcs on 2018/2/23.
//  Copyright © 2018年 KCS. All rights reserved.
//

#import "ChainView2.h"

@implementation ChainView2

- (void)addTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self addGestureRecognizer:tap];
}
- (void)tapGesture:(UITapGestureRecognizer *)gesture {
    NSLog(@"ChainView2 >>> %s  tag=%ld", __func__, self.tag);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"ChainView2 >>> %s  tag=%ld", __func__, self.tag);
//}
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"ChainView2 >>> %s  tag=%ld", __func__, self.tag);
//}
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"ChainView2 >>> %s  tag=%ld", __func__, self.tag);
//}
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"ChainView2 >>> %s  tag=%ld", __func__, self.tag);
//}

@end
