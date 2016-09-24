//
//  LJFUITabBar.m
//  彩票项目
//
//  Created by ljf on 16/8/20.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFtabBar.h"
#import "LJFTabBarButton.h"


@interface LJFtabBar ()

@property (nonatomic,weak) UIButton * currentbBtn;

@end

@implementation LJFtabBar

-(void)addTabBarButtonWith:(UITabBarItem *)itme{
    
    LJFTabBarButton * bu = [LJFTabBarButton buttonWithType:UIButtonTypeCustom];
    
    [bu setBackgroundImage:itme.image forState:UIControlStateNormal];
    [bu setBackgroundImage:itme.selectedImage forState:UIControlStateSelected];

    //添加点击事件
    [bu addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:bu];
    
    //设置第一个按钮选种状态
    NSInteger  count = self.subviews.count;
    if (count == 1) {
        UIButton * but = self.subviews[0];
        [but setSelected:YES];
        [self buttonClick:but];
        //记录选种的按钮
        self.currentbBtn = but;
    }
}


-(void)layoutSubviews{
   
    int count = (int)self.subviews.count;
    float height = self.frame.size.height;
    float width = self.frame.size.width/count;
    float y = 0;
    float x = 0;
    
    //设置frame
    for (int i = 0 ; i < count; i++) {
        
        x = width * i ;
        UIButton * but = self.subviews[i];
        //设置button的frame
        but.frame = CGRectMake(x, y, width, height);
        //设置tag值
        but.tag = i;
    }
}


-(void)buttonClick:(UIButton *)click{
    
    if ([self.delegate respondsToSelector:@selector(tabBar:DidTag:WillToTag:)]) {
        
        [self.delegate tabBar:self DidTag:self.currentbBtn.tag WillToTag:click.tag];
        
        [self.currentbBtn setSelected:NO];
        [click setSelected:YES];
        //记录选择按钮
        self.currentbBtn = click;
    }
}

@end


