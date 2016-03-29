//
//  ClassicalModel.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/28.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "ClassicalModel.h"

@implementation ClassicalModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [self init]) {
        self.path = dict[@"path"];
        self.title = dict[@"title"];
        self.imgUrl = dict[@"image"];
    }
    return self;
}

@end
