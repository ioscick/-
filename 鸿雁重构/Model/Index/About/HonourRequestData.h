//
//  HonourRequestData.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/24.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HonourRequestData : NSObject

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *size;
@property (strong, nonatomic) NSDictionary *dict;

- (instancetype)initWithGetData:(NSString *)number passWord:(NSString *)size;

@end
