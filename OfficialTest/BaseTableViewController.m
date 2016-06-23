//
//  BaseTableViewController.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 xxt-imac. All rights reserved.
//

#import "BaseTableViewController.h"
#import "MBProgressHUD+Add.h"
@interface BaseTableViewController (){
    NSInteger m_hubShowController;
}

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    增加设置不透明。   //ios7会报错.

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor]}];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    DDLogVerbose(@"%@",[NSString stringWithFormat:@"[VC VDL]Class=%@|Name=%@",[self class],_vcTagName]);
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%@",[NSString stringWithFormat:@"[VC VWA]Class=%@|Name=%@",[self class],_vcTagName]);
//    DDLogVerbose(@"%@",[NSString stringWithFormat:@"[VC VWA]Class=%@|Name=%@",[self class],_vcTagName]);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%@",[NSString stringWithFormat:@"[VC VDA]Class=%@|Name=%@",[self class],_vcTagName]);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"%@",[NSString stringWithFormat:@"[VC WWD]Class=%@|Name=%@",[self class],_vcTagName]);
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%@",[NSString stringWithFormat:@"[VC VDD]Class=%@|Name=%@",[self class],_vcTagName]);
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark -指示器
-(void)showHudText:(NSString *)content{
    NSLog(@"showHubText:%@",content);
//    DDLogDebug(@"showHubText:%@",content);
    if (m_hubShowController > 0) {
        m_hubShowController++;
    }else{
        m_hubShowController = 1;
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showMessag:content toView:nil];
        });
        
    }
    
}

-(void)showHudOnlyText:(NSString *)content{
    NSLog(@"showHudOnlyText:%@",content);
//    DDLogDebug(@"showHudOnlyText:%@",content);
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showOnlyMessage:content toView:nil];
    });
    
}

-(void)dismissHud{
    NSLog(@"dismissHud");
    //[MMProgressHUD dismiss];
    m_hubShowController--;
    if (m_hubShowController <= 0) {
        NSLog(@"dismissHud-real");
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD dismissHudForView:nil];
            m_hubShowController = 0;
        });
        
        
    }
    
}

-(void)showSuccessHubContent:(NSString *)content{
    NSLog(@"showSuccessHubContent:%@",content);
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showSuccess:content toView:nil];
    });
}

-(void)showErrorHubContent:(NSString *)content{
    NSLog(@"showErrorHubContent:%@",content);
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showError:content toView:nil];
    });
    
}


- (BOOL)shouldAutorotate{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


-(void)setBarNormalImageName:(NSString *)normal PressImageName:(NSString *)press AtIndex:(NSInteger)index{
    NSArray *barItems = self.tabBarController.tabBar.items;
    if (index >= [barItems count]) {
        return;
    }
    UITabBarItem *item = [barItems objectAtIndex:index];
    item.image = [UIImage imageNamed:normal];
    item.selectedImage = [UIImage imageNamed:press];
}


@end
