//
//  MessageView.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/23.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageView : UIView

@property (strong, nonatomic) UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame Text:(NSString *)text;

@end
