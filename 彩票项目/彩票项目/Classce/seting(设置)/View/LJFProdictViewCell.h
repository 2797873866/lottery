//
//  LJFProdictViewCell.h
//  彩票项目
//
//  Created by ljf on 16/8/31.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJFProductItem.h"

@interface LJFProdictViewCell : UICollectionViewCell

@property (nonatomic,strong) LJFProductItem * item ;

+(instancetype)cellWithCollectionView:(UICollectionView *)CollectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
