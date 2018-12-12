//
//  ViewController.m
//  EventResponderChain
//
//  Created by  kcs on 2018/2/26.
//  Copyright © 2018年 KCS. All rights reserved.
//

#import "ViewController.h"
#import "ChainView1.h"
#import "ChainView2.h"
#import "ChainView3.h"
#import "UIView+ResponderChain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    ChainView1 *view1 = [[ChainView1 alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    ChainView2 *view21 = [[ChainView2 alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 200)];
    view21.backgroundColor = [UIColor blueColor];
    view21.tag = 21;
    [view1 addSubview:view21];
    
    ChainView2 *view22 = [[ChainView2 alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(view21.frame) + 150, self.view.bounds.size.width, 200)];
    view22.backgroundColor = [UIColor yellowColor];
    view22.tag = 22;
    [view1 addSubview:view22];
    
    ChainView2 *view221 = [[ChainView2 alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 80)];
    view221.backgroundColor = [UIColor orangeColor];
    view221.tag = 221;
    [view22 addSubview:view221];
    
    ChainView3 *view3 = [[ChainView3 alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 150)];
    view3.backgroundColor = [UIColor greenColor];
    [view3 addTarget:self action:@selector(view3Event:) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"1>>%@", view3.nextResponder);
    [view21 addSubview:view3];
    NSLog(@"2>>%@", view3.nextResponder);
    
    ChainView2 *view31 = [[ChainView2 alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 80)];
    view31.backgroundColor = [UIColor orangeColor];
    view31.tag = 31;
    [view3 addSubview:view31];
    
    //    [view1 addTapGesture];
    //    [view21 addTapGesture];
    //    [view22 addTapGesture];
    [view3 addTapGesture];
    
    
    
    //    view1.userInteractionEnabled = NO;
    //    view21.userInteractionEnabled = NO;
    //    view22.userInteractionEnabled = NO;
    //    view3.userInteractionEnabled = NO;
}

- (void)view3Event:(UIButton *)sender {
    NSLog(@"ChainView3 >>> %s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ >>> %s", self.class,  __func__);
}

// 防止程序崩溃的代码
- (void)lxd_touchesBegan: (NSSet *)touches withEvent: (UIEvent *)event {
    NSLog(@"%@ --- begin", self.class);
}

- (void)lxd_touchesMoved: (NSSet *)touches withEvent: (UIEvent *)event {
    NSLog(@"%@ --- move", self.class);
}

- (void)lxd_touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
    NSLog(@"%@ --- end", self.class);
}

@end
