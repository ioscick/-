//
//  HonourVcManager.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/24.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "HonourVcManager.h"
#import "RequestHeader.h"
#import "HonourRequestData.h"

@implementation HonourVcManager

+ (void)postWithLoginNameStr:(NSString *)number password:(NSString *)size FWD:(NSString *)fwd success:(void (^)(id))success fail:(void (^)())fail{
    RequestHeader *header = [[RequestHeader alloc] initWithtrcode:fwd];
    NSDictionary *headerDict = [header HeaderDict];
    
    HonourRequestData *data = [[HonourRequestData alloc] initWithGetData:number passWord:size];
    NSDictionary *dataDict = data.dict;
    //    NSDictionary *paramer = [NSDictionary dictionaryWithObjectsAndKeys:@"data",dataDict,@"header",headerDict, nil];
    NSDictionary *paramer = @{@"data":dataDict,@"header":headerDict};
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramer options:NSJSONWritingPrettyPrinted error:nil];
    //
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSDictionary *parameters =@{@"content":jsonString};
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager POST:REQUESTURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
//        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail();
    }];
}

@end
