//
//  BeforeRegistJudge.h
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "BaseSection.h"

@interface BeforeRegistJudge : BaseSection
@property (nonatomic,copy) NSString *mobile;
-(instancetype)initWithMobile:(NSString *)mobile ResultBlock:(void(^)(NSDictionary *Mobile)) result;
@end
