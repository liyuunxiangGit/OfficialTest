//
//  FormValidator.h
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormValidator : NSObject<UIAlertViewDelegate>


+(UIColor *) randomColor;
+(NSString *)checkPassword:(NSString *)aPassword;

+(NSString *)checkMobile:(NSString *)aMobile;

+(NSString *)checkVerifyCode:(NSString *)verifyCode;
+ (void)showAlertWithStr:(NSString *)message;
+(CGRect)rectWidthAndHeightWithStr:(NSString *)str AndFont:(CGFloat)fontFloat;
+(CGRect)rectWidthAndHeightWithStr:(NSString *)str AndFont:(CGFloat)fontFloat WithStrWidth:(CGFloat)widh;
@end
