//
//  LoginNetWorkRequest.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/24.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "LoginNetWorkRequest.h"
#import "Url_cons.h"
@implementation LoginNetWorkRequest
{
    void (^result_block)(NSDictionary *loginResult);
}
-(instancetype)initWithMobile:(NSString *)mobile Pwd:(NSString *)pwd ResultBlock:(void (^)(NSDictionary *))result
{
    if (self = [super init]) {
        _mobile = mobile;
        _pwd = pwd;
        result_block = result;
    }
    return self;
}
-(void)exec
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *dci = [[NSMutableDictionary alloc]init];
    [dci setValue:_mobile forKey:@"mobile"];
    [dci setValue:_pwd forKey:@"pwd"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:LoginOfficialUrl parameters:dci success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (result_block) {
            result_block(dict);
        }
        
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
    }];

}
@end
