//
//  RegistNetWorkRequest.h
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "BaseSection.h"

@interface RegistNetWorkRequest : BaseSection

@property (nonatomic,copy) NSString *mobile;
@property (nonatomic,copy) NSString *pwd;
@property (nonatomic,copy) NSString *nikeName;

-(instancetype)initWithMobile:(NSString *)mobile pwd:(NSString *)pwd  nikeName:(NSString *)nikeName ResultBlock:(void(^)(NSDictionary *result)) result;
@end
