//
//  HonourTableViewCell.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/24.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "HonourTableViewCell.h"

@implementation HonourTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.timeLabel];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 12, 100, 20)];
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textColor = HongYardColor;
    }
    return _timeLabel;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_timeLabel.frame.size.width + 40, 12, 100, 20)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, _timeLabel.frame.size.width + 20, 0);
    CGContextAddLineToPoint(context, _timeLabel.frame.size.width + 20, self.frame.size.height);
    CGContextSetStrokeColorWithColor(context, RGBCOLOR(199, 199, 199).CGColor);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, HongYardColor.CGColor);
    CGContextAddArc(context, _timeLabel.frame.size.width + 20, self.frame.size.height / 2, 5, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathFill);
}

@end
