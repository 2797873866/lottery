//
//  LJFProdictViewCell.m
//  彩票项目
//
//  Created by ljf on 16/8/31.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFProdictViewCell.h"

@interface LJFProdictViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *title;

@end


@implementation LJFProdictViewCell



+(instancetype)cellWithCollectionView:(UICollectionView *)CollectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LJFProdictViewCell * cell = [CollectionView dequeueReusableCellWithReuseIdentifier:@"identifer" forIndexPath:indexPath];
    
    CollectionView.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

-(void)setItem:(LJFProductItem *)item{
    
    _item = item;

    self.title.text = item.title;
    self.icon.image = [UIImage imageNamed:item.icon];
}
@end
