//
//  BaseSection.h
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWork.h"
#import "BaseSection.h"
@class BaseSection;
@interface BaseSection : NSObject
/**
 *  网络
 */
@property (nonatomic,strong) NetWork * net;
/**
 *  业务执行，子类需要重写该方法
 */
- (void)exec;
@end
