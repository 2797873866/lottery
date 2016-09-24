//
//  LJFButton.m
//  彩票项目
//
//  Created by ljf on 16/8/31.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFButton.h"

@implementation LJFButton


-(instancetype)init{
    
    if (self = [super init]) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    //交换lable与image的位置
    CGRect frame = self.titleLabel.frame ;
    frame.origin.x  = 0 ;
    self.titleLabel.frame = frame ;
    
    CGRect ImageFrame = self.imageView.frame ;
    ImageFrame.origin.x = CGRectGetMaxX(self.titleLabel.frame) ;
    self.imageView.frame = ImageFrame ;
    
}

@end
