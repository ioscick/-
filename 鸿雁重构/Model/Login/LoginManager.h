//
//  LoginManager.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/22.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginManager : NSObject

+ (void)postWithLoginNameStr:(NSString *)loginName password:(NSString *)loginPassword success:(void (^)(id json))success fail:(void (^)())fail;

@end
