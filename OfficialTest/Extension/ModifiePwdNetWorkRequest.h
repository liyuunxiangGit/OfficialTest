//
//  ModifiePwdNetWorkRequest.h
//  OfficialTest
//
//  Created by xxt-imac on 16/6/24.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "BaseSection.h"

@interface ModifiePwdNetWorkRequest : BaseSection
@property (nonatomic,copy) NSString *newpassword;

-(instancetype)initWithNewPassword:(NSString *)newPwd ResultBlock:(void(^)(NSDictionary *modifiePwd))result;

@end
