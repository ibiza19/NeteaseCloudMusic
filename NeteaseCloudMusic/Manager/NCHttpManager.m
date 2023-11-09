//
//  NCHttpManager.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/5/23.
//

#import "NCHttpManager.h"
#import "AFNetworking/AFNetworking.h"

// 网易云音乐api搭建的url
#define kBaseUrl @"https://service-osii6x8s-1311271159.gz.apigw.tencentcs.com/releas/"



@implementation NCHttpManager

+ (instancetype)sharedManager {
    static NCHttpManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];
    });
    return manager;
}

- (void)get:(NSString *)api
     params:(NSDictionary *)params
successBlock:(NCHttpManagerFinishSuccessBlock)successBlock
failureBlock:(NCHttpManagerFinishFailureBlock)failureBlock {
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString *url = [kBaseUrl stringByAppendingString:api];
    
    // 解决链接中有中文出现报错
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSLog(@"%@", [successBlock class]);

    
    [manager GET:url parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

@end
