//
//  UserModel.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/23.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (copy, nonatomic) NSString *LoginName;
@property (copy, nonatomic) NSString *cydm;
@property (copy, nonatomic) NSString *lxhd;
@property (copy, nonatomic) NSString *txdz;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *type;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
