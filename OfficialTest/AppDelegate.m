//
//  AppDelegate.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 xxt-imac. All rights reserved.
//

#import "AppDelegate.h"
#import <SMS_SDK/SMSSDK.h>

//SMSSDK官网公共key
#define appkey @"143867bdfd498"
#define app_secrect @"b12cab1888b4993f23a8154ad9206423"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [SMSSDK registerApp:appkey
             withSecret:app_secrect];
    
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    LoginVCNew *login =[[LoginVCNew alloc]init];
    self.window.rootViewController =login;
    [self.window makeKeyAndVisible];

    
    self.splashScreenView = [[YFSplashScreenView alloc] initWithFrame:self.window.bounds defaultImage:[UIImage imageNamed:@"defaultStartScreen"]];
    [self.window addSubview:self.splashScreenView];
    self.splashScreenView.animationStartBlock = ^void(){
        NSLog(@"Animation Start......");
    };
    self.splashScreenView.animationCompletedBlock = ^void(){
        NSLog(@"Animation Completed......");
            };

    

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
