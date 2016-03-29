//
//  ClassicalModel.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/28.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassicalModel : NSObject

@property (copy, nonatomic) NSString *imgUrl;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *path;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
