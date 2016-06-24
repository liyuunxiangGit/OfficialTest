//
//  checkBox.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/24.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "checkBox.h"

@implementation checkBox


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *color = [UIColor lightGrayColor];
    [color set];
    CGContextStrokeRect(context,CGRectMake(0, 0, 10, 10));

}

@end
