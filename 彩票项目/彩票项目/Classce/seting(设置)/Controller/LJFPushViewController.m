//
//  LJFPuchController.m
//  彩票项目
//
//  Created by ljf on 16/8/30.
//  Copyright © 2016年 LJF. All rights reserved.
//
#import "LJFPushViewController.h"
#import "LJFSetingModleArrow.h"

@interface LJFPushViewController ()

@end

@implementation LJFPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGroup0];
 
}


- (void)addGroup0
{
    LJFSetingModleArrow *item1 = [LJFSetingModleArrow itemWithImageName:nil title:@"开奖推送"];
    LJFSetingModleArrow *item2 = [LJFSetingModleArrow itemWithImageName:nil title:@"比分直播推送"];
    LJFSetingModleArrow *item3 = [LJFSetingModleArrow itemWithImageName:nil title:@"中奖动画"];
    LJFSetingModleArrow *item4 = [LJFSetingModleArrow itemWithImageName:nil title:@"购彩提醒"];
    
    NSArray * arrary = @[item1,item2,item3,item4];
    
    [self.datas addObject:arrary];
/*
 无论是_unsafe_unretained ,还是__weak注释一个对象,它只会将block中对对象的引用转化为弱引用,面不会阻止block Retain我们的对象.
 _unsafe_unretained 与 __weak一样的效果,只不过_weak比较新,ios5出来的,面_unsafe_unretained是比较古老的
 _unsafe_unretained与 _weak 的区别
 _unsafe_unretained 修饰一个对象,如果对象释放了,指针还指向对象的存储地址,会导致野指针错误.
 __weak 修饰一个对象,如果对象释放了,指针还指向对象的变量自动设置为nil.以后block尽量用block修饰.否则可能导致循环引用.
 */
   
    
}

@end