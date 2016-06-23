//
//  SHInvoker.h
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import <Foundation/Foundation.h>
//纬度
#define SHInvokerUserInfoAmount @"latitude"
//经度
#define SHInvokerUserInfoBusibussId @"longitude"
#define SHInvokerUserInfoCity @"sex"
#define SHInvokerUserInfoCityId @"name"
#define SHInvokerUserInfoPhoneNo @"phone" //电话
#define SHInvokerUserInfoStatus @"password"  //身份
#define SHInvokerUserInfoUserId @"userid"      //用户ID
#define SHInvokerUserInfoAdd @"address"
#define SHInvokerUserInfolocationSign @"sign"

#define SHNotificationNewOrderComeIn @"SHNotificationNewOrderComeIn"
@interface SHInvoker : NSObject
//保存数据
+(void)saveUserInfo:(NSDictionary *)userinfo;
//读取数据
+ (NSDictionary*)getUserInfo ;
//清空数据
+ (void)clearUserInfo;
//是否登陆
+ (BOOL)isLogined;


+ (NSString *)currentVersionString;



@end
