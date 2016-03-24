//
//  HonourModel.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/24.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "HonourModel.h"

@implementation HonourModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [self init]) {
        self.honor_date = dict[@"honor_date"];
        self.introduction = dict[@"introduction"];
        self.content = dict[@"content"];
    }
    return self;
}

@end
