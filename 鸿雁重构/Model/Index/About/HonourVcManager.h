//
//  HonourVcManager.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/24.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HonourVcManager : NSObject

+ (void)postWithLoginNameStr:(NSString *)number password:(NSString *)size FWD:(NSString *)fwd success:(void (^)(id json))success fail:(void (^)())fail;

@end
