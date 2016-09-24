//
//  LJFProductItem.m
//  彩票项目
//
//  Created by ljf on 16/8/31.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFProductItem.h"

@implementation LJFProductItem


+(instancetype)productWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}
/*
 "title": "网易电影票",
 "id": "com.netease.movie",
 "url": "http://itunes.apple.com/app/id583784224?mt=8",
 "icon": "movie",
 "customUrl": "movieticket163"
 
 */

//因为有id 所以目前只能手动输入
-(instancetype)initWithDict:(NSDictionary *)dict{
    
    LJFProductItem * item = [[LJFProductItem alloc] init];
    item.title = dict[@"title"];
    item.identifer = dict[@"id"];
    item.url = dict[@"url"];
    item.icon = dict[@"icon"];
    item.customUrl = dict[@"customUrl"];
    
    return  item;
}
@end
