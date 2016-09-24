//
//  LJFMiineController.m
//  彩票项目
//
//  Created by ljf on 16/8/18.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFMineController.h"
#import "LJFSetingController.h"

@interface LJFMineController ()

@end

@implementation LJFMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置客服左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem BarbuttonWithTitle:@"客服" NormalImage:@"FBMM_Barbutton" HigImage:nil Target:nil action:nil];
    //设置客服右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem BarbuttonWithTitle:@"设置" NormalImage:@"Mylottery_config" HigImage:nil Target:self action:@selector(setingView)];
}

-(void)setingView{
  
//    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"LJFSeting" bundle:nil];
    
    LJFSetingController * str = [[LJFSetingController alloc] initWithStyle:UITableViewStyleGrouped];
    str.view.frame = [UIScreen mainScreen].bounds;
    
    [self.navigationController pushViewController:str animated:YES];
    
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
