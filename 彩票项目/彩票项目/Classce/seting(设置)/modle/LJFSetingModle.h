//
//  LJFSetingModle.h
//  彩票项目
//
//  Created by ljf on 16/8/28.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJFSetingModle : NSObject

@property (nonatomic ,copy) NSString * name;

@property (nonatomic ,copy) NSString * detailTextLabel;

@property (nonatomic ,strong) UIImage * icon;




@property (nonatomic ,copy) void (^option)();

+(instancetype)SetingWidthDict:(NSDictionary *)dict;

+(instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title;


@end
