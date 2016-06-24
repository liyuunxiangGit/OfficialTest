//
//  CircleImageView.h
//  CircleImageView
//
//  Created by xxt-imac on 16/5/10.
//  Copyright © 2016年 xxt-imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleImageView : UIView

@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,strong) UIColor *boardColor;
@property (nonatomic,assign) CGFloat boardWidth;
@end
