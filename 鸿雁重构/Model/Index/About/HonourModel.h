//
//  HonourModel.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/24.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HonourModel : NSObject

@property (copy, nonatomic) NSString *honor_date;
@property (copy, nonatomic) NSString *introduction;
@property (copy, nonatomic) NSString *content;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
