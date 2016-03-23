//
//  UpButton.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/14.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "UpButton.h"

@implementation UpButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.titleLabel.hidden = NO;
    }
    return self;
}


- (void)layoutSubviews{
    self.titleLabel.frame = CGRectMake(0, 45, self.frame.size.width , 20);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.frame = CGRectMake(10.0f, 5.0f, self.frame.size.width - 20, self.frame.size.width - 20);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
