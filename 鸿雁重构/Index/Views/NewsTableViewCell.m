//
//  NewsTableViewCell.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/15.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.numberOfLines = 2;
        self.textLabel.font = [UIFont systemFontOfSize:15.0f];
        self.detailTextLabel.font = [UIFont systemFontOfSize:13];
        self.detailTextLabel.textColor = [UIColor grayColor];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    self.imageView.frame = CGRectMake(5.0f, 5.0f, 100.0f, 70.0f);
    self.textLabel.frame = CGRectMake(110.0f, 2.0f, self.frame.size.width - 110, 40.0f);
    self.detailTextLabel.frame = CGRectMake(self.textLabel.frame.origin.x, self.frame.size.height - 22.0f, 200.0f, 20.0f);
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 0.0f, self.frame.size.height - 1);
    CGContextAddLineToPoint(ctx, self.frame.size.width, self.frame.size.height - 1);
    CGContextSetStrokeColorWithColor(ctx, RGBCOLOR(190, 190, 190).CGColor);
    CGContextStrokePath(ctx);
}

@end
