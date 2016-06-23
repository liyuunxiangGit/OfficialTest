//
//  UIButton+Extension.h
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
+ (UIButton *)addBtnImage:(NSString *)imgName AndFrame:(CGRect)frame WithTarget:(id)target action:(SEL)action;
+(UIButton *)addBtnImage:(NSString *)img AndFrame:(CGRect)frame WithTitle:(NSString *)title AndTitleColor:(UIColor *)color AndTitleFont:(CGFloat)font AndImgInsets:(UIEdgeInsets)edgeInset AndTitleEdgeInsets:(UIEdgeInsets)titleInsets AndTarget:(id)traget AndAction:(SEL)selector;

+(UIButton *)addBtnWithFrame:(CGRect)frame WithTitle:(NSString *)title WithBGImg:(NSString *)backImg WithFont:(CGFloat)font WithTitleColor:(UIColor *)color Target:(id)traget Action:(SEL)action;
@end