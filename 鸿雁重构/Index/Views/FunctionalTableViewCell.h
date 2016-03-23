//
//  FunctionalTableViewCell.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/14.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myblock)(NSInteger);

@interface FunctionalTableViewCell : UITableViewCell

@property (copy, nonatomic) myblock block;

- (instancetype)initWithImageArray:(NSArray *)imgArray;

@property (strong, nonatomic) NSMutableArray *buttonArray;

@end
