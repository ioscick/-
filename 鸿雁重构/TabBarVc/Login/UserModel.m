//
//  UserModel.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/23.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [self init]) {
        self.LoginName = dict[@"loginName"];
        self.name = dict[@"name"];
        self.lxhd = dict[@"dl_lxdh"];
        self.txdz = dict[@"dl_txdz"];
        self.type = dict[@"type"];
        self.cydm = dict[@"dl_cydm"];
    }
    return self;
}
@end
