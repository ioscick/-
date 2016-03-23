//
//  NewsHeaderView.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/15.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "NewsHeaderView.h"

@interface NewsHeaderView ()

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation NewsHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 20)];
        _titleLabel.text = @"公司动态";
        _titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    }
    return _titleLabel;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 0.0f, self.frame.size.height - 0.5);
    CGContextAddLineToPoint(ctx, self.frame.size.width, self.frame.size.height - 0.5);
    CGContextSetStrokeColorWithColor(ctx, RGBCOLOR(210, 210, 210).CGColor);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, 0.0f, 1.0f);
    CGContextAddLineToPoint(ctx, self.frame.size.width, 1);
    CGContextSetStrokeColorWithColor(ctx, RGBCOLOR(210, 210, 210).CGColor);
    CGContextStrokePath(ctx);
    
    CGContextRef ctx1 = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx1, RGBCOLOR(0, 157, 133).CGColor);
    CGContextFillRect(ctx1, CGRectMake(0, 0, 10.0f, self.frame.size.height));
    CGContextDrawPath(ctx1, kCGPathFillStroke);
};

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
