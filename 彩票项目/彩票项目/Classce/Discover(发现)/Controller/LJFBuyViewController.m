//
//  LJFBuyViewController.m
//  彩票项目
//
//  Created by ljf on 16/8/31.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFBuyViewController.h"
#import "LJFButton.h"

@interface LJFBuyViewController ()

@end

@implementation LJFBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LJFButton * bu = [[LJFButton alloc]init];
    [bu setTitle:@"全部彩种" forState:UIControlStateNormal];
    [bu setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [bu setBackgroundImage:[UIImage imageNamed:@"navTitleSel"] forState:UIControlStateSelected];
    bu.imageView.contentMode = UIViewContentModeCenter;
    bu.titleLabel.font = [UIFont systemFontOfSize:14];

    
    [bu addTarget:self action:@selector(buClick:) forControlEvents:UIControlEventTouchUpInside];
    [bu sizeToFit];
//    bu.frame = CGRectMake(0, 0, 100, 30);
    self.navigationItem.titleView = bu;
}

-(void)buClick:(LJFButton *)button{
    
    button.selected = !button.selected;
    
    if (button.selected) {
        
        //旋转180度
        button.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        
    }else{
        
        //清除transform 旋转
        button.imageView.transform = CGAffineTransformIdentity;
    }
    
    
}


@end
