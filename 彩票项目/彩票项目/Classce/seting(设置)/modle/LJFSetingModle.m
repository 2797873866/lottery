//
//  LJFSetingModle.m
//  彩票项目
//
//  Created by ljf on 16/8/28.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFSetingModle.h"

@implementation LJFSetingModle

+(instancetype)SetingWidthDict:(NSDictionary *)dict{
    
    LJFSetingModle * set = [[self alloc] init];
    
    [set setValuesForKeysWithDictionary:dict];
    
    return set;
}





+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title
{

    LJFSetingModle *item = [[self alloc] init];

    item.icon = [UIImage imageNamed:imageName];
      item.name = title;
        return item;
}


-(void)setIcon:(NSString *)icon{
    
    _icon = [UIImage imageNamed:icon];

}

//重写这名代码,字典多于模型不会崩溃.
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}



@end
