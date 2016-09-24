//
//  LJFNewFeatureController.m
//  彩票项目
//
//  Created by ljf on 16/9/2.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFNewFeatureController.h"
#import "LJFTabbarController.h"

@interface LJFNewFeatureController ()

@property(nonatomic ,weak )UIImageView * guideImage;

@property(nonatomic ,weak )UIImageView * largeImage;

@property(nonatomic ,weak )UIImageView * smallImage;


@end

@implementation LJFNewFeatureController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    //取消水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //取消垂直滚动条
    self.collectionView.showsVerticalScrollIndicator = NO;
    //允许分页
    self.collectionView.pagingEnabled = YES;
    //停用回弹效果
    self.collectionView.bounces = NO;
    
    
    
    [self setUpChiled];
    
}

-(void)setUpChiled{

    UIImageView * imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
      imageV.x = -190;
    [self.collectionView addSubview:imageV];
    
    //添加大图
    UIImageView * guideImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    guideImage.centerX = LJFScreen.size.width * 0.5;
    [self.collectionView addSubview:guideImage];
    self.guideImage = guideImage;
    
    //添加大文本
    UIImageView * largeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largeImage.centerX = LJFScreen.size.width * 0.5 ;
    largeImage.centerY = LJFScreen.size.height * 0.7 ;
    [self.collectionView addSubview:largeImage];
    self.largeImage = largeImage;
    
    //添加小文本
    UIImageView * smallImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    smallImage.centerX = LJFScreen.size.width *0.5 ;
    smallImage.centerY = LJFScreen.size.height * 0.8;
    [self.collectionView addSubview:smallImage];
    self.smallImage = smallImage;
    
    
    // 5.添加开始按钮
    UIButton *starBtn = [[UIButton alloc]init];
    [starBtn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
    [starBtn sizeToFit];
    starBtn.centerX = LJFScreen.size.width * 3.5;
    starBtn.y = LJFScreen.size.height * 0.9;
//    starBtn .backgroundColor = [UIColor blueColor];
    [self.collectionView addSubview:starBtn];
    
    [starBtn addTarget:self action:@selector(clickStart) forControlEvents:UIControlEventTouchUpInside];
}

-(void)clickStart{
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
     LJFTabbarController * tabbar = [[LJFTabbarController alloc] init];
    window.rootViewController = tabbar;
    [window makeKeyAndVisible];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    
    CGFloat  offSetX = self.collectionView.contentOffset.x;
    CGFloat  width = self.view.width;
    
    if (self.collectionView.contentOffset.x < self.guideImage.frame.origin.x) {
        width = -width;
    }

    self.guideImage.x = offSetX + width ;
    self.smallImage.x = offSetX + width ;
    self.largeImage.x = offSetX + width ;
    
    
    
    
    [UIView animateWithDuration:1 animations:^{
        
        self.guideImage.centerX = offSetX + LJFScreen.size.width *0.5 ;
        self.largeImage.centerX = offSetX + LJFScreen.size.width *0.5 ;
        self.smallImage.centerX = offSetX + LJFScreen.size.width *0.5 ;
        
        /*
        CGRect guideFrame = self.guideImage.frame;
        guideFrame.origin.x = guideFrame.origin.x + width;
        self.guideImage.frame= guideFrame;
        
        CGRect largeFrame = self.largeImage.frame;
        largeFrame.origin.x = guideFrame.origin.x + width;
        self.largeImage.frame= largeFrame;
        
        CGRect smallFrame = self.smallImage.frame;
        smallFrame.origin.x = smallFrame.origin.x + width;
        self.smallImage.frame= smallFrame;*/
    }];
    
    NSInteger page = self.collectionView.contentOffset.x / self.view.bounds.size.width + 1;
    
    NSString * guide = [NSString stringWithFormat:@"guide%ld",(long)page];
    NSString * large= [NSString stringWithFormat:@"guideLargeText%ld",(long)page];
    NSString * small = [NSString stringWithFormat:@"guideSmallText%ld",(long)page];
    
    self.guideImage.image  = [UIImage imageNamed:guide];
    self.largeImage.image = [UIImage imageNamed:large];
    self.smallImage.image = [UIImage imageNamed:small];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark <UICollectionViewDataSource>



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete
//    implementation, return the number of items
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //设置cell 的内容
    NSString * imageName = [NSString stringWithFormat:@"guide%ldBackground",(long)indexPath.row+1];
    UIImageView * ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    ImageView.frame = [UIScreen mainScreen].bounds;
    [cell.contentView addSubview:ImageView];
    
    return cell;
}




- (instancetype)init
{
    //初始布局类
    UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc] init];
    //cell同屏幕大小
    flow.itemSize = [UIScreen mainScreen].bounds.size;
    //水平最小间距 为 0 ;
    flow.minimumLineSpacing = 0;
    //设置cell 滚动方向
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal ;
    //    //同时设置上左下右边距
    flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self = [super initWithCollectionViewLayout:flow];
    if (self) {
    }
    return self;
}

@end
