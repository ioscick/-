//
//  FunctionalTableViewCell.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/14.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "FunctionalTableViewCell.h"
#import "UpButton.h"

@implementation FunctionalTableViewCell

- (instancetype)initWithImageArray:(NSArray *)imgArray{
    if (self = [super init]) {

    }
    return self;
}

- (void)layoutSubviews{
    if (_buttonArray.count) {
        return;
    }
    CGFloat space = (self.frame.size.width - 240) / 5;
    for (int i = 0; i < 6; i++) {
        UpButton *button = [[UpButton alloc] initWithFrame:CGRectMake(space + i % 4 * (space + 60), i / 4 * 70, 60, 70)];
        button.imageView.image = [UIImage imageNamed:@"zlfkmsg_img_zlfk"];
        button.tag = i;
        [button setTitle:@"关于鸿雁" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button setTitleColor:RGBCOLOR(0, 149, 133) forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTapedItem:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.buttonArray addObject:button];
    }

}

- (void)buttonTapedItem:(UpButton *)sender{
    UpButton *button = (UpButton *)sender;
    self.block(button.tag);
}

- (NSMutableArray *)buttonArray{
    if (_buttonArray == nil) {
        _buttonArray = [[NSMutableArray alloc] init];
    }
    return _buttonArray;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
