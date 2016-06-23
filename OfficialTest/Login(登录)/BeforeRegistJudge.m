//
//  BeforeRegistJudge.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "BeforeRegistJudge.h"
#import "Url_cons.h"
@implementation BeforeRegistJudge
{
    void (^result_block) (NSDictionary *leaveDetail);
}
-(instancetype)initWithMobile:(NSString *)mobile ResultBlock:(void (^)(NSDictionary *))result
{
    self = [super init];
    if (self ) {
        _mobile = mobile;
        result_block = result;
    }
    return self;

}
-(void)exec
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *dci = [[NSMutableDictionary alloc]init];
    [dci setValue:_mobile forKey:@"mobile"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:beforeRegistJudge parameters:dci success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (result_block) {
                        result_block(dict);
                    }

       
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
    }];

//    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    
//   
//        [params setObject:_mobile forKey:@"mobile"];
//
//
//    [self.net POST:beforeRegistJudge parameters:_mobile SectionObject:self success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        
//        NSString *Return ;
//        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//        Return = [[NSString alloc] initWithData:responseObject encoding:enc];
//        NSDictionary *dict=[self dictionaryWithJsonString:Return];
//        
//        
//        if (result_block) {
//            result_block(dict);
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
}
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
