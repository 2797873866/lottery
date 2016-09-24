//
//  LJFCollectionViewController.m
//  彩票项目
//
//  Created by ljf on 16/8/31.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFProductViewController.h"
#import "LJFProdictViewCell.h"

@interface LJFProductViewController ()

@property (nonatomic ,strong)NSMutableArray * arrayM;

@end

@implementation LJFProductViewController

-(NSMutableArray *)arrayM{
    
    NSBundle * maibundle = [NSBundle mainBundle];
    NSString * path = [maibundle pathForResource:@"products.json" ofType:nil];
    NSData * data = [NSData dataWithContentsOfFile:path];
    NSArray * array= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray* arrayM = [NSMutableArray array];
    for (NSDictionary * dict  in array) {
        LJFProductItem * item = [LJFProductItem productWithDict:dict];
        
        [arrayM addObject:item];
    }
    _arrayM = arrayM;
    return _arrayM;
}

-(instancetype)init{
    
    UICollectionViewFlowLayout * flowView = [[UICollectionViewFlowLayout alloc] init];
    if (self = [super initWithCollectionViewLayout:flowView]) {
        
    }
    
    flowView.itemSize = CGSizeMake(70 , 70);
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    UINib * nib = [UINib nibWithNibName:@"LJFProdictNib" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"identifer"];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.arrayM.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LJFProductItem * modle = self.arrayM[indexPath.row];

    LJFProdictViewCell * Cell= [LJFProdictViewCell cellWithCollectionView:collectionView cellForItemAtIndexPath:indexPath];
        Cell.item = modle;
    
    return Cell;
}



@end
