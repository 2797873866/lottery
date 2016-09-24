//
//  LJFUITabBar.h
//  彩票项目
//
//  Created by ljf on 16/8/20.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LJFtabBar;
@protocol LJFtabBarDelegate <NSObject>

//添加代理方法
-(void)tabBar:(LJFtabBar *)tabBar  DidTag:(NSInteger )DidTag WillToTag:(NSInteger)WillToTag;

@end



@interface LJFtabBar : UIView

//添加代理属性
@property (nonatomic , weak) id <LJFtabBarDelegate> delegate;

//添加
-(void)addTabBarButtonWith:(UITabBarItem *)itme;

@end
