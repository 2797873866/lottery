//
//  UIBarButtonItem+Extension.m
//  彩票项目
//
//  Created by ljf on 16/8/24.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+(UIBarButtonItem *)BarbuttonWithTitle:(NSString *)title NormalImage:(NSString *)NormalImage HigImage:(NSString *)HigImage Target:(id)Target action:(SEL)action{
    
    // 1. 创建按钮
    UIButton * bu = [[UIButton alloc] init];
    
    // 2.1设置普通图片 ==>判断是防止传入空时出现报错
    if (NormalImage != nil && ![NormalImage isEqual:@""]) {
        UIImage * nolImage = [UIImage imageNamed:NormalImage];
        nolImage = [nolImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [bu setImage:nolImage forState:UIControlStateNormal];
    }
    // 2.2设置高亮图片 ==>判断是防止传入空时出现报错
    if (HigImage != nil && ![HigImage isEqual:@""]) {
        UIImage * higImage = [UIImage imageNamed:HigImage];
        higImage = [higImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [bu setImage:higImage forState:UIControlStateHighlighted];
    }
    // 3. 设置title ==>判断是防止传入空时出现报错
    if (title != nil && ![title isEqual:@""]) {
        [bu setTitle:title forState:UIControlStateNormal];
            }
    // 4. 自动调整控件以及子控件frame
    [bu sizeToFit];
    
    // 5.监听按钮的点击事件
    [bu addTarget:Target action:action forControlEvents:UIControlEventTouchDown];
    // 6. 创建item
    return [[UIBarButtonItem alloc] initWithCustomView:bu];
}

@end
