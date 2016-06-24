//
//  LoginNetWorkRequest.h
//  OfficialTest
//
//  Created by xxt-imac on 16/6/24.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "BaseSection.h"

@interface LoginNetWorkRequest : BaseSection

@property (nonatomic,copy) NSString *mobile;
@property (nonatomic,copy) NSString *pwd;
-(instancetype)initWithMobile:(NSString *)mobile Pwd:(NSString *)pwd ResultBlock:(void(^)(NSDictionary *result))result;
@end
