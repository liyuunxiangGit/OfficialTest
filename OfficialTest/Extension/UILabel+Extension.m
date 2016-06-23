//
//  UILabel+Extension.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
+(UILabel *)addLabelWithFrame:(CGRect)frame AndText:(NSString *)text AndFont:(CGFloat)font AndAlpha:(CGFloat)alpha AndColor:(UIColor *)color
{
    UILabel *label =[[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.alpha = alpha;
    label.font =[UIFont systemFontOfSize:font];
    label.textColor = color;
    label.textAlignment =NSTextAlignmentLeft;
    label.textAlignment =NSTextAlignmentCenter;
    return label;
}
@end
