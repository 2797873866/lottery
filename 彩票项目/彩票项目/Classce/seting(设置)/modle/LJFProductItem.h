//
//  LJFProductItem.h
//  彩票项目
//
//  Created by ljf on 16/8/31.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJFProductItem : NSObject

/*
 "title": "网易电影票",
 "id": "com.netease.movie",
 "url": "http://itunes.apple.com/app/id583784224?mt=8",
 "icon": "movie",
 "customUrl": "movieticket163"

 */
@property (nonatomic ,copy) NSString* title;
@property (nonatomic ,copy) NSString* url;
@property (nonatomic ,copy) NSString* icon;
@property (nonatomic ,copy) NSString* customUrl;
@property (nonatomic ,copy) NSString* identifer;


+(instancetype)productWithDict:(NSDictionary *)dict;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
