//
//  ModifiePwdNetWorkRequest.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/24.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "ModifiePwdNetWorkRequest.h"
#import "Url_cons.h"
@implementation ModifiePwdNetWorkRequest
{
    void (^result_block)(NSDictionary *modifiePwdResult);
}
-(instancetype)initWithNewPassword:(NSString *)newPwd ResultBlock:(void (^)(NSDictionary *))result
{
    if (self = [super init]) {
        _newpassword = newPwd;
        result_block = result;
    }
    return self;
}
-(void)exec
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *dci = [[NSMutableDictionary alloc]init];
    [dci setValue:_newpassword forKey:@"newpwd"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:ModifiedPwdOfficialUrl parameters:dci success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
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

