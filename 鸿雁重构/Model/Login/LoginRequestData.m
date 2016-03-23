//
//  LoginRequestData.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/22.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "LoginRequestData.h"

@implementation LoginRequestData

- (instancetype)initWithGetData:(NSString *)loginName passWord:(NSString *)password{
    if (self = [self init]){
        self.loginName = loginName;
        self.password = password;
    }
    return self;
}

- (NSDictionary *)dict{
    if (_dict == nil) {
        NSArray *array1 = @[@"loginName", @"password"];
        NSArray *array2 = @[self.loginName, self.password];
        _dict = [NSDictionary dictionaryWithObjects:array2 forKeys:array1];
    }
    return _dict;
}
@end
