
//
//  BaseSection.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "BaseSection.h"
#import "Url_cons.h"
@implementation BaseSection
- (id)init{
    self = [super init];
    if (self) {
        _net = [[NetWork alloc]init];
    }
    return self;
}

- (void)exec{
    
}

@end
