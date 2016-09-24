//
//  LJFLuckyController.m
//  彩票项目
//
//  Created by ljf on 16/8/31.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFLuckyController.h"
#import "LJFLuckyViewController.h"

@interface LJFLuckyController ()

@property (weak, nonatomic) IBOutlet UIImageView *topView;

@end

@implementation LJFLuckyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage * image1 = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage * image2 = [UIImage imageNamed:@"lucky_entry_light1"];
    //要执行动画的数组
    self.topView.animationImages = @[image1,image2];
    //动画持续时间
    self.topView.animationDuration = 1;
    //开始动画
    [self.topView startAnimating];

}


- (IBAction)luckyRotate:(UIButton *)sender {
    
    LJFLuckyViewController * contr = [[UIStoryboard storyboardWithName:@"lucky" bundle:nil] instantiateInitialViewController];
    
    [self.navigationController pushViewController:contr animated:YES];
}

@end
