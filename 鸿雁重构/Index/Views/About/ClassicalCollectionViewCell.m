//
//  ClassicalCollectionViewCell.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/28.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "ClassicalCollectionViewCell.h"

@implementation ClassicalCollectionViewCell

//- (instancetype)initWithFrame:(CGRect)frame ImgUrl:(NSString *)imgUrl{
//    if (self = [super initWithFrame:frame]) {
//        [self addSubview:self.imageView];
//    }
//    return self;
//}
//
- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return _imageView;
}

- (void)imgViewSet{
    if (_imageView == nil) {
        [self addSubview:self.imageView];
    }
}

@end
