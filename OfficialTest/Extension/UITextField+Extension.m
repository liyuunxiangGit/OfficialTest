//
//  UITextField+Extension.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)
+(UITextField *)addTextFieldWithFrame:(CGRect)frame AndStr:(NSString *)placeholder AndFont:(CGFloat)font AndTextColor:(UIColor *)color
{
    UITextField *textF=[[UITextField alloc]initWithFrame:frame];
    textF.userInteractionEnabled = YES;
    textF.textColor = color;
    textF.font =[UIFont systemFontOfSize:font*Width];
    textF.placeholder=placeholder;
    return textF;
}
@end
