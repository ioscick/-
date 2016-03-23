//
//  MessageView.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/23.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "MessageView.h"

@implementation MessageView

- (instancetype)initWithFrame:(CGRect)frame Text:(NSString *)text;{
    if (self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor grayColor];
        [self addSubview:self.label];
        _label.text = text;
        
        [self.layer masksToBounds];
        [self.layer setCornerRadius:5];
        
        [UIView animateWithDuration:2 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
    return self;
}

- (UILabel *)label{
    if (_label == nil){
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 200, 20)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor whiteColor];
    }
    return _label;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
