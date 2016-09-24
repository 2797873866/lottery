//
//  LJFarenaController.m
//  彩票项目
//
//  Created by ljf on 16/8/18.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFarenaController.h"

@interface LJFarenaController ()

@property(nonatomic ,strong)UIView * viewOne;

@property(nonatomic ,strong)UIView * viewTwo;

@end

@implementation LJFarenaController

-(void)loadView{
  
    self.viewOne = [[UIView alloc] init];
     self.viewOne.frame = [UIScreen mainScreen].bounds;
     self.viewOne.backgroundColor = [UIColor redColor];
    self.view =  self.viewOne;
    
    self.viewTwo = [[UIView alloc] init];
    self.viewTwo.frame = [UIScreen mainScreen].bounds;
    self.viewTwo.backgroundColor = [UIColor yellowColor];
    
    ;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置navigationBar
    [self setNavigationBar];
    
    //添加分段控制器
    [self setSegmented];
    
}

-(void)setSegmented{
   
    NSArray * arr = @[@"足球",@"蓝球"];
    //创建分段控制
    UISegmentedControl * segmented = [[UISegmentedControl alloc] initWithItems:arr];
    //设置分段控制frame
    segmented.frame = CGRectMake(0, 0, 130, 35);
    
    //创建可变字典
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    //设置文字大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:25];
    //添加富文体属性
    [segmented setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    //添加选择后的字体颜色
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [segmented setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    //设置tintcolor颜色,tintcolor的颜色会影响字体默认颜色
    [segmented setTintColor:[UIColor colorWithRed:18/255.0 green:141/255.0 blue:141/255.0 alpha:255/255.0]];
    
    //设置背景图片
    [segmented setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //设置选择背景图片
    [segmented setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    //设置默认选择一个
    [segmented setSelectedSegmentIndex:0];
    
    //添加到navigationItme上
    self.navigationItem.titleView = segmented;
    
    //添加点击事件
    [segmented addTarget:self action:@selector(selectorViewWithSegmented:) forControlEvents:UIControlEventValueChanged];

}

//点击后执行的方法
-(void)selectorViewWithSegmented:(UISegmentedControl *)segmented {
    
    NSInteger integer = segmented.selectedSegmentIndex;
    
    if (integer==0) {
        self.view = self.viewOne;
    }else if(integer ==1 ){
        self.view = self.viewTwo;
    }
}

//设置navigationBar
-(void)setNavigationBar{
    //加载图片
    UIImage * image = [UIImage imageNamed:@"NLArenaNavBar64"];
    //获取图片大小
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    //设置拉伸范围
    UIEdgeInsets inset = UIEdgeInsetsMake(height * 0.2, width * 0.5, height * 0.2, width * 0.5);
    //输出拉伸图片
    image = [image resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    //设置navigationBar的背景图片
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
