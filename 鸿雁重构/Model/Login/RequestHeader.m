//
//  RequestHeader.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/22.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "RequestHeader.h"

@implementation RequestHeader

- (instancetype)initWithtrcode:(NSString *)trcode {
    if (self = [self init]){
        self.trcode = trcode;
    }
    return self;
}

- (instancetype)initWithappseq:(NSString *)appseq{
    if (self = [self init]){
        self.appseq = appseq;
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]){
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *trdate = [formatter stringFromDate:[NSDate date]];
        self.trdate =trdate;
        self.appseq = @"";
    }
    return self;
}

- (NSDictionary *)HeaderDict{
    NSArray *headerArry = @[@"appseq", @"trcode", @"trdate"];
    NSArray *headerArry2 = @[self.appseq,self.trcode,self.trdate];
    NSDictionary *headerDict = [[NSDictionary alloc] initWithObjects:headerArry2 forKeys:headerArry];
    return headerDict;
}
@end
