//
//  RequestHeader.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/22.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestHeader : NSObject

@property (nonatomic, strong) NSString *trdate;
@property (nonatomic, strong) NSString *trcode;
@property (nonatomic, strong) NSString *appseq;

- (instancetype)initWithtrcode:(NSString *)trcode;
- (instancetype)init;

- (NSDictionary *)HeaderDict;

@end
