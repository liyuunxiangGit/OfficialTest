//
//  ZHBlurtView.h
//  BlurtViewTest
//
//  Created by XT on 15/11/27.
//  Copyright © 2015年 XT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZHBlurtView;
@protocol ZHBlurtViewDelegate <NSObject>

-(void)exitLoginBtn:(ZHBlurtView *)view;

@end
@interface ZHBlurtView : UIView


@property (nonatomic,weak) id<ZHBlurtViewDelegate>delegate;

@property (nonatomic,assign)CGFloat headerImgHeight;
@property (nonatomic,assign)CGFloat iconHeight;
/**
 *  图片url
 */
@property (nonatomic,copy)NSString *imgUrl;
@property (nonatomic,copy)NSString *nameeee;


- (instancetype)initWithFrame:(CGRect)frame WithHeaderImgHeight:(CGFloat)headerImgHeight iconHeight:(CGFloat)iconHeight;

@end
