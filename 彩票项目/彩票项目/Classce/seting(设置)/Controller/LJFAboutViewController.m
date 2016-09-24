//
//  LJFAboutViewController.m
//  彩票项目
//
//  Created by ljf on 16/8/31.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFAboutViewController.h"
#import "LJFSetingModleArrow.h"

@interface LJFAboutViewController ()

@end

@implementation LJFAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGroup];

    UIView * view = [[[NSBundle mainBundle] loadNibNamed:@"LJFAboutHeaderView" owner:nil options:nil] lastObject];
    
    self.tableView.tableHeaderView = view;

}

-(void)addGroup{
    LJFSetingModleArrow * item1 = [LJFSetingModleArrow itemWithImageName:nil title:@"评分支持"];
    LJFSetingModleArrow * item2 = [LJFSetingModleArrow itemWithImageName:nil title:@"客服电话"];
    item2.detailTextLabel = @"88888888";

    [self.datas addObject:@[item1,item2]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


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
