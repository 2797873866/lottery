//
//  LJFNavigationController.m
//  彩票项目
//
//  Created by ljf on 16/8/23.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFNavigationController.h"

@interface LJFNavigationController ()

@end

@implementation LJFNavigationController

//只会调用一次
+ (void)initialize
{
    //设置导航条的背景图片
    UINavigationBar * navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    UIImage * image = [UIImage imageNamed:@"NavBar64"];
    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航控制器标题文字的颜色
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    //修改字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:25];
    [navBar setTitleTextAttributes:dict];
}

//push影藏底部栏
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    // 注意:如果是栈底控制器,不需要隐藏tabBar
    // 1.第一次 --> 购彩大厅 , 此时count = 0
    // 2.第二次 --> 子界面 , 此时count = 1
    
    if (self.viewControllers.count >0) {
        //hidesBottomBarWhenPushed 只对系统的控件起作用,自定义的使用没有效果
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem BarbuttonWithTitle:nil NormalImage:@"NavBack" HigImage:nil Target:self action:@selector(popViewControll)];
                                                       
    //不能与上面代码写反了
    [super pushViewController:viewController animated:animated];
}

-(void)popViewControll{
    
    [self popViewControllerAnimated:YES];
}


//会高用5 次
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置navigationBar的背景图片
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
