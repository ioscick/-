//
//  HonourRequestData.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/24.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "HonourRequestData.h"

@implementation HonourRequestData

- (instancetype)initWithGetData:(NSString *)number passWord:(NSString *)size{
    if (self = [self init]) {
        self.number = number;
        self.size = size;
    }
    return self;
}

- (NSDictionary *)dict{
    if (_dict == nil) {
        NSArray *array1 = @[@"page_number", @"page_size", @"need_paginate"];
        NSArray *array2 = @[self.number, self.size, @"true"];
        _dict = [NSDictionary dictionaryWithObjects:array2 forKeys:array1];
    }
    return _dict;
}
@end
