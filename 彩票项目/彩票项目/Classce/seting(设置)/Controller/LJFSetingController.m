//
//  LJFSetingController.m
//  彩票项目
//
//  Created by ljf on 16/8/26.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFSetingController.h"
#import "ljfsetingModle.h"
#import "LJFTableViewCell.h"
#import "LJFSetingModleSwitchItem.h"
#import "LJFSetingModleLabell.h"
#import "LJFAboutViewController.h"
#import "LJFSetingModleArrow.h"
#import "LJFPushViewController.h"
#import "LJFProductViewController.h"

@interface LJFSetingController ()


@end

@implementation LJFSetingController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置控制器标题
    self.title = @"设置";
    [self addGroup];
    
}

//点击cell时调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSArray * group = self.datas[indexPath.section];
    LJFSetingModle * modle = group[indexPath.row];
    
    if (modle.option != nil) {
        modle.option();
    }
}

//取消cell点击时调用
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}

#pragma mark 数组懒加载

-(void)addGroup{
    
    NSBundle * mainbundle = [NSBundle mainBundle];
    NSString * path = [mainbundle pathForResource:@"LJFSeting.plist" ofType:nil];
    NSArray  * pathArray = [NSArray arrayWithContentsOfFile:path];
    
    
    
     NSArray * groupOne =[self addGroupOne:pathArray[0]];
     NSArray * groupTwo =[self addGroupTwo:pathArray[1]];
     NSArray * groupThree =[self addGroupThree:pathArray[2]];

    //baseView的数组
    self.datas = (NSMutableArray* )@[groupOne,groupTwo,groupThree];
    
    
}
//添加组一
-(NSArray*)addGroupOne:(NSArray *)array{
    
    NSMutableArray * arrayM = [NSMutableArray array];
    
    for (NSDictionary * dict in array) {
        LJFSetingModleArrow * arrow = [LJFSetingModleArrow SetingWidthDict:dict];
        [arrayM addObject:arrow];
    }
    return arrayM;
}

//添加组二
-(NSArray *)addGroupTwo:(NSArray*)array{
   
    NSMutableArray * arrayM = [NSMutableArray array];
    for (NSDictionary * dict in array) {
        LJFSetingModleSwitchItem * switchItem = [LJFSetingModleSwitchItem SetingWidthDict:dict];
        [arrayM addObject:switchItem];
    }
    return arrayM;
}

//添加组三
-(NSArray *)addGroupThree:(NSArray*)array{
  
    NSMutableArray * arrayM = [NSMutableArray array];//
    for (NSDictionary * dict in array) {
        LJFSetingModleArrow * labell = [LJFSetingModleArrow SetingWidthDict:dict];
        
        if ([labell.name isEqualToString:@"检查新版本"]) {
            
    __weak typeof(labell) weakLabell = labell;//labell 弱引用
        weakLabell.option = ^(){
            //功能1
            UIAlertAction * noAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //可以做更多下一步操作
            }];
            
            //功能2
            UIAlertAction * IsAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //可以做更多下一步操作
            }];
            //创建警告控制器
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"检查新版本" message:@"信息" preferredStyle:UIAlertControllerStyleAlert];
            //添加功能
            [alert addAction:noAction];
            [alert addAction:IsAction];
            //显示警告控制器控制器
            __weak typeof(self) weakSelf = self;//self 弱引用
            [weakSelf.navigationController presentViewController:alert animated:YES completion:nil];
        };
    }
        if ([labell.name isEqualToString:@"分享"]) {
            
            __weak typeof(labell) weaklabell = labell;//labell 弱引用
            weaklabell.option = ^(){
                LJFPushViewController *push = [[LJFPushViewController alloc] init];
                push.title = @"分享";
                __weak typeof(self) weakSelf = self;//self 弱引用
                [weakSelf.navigationController pushViewController:push animated:YES];
            };
        }
        if ([labell.name isEqualToString:@"关于"]) {
            
            __weak typeof(labell) weaklabell = labell;//labell 弱引用
            weaklabell.option = ^(){
          LJFAboutViewController *push = [[LJFAboutViewController alloc] init];
                push.title = @"关于";
                __weak typeof(self) weakSelf = self;//self 弱引用
                [weakSelf.navigationController pushViewController:push animated:YES];
            };
        }
        if ([labell.name isEqualToString:@"产品推荐"]) {
            
            __weak typeof(labell) weaklabell = labell;//labell 弱引用
            weaklabell.option = ^(){
                LJFProductViewController *push = [[LJFProductViewController alloc] init];
                push.title = @"产品推荐";
                __weak typeof(self) weakSelf = self;//self 弱引用
                [weakSelf.navigationController pushViewController:push animated:YES];
            };
        }

            [arrayM addObject:labell];
    }
    return arrayM;
}




@end
