//
//  UIImageView+Extension.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "UIImageView+Extension.h"

@implementation UIImageView (Extension)
+(UIImageView *)addImgWithFrame:(CGRect)frame AndImage:(NSString *)imgName
{
    UIImageView *imgView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName]];
    
    imgView.frame = frame;
    return imgView;
}
@end
