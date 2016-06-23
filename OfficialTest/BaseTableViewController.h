//
//  BaseTableViewController.h
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 xxt-imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface BaseTableViewController : UITableViewController
@property(nonatomic,copy)NSString *vcTagName;
-(void)showHudText:(NSString *)content;
-(void)showHudOnlyText:(NSString *)content;
-(void)dismissHud;
-(void)showSuccessHubContent:(NSString *)content;
-(void)showErrorHubContent:(NSString *)content;


-(void)setBarNormalImageName:(NSString *)normal PressImageName:(NSString *)press AtIndex:(NSInteger)index;
- (BOOL)isTrueValue:(NSString *)value withRegex:(NSString *)regex;
@end
