//
//  LJFTableViewCell.m
//  彩票项目
//
//  Created by ljf on 16/8/29.
//  Copyright © 2016年 LJF. All rights reserved.

#import "LJFTableViewCell.h"
#import "LJFSetingModleArrow.h"
#import "LJFSetingModleLabell.h"
#import "LJFSetingModleSwitchItem.h"

@interface LJFTableViewCell ()

@property(nonatomic ,strong )UISwitch * SwitchItem;
@property(nonatomic ,strong )UILabel * labell;
@property(nonatomic ,strong )UIImageView * arrow;

@end



@implementation LJFTableViewCell

+(instancetype)tableCellWithModel:(UITableView *)TableView{
    
    NSString * identifier = @"id";
    LJFTableViewCell * cell = [TableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell==nil) {
        cell = [[LJFTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    return  cell;
}

//重写set方法
-(void)setSetItem:(LJFSetingModle *)setItem{
  
    _setItem = setItem; 
    //在这里把数据给cell
    self.textLabel.text = setItem.name;
    self.imageView.image = setItem.icon;
    self.detailTextLabel.text = setItem.detailTextLabel;
    
    //设置cell 右边的View
    [self setRightView];
}


-(void)setRightView{
    if ([self.setItem isKindOfClass:[LJFSetingModleLabell class]]) {
        self.accessoryView = self.labell;
    }else if ([self.setItem isKindOfClass:[LJFSetingModleSwitchItem class]]){
        
        LJFSetingModleSwitchItem * item = (LJFSetingModleSwitchItem *)self.setItem;
        self.SwitchItem.on = NO;
        self.SwitchItem.on = item.open;
        self.accessoryView = self.SwitchItem;
        
    }else if ([self.setItem isKindOfClass:[LJFSetingModleArrow class]]){
        UIImageView * imageView = self.arrow;
        self.accessoryView = imageView;
    }else {
        self.accessoryView = nil;
    }
}



-(UISwitch *)SwitchItem{
    
    if (_SwitchItem ==nil) {
        _SwitchItem = [[UISwitch alloc] init];
    }
    return  _SwitchItem;
}

-(UILabel *)labell{
 
    if (_labell ==nil) {
        _labell = [[UILabel alloc] init];
    }
    return  _labell;
}


-(UIImageView *)arrow{
   
    if (_arrow == nil) {
        _arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return  _arrow;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
