//
//  LJFTableViewCell.h
//  彩票项目
//
//  Created by ljf on 16/8/29.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJFSetingModle.h"

@interface LJFTableViewCell : UITableViewCell

@property (nonatomic, strong) LJFSetingModle * setItem;

+(instancetype)tableCellWithModel:(UITableView *)TableView;

@end
