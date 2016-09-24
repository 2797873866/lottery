//
//  LJFLuckyViewController.m
//  幸运转盘
//
//  Created by ljf on 16/9/1.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFLuckyViewController.h"
#import "LJFLuckyView.h"

@interface LJFLuckyViewController ()

@property (nonatomic,weak) LJFLuckyView * luckyView;

@end

@implementation LJFLuckyViewController
- (IBAction)state:(UIButton *)sender {
    [self.luckyView stateRotating];
}


- (IBAction)stop:(UIButton *)sender {
    [self.luckyView stopRotating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    LJFLuckyView * lucky = [ LJFLuckyView luckyViewWithView];
    lucky.center = self.view.center;
    [lucky sizeToFit];
    [self.view addSubview:lucky];
    
    self.luckyView = lucky;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
