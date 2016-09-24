//
//  AppDelegate.m
//  彩票项目
//
//  Created by ljf on 16/8/18.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "AppDelegate.h"
#import "LJFTabbarController.h"
#import "LJFNewFeatureController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    
    LJFTabbarController * tabbar = [[LJFTabbarController alloc] init];
    
    //加载软件info.plist
    NSDictionary *infoDict = [NSBundle mainBundle ].infoDictionary ;
    //获取软件版本号
    NSString * currentVersion = infoDict[@"CFBundleShortVersionString"];
    
    //获取偏好设置
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    //获取沙盒版本
    NSString * sendboxVersion = [defaults objectForKey:@"abc"];
    
    //比较版本
    //NSOrderedAscending:升序  NSOrderedSame:相等  NSOrderedDescending:降序
    if ([currentVersion compare:sendboxVersion] == NSOrderedDescending) {
       
        //保存当前软件版本
//        [defaults setObject:currentVersion forKey:@"abc"];
        //显示新特性
        LJFNewFeatureController * str = [[LJFNewFeatureController alloc] init];
       
        self.window.rootViewController = str;

    }else{
        
        self.window.rootViewController = tabbar;
 
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
