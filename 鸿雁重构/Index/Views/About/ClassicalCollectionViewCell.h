//
//  ClassicalCollectionViewCell.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/28.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassicalCollectionViewCell : UICollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame ImgUrl:(NSString *)imgUrl;

@property (strong, nonatomic) UIImageView *imageView;

- (void)imgViewSet;

@end
