//
//  LJFTabbarController.m
//  彩票项目
//
//  Created by ljf on 16/8/18.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFTabbarController.h"
#import "LJFHallController.h"
#import "LJFarenaController.h"
#import "LJFDiscoverController.h"
#import "LJFHistoryController.h"
#import "LJFMineController.h"
#import "LJFtabBar.h"
#import "LJFNavigationController.h"

@interface LJFTabbarController ()<LJFtabBarDelegate>
//保存tabBar
@property (nonatomic,weak)LJFtabBar * customTabBar;

@end

@implementation LJFTabbarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self superTabBar];
    
    [self addChildController];
}

//tabBar代理方法
-(void)tabBar:(LJFtabBar *)tabBar DidTag:(NSInteger)DidTag WillToTag:(NSInteger)WillToTag{
   
//    // 1.切换控制器
//        LJFNavigationController *vc = self.viewControllers[WillToTag];
//        self.selectedViewController = vc;
    // 1.切换控制器
      self.selectedIndex = WillToTag;

}

-(void)superTabBar{
    
    LJFtabBar * cusTomTabBar = [[LJFtabBar alloc] init];
    cusTomTabBar.frame = self.tabBar.bounds;
    cusTomTabBar.backgroundColor = [UIColor redColor];
    cusTomTabBar.delegate = self;
    [self.tabBar addSubview:cusTomTabBar];
    self.customTabBar = cusTomTabBar;
  
}

-(void)addChildController{
 
    [self controllerWithString:@"LJFHallController" image:@"TabBar_LotteryHall" selegeImage:@"TabBar_LotteryHall_selected" controllerTitle:@"购彩大厅"];
    [self controllerWithString:@"LJFarenaController" image:@"TabBar_Arena" selegeImage:@"TabBar_Arena_selected" controllerTitle:@"竟技场"];
    [self controllerWithString:@"LJFDiscoverController" image:@"TabBar_Discovery" selegeImage:@"TabBar_Discovery_selected" controllerTitle:@"发现"];
    [self controllerWithString:@"LJFHistoryController" image:@"TabBar_History" selegeImage:@"TabBar_History_selected" controllerTitle:@"开奖信息"];
    [self controllerWithString:@"LJFMineController" image:@"TabBar_MyLottery" selegeImage:@"TabBar_MyLottery_selected" controllerTitle:@"我的信息"];

}

//添加子控制器
-(UIViewController *)controllerWithString:(NSString *)name image:(NSString *)image
    selegeImage:(NSString *)selegeImage controllerTitle:(NSString *)title{
    
    //通storyboard加载控制器
    UIStoryboard * stry = [UIStoryboard storyboardWithName:name bundle:nil];
    UIViewController * Vc = [stry instantiateInitialViewController];
    
    //设置导航控制器navigationItem.title
    Vc.navigationItem.title = title;
    
    //设置控制器tabBarItem.title
    Vc.tabBarItem.title = title;
    
    //设置控制器及tabBar控制器的 title
    Vc.title = title;
    
    //设置不渲染普通image
    UIImage * imageMode = [UIImage imageNamed:image];
    imageMode = [imageMode imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Vc.tabBarItem.image =imageMode;
   
    //设置不渲染选择图片
    UIImage * selegateImageMode = [UIImage imageNamed:selegeImage];
    selegateImageMode = [selegateImageMode imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Vc.tabBarItem.selectedImage = selegateImageMode ;
    
    //向tabBar添加对应控制器的按钮
    [self.customTabBar addTabBarButtonWith:Vc.tabBarItem];
    
    //创建导航控制器
    LJFNavigationController* nav = [[LJFNavigationController alloc] initWithRootViewController:Vc];

    //判断是竟技场就单独处理
    if ([Vc isKindOfClass:[LJFarenaController class]]) {
        nav = [[UINavigationController alloc] initWithRootViewController:Vc];
    }
    
    //添加控制器
    [self addChildViewController:nav];

    return nil;
}

//删除系统的控件必须在这个方法里实现
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    for (UITabBar * bar in self.tabBar.subviews ) {
        if (![bar isKindOfClass:[LJFtabBar class]]) {
            [bar removeFromSuperview];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
