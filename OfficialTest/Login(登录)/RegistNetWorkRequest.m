//
//  RegistNetWorkRequest.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "RegistNetWorkRequest.h"
#import "Url_cons.h"
#import "MBProgressHUD.h"
@implementation RegistNetWorkRequest
{
    void (^result_block)(NSDictionary *registInformation);
}
-(instancetype)initWithMobile:(NSString *)mobile pwd:(NSString *)pwd nikeName:(NSString *)nikeName ResultBlock:(void (^)(NSDictionary *))result
{
    if (self = [super init]) {
        _mobile = mobile;
        _pwd = pwd;
        _nikeName = nikeName;
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
    [dci setValue:_nikeName forKey:@"nickname"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:RegistOfficialURL parameters:dci success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
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
