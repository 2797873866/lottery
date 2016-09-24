//
//  LJFLuckyButton.m
//  幸运转盘
//
//  Created by ljf on 16/9/1.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFLuckyButton.h"

@implementation LJFLuckyButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    //contentRect 按钮显示图片控件有大小
    //图片为40个像素
    CGFloat imageW = 40;
    //图片为47个像素
    CGFloat imageH = 47;
    //让图居中
    CGFloat imageX = (contentRect.size.width - imageW) * 0.5;
    //y值是试出来的
    CGFloat imageY = 20;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
 
}
@end
