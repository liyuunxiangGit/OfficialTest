//
//  MainViewController.m
//  YBT_iOS_tch
//
//  Created by 郭顺 on 15/10/30.
//  Copyright © 2015年 郭顺. All rights reserved.
//
#import "MainViewController.h"


#import "AFNetworking.h"

#define  kContentFrame  CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-kTabbarHeight)
#define  kDockFrame CGRectMake(0, self.view.frame.size.height-kTabbarHeight, self.view.frame.size.width, kTabbarHeight)


#define kMainPageViewWidth 49
#define kMainPageViewHeight 60
#define kMainPageBtnWidth 48
#define kMainPageBtnHeight 52
@interface MainViewController ()



@end

@implementation MainViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor cyanColor];

}




//
//-(void)logout:(NSNotification*)sender{
//    NSString *autoLogin = [sender.userInfo objectForKey:@"autoLogin"];
//    if ([@"NO" isEqualToString:autoLogin]) {
//        [AccountModel saveSingleModel:nil forKey:Key_LoginUserInfo];
//    }
//    for (UIViewController *VC in self.navigationController.viewControllers) {
//        [VC dismissViewControllerAnimated:NO completion:nil];
//    }
//}
//
//- (BOOL)shouldAutorotate{
//    return NO;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskPortrait;
//}



@end
