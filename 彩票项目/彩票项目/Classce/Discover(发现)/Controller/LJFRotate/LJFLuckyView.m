//
//  LJFLuckyView.m
//  幸运转盘
//
//  Created by ljf on 16/9/1.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFLuckyView.h"
#import "LJFLuckyButton.h"


@interface LJFLuckyView ()

@property (weak, nonatomic) IBOutlet UIImageView *luckyRotate;

@property (nonatomic , strong)CABasicAnimation *basic;

@property (nonatomic , strong)CADisplayLink *link;

@property(nonatomic, weak)LJFLuckyButton * bu;

@end

@implementation LJFLuckyView



/*
 - (instancetype)initWithCoder:(NSCoder *)aDecoder
 {
 self = [super initWithCoder:aDecoder];
 if (self) {
 #warning 注意:在initWithCoder中,系统连线的(IBOutlet)还没有连好,所以不能在initWithCoder中访问我们的插座(IBOutlet)
 UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
 [self.luckyRotateView addSubview:btn];
 }
 return self;
 }
 */


-(void)awakeFromNib{
    
        UIImage * norImage = [UIImage imageNamed:@"LuckyAstrology"];
        UIImage * selelecteImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    for (int i =0; i < 12; i++) {
            
        LJFLuckyButton * bu = [[LJFLuckyButton alloc]init];
        //设置背景图片
       [bu setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        //设置按钮大小
        bu.frame = CGRectMake(0, 0, 68, 143);
        bu.bounds = CGRectMake(0, 0, 68, 143);
        // 设置layer
        //设置锚点
        bu.layer.anchorPoint = CGPointMake(0.5, 1);
        //设置在父控件的位置
        bu.layer.position = CGPointMake(self.frame.size.width*0.5, self.frame.size.height *0.5);
        //添加到父控件
        [self.luckyRotate addSubview:bu];
        //添加事件
        [bu addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        //30度 * i / 180.0 *M_PI = 弧度 .
        bu.transform = CGAffineTransformMakeRotation(30*i/180.0 *M_PI);
        
//        设置按钮普通状态图片
        //计算裁剪范围
        CGFloat imageW = (norImage.size.width /12 )*2;//[UIScreen mainScreen].scale ;
        CGFloat imageH = norImage.size.height *2;//[UIScreen mainScreen].scale;
        CGFloat imageX = imageW * i;
        CGFloat imageY = 0 ;
        CGRect smallRect = CGRectMake(imageX, imageY, imageW, imageH);
        //裁剪图片
        CGImageRef cgImage = CGImageCreateWithImageInRect([norImage CGImage], smallRect);
        //接收裁剪图片
       UIImage * norImage = [UIImage imageWithCGImage:cgImage];
        //设置按钮的图片
        [bu setImage:norImage forState:UIControlStateNormal];
        [bu setTitle:@"ljf" forState:UIControlStateNormal];
        
            //裁剪选种图片
        //计算裁剪范围
        CGFloat seImageW = (selelecteImage.size.width /12 )*2;//[UIScreen mainScreen].scale ;
        CGFloat seImageH = selelecteImage.size.height *2;//[UIScreen mainScreen].scale;
        CGFloat seImageX = seImageW * i;
        CGFloat seImageY = 0 ;
        CGRect selRect = CGRectMake(seImageX, seImageY, seImageW, seImageH);
        //裁剪图片
        CGImageRef selImage = CGImageCreateWithImageInRect([selelecteImage CGImage], selRect);
       UIImage * selelecteImage2 = [UIImage imageWithCGImage:selImage];
        [bu setImage:selelecteImage2 forState:UIControlStateSelected];
    }
}

//记录点击状态,取消上一个按钮的点击状态
-(void)buttonClick:(LJFLuckyButton *)bu{
    self.bu.selected = NO;
    self.bu = bu;
    self.bu.selected = YES;
}

//加载xib
+(instancetype)luckyViewWithView{
    
    LJFLuckyView * view = [[[NSBundle mainBundle] loadNibNamed:@"LJFlucky" owner:nil options:nil]lastObject];
      return view;
}

//transform动画是真动画,控件再动
-(void)stateRotating{
    
    //判断动画是否存在
    if (self.link) return;
    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:self selector:@selector(upDate)];
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    self.link = link;
    }

-(void)upDate{
   
    self.luckyRotate.transform = CGAffineTransformRotate(self.luckyRotate.transform, M_PI/ 600);
    
}

-(void)stopRotating{
    
//    [self.luckyRotate.layer removeFromSuperlayer];
//    self.basic = nil;
    //移除慢动画
    [self.link invalidate];
    self.link = nil;
   
    
    }

//开始选号
- (IBAction)stateLucky:(UIButton *)sender {
    
    //移除慢动画
    [self.link invalidate];
    self.link = nil;
    
    
    self.userInteractionEnabled  = NO;
    
    CABasicAnimation * basic = [CABasicAnimation animation];
    basic.keyPath = @"transform.rotation";
    //转5圈
    basic.toValue = @(2*M_PI *5);
    //待续时间
    basic.duration = 5;
    //开头结尾慢,中间快
    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    //动来完成后要做的事==>叫代理一来做
    basic.delegate = self;

    
    self.basic = basic;
    //添加动画
    [self.luckyRotate.layer addAnimation:basic forKey:nil];
}

//动画完成后要执行的
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    self.userInteractionEnabled = YES;
    //延时3 秒执行动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self stateRotating];
    });
}
@end
