//
//  LJFSetingController.m
//  彩票项目
//
//  Created by ljf on 16/8/26.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFBaseViewController.h"
#import "ljfsetingModle.h"
#import "LJFTableViewCell.h"


@interface LJFBaseViewController ()


@end

@implementation LJFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置控制器标题
    self.title = @"设置";
    
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

-(NSArray *)datas{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.datas[section] count];;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray * group = self.datas[indexPath.section ];
    LJFSetingModle * modle = group[indexPath.row];
    
    LJFTableViewCell * cell = [LJFTableViewCell tableCellWithModel:tableView];
    cell.setItem = modle;
    
    return cell;
}



//重写init,自定义cell
-(instancetype)init{
    
    //初始化为分组样式
    if (self= [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return  self;
}

//重写initWithStyle,自定义cell
-(instancetype)initWithStyle:(UITableViewStyle)style{
    
    if (self = [super initWithStyle: UITableViewStyleGrouped]) {
        
    }
    return self;
}


@end
