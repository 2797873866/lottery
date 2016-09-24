//
//  UIBarButtonItem+Extension.h
//  彩票项目
//
//  Created by ljf on 16/8/24.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem *)BarbuttonWithTitle:(NSString *)title NormalImage:(NSString *)NormalImage HigImage:(NSString *)HigImage Target:(id)Target action:(SEL)action;

@end
