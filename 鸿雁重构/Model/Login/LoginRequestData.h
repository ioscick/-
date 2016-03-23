//
//  LoginRequestData.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/22.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginRequestData : NSObject

@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *loginName;
@property (strong, nonatomic) NSDictionary *dict;

- (instancetype)initWithGetData:(NSString *)loginName passWord:(NSString *)password;


@end
