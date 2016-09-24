//
//  LJFLuckyView.h
//  幸运转盘
//
//  Created by ljf on 16/9/1.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJFLuckyView : UIView

-(void)stateRotating;
-(void)stopRotating;

+(instancetype)luckyViewWithView;

@end
