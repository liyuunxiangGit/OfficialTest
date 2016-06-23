//
//  NetWork.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "NetWork.h"
#import "Url_cons.h"
#import "BaseSection.h"
@implementation NetWork
- (id)init{
    self = [super init];
    if (self) {
    }
    return self;
}
- (AFHTTPRequestOperationManager *)getManager{
    static AFHTTPRequestOperationManager *g_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_manager = [AFHTTPRequestOperationManager manager];
        g_manager.responseSerializer = [AFHTTPResponseSerializer serializer];    //加上这个是为了让返回的数据是二进制模式

        g_manager.operationQueue.maxConcurrentOperationCount = 10;
        
        g_manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"application/javascript",@"audio/amr",@"text/plain", nil];
        
    });
    
    return g_manager;
}
- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(id)parameters
                   SectionObject:( NetWork*)section
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
   
    WEAKSELF;
    
    return [[self getManager] POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *Return = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        if (Return == nil || [Return isEqual:[NSNull null]]) {
            //汉字转码
            NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
            Return = [[NSString alloc] initWithData:responseObject encoding:enc];
        }
        
        NSString *log;
        log =  [NSString stringWithFormat:@"返回:%@",Return];
        //            DDLogInfo(@"%@",log);
        NSLog(@"%@",log);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation,error);
    }];
}
//GET
- (AFHTTPRequestOperation *)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure{
    
  
    return [[self getManager] GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *Return = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        if (Return == nil || [Return isEqual:[NSNull null]]) {
            //汉字转码
            NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
            Return = [[NSString alloc] initWithData:responseObject encoding:enc];
        }
        
        NSString *log;
        log =  [NSString stringWithFormat:@"返回:%@",Return];
        NSLog(@"%@",log);
        
        success(operation,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation,error);
    }];
}

@end
