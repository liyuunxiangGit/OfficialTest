//
//  PersonDataViewController.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "PersonDataViewController.h"
#import "UIImageView+LBBlurredImage.h"
#import "ZHBlurtView.h"
@interface PersonDataViewController ()

@end

@implementation PersonDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ZHBlurtView *b = [[ZHBlurtView alloc] initWithFrame:self.view.frame WithHeaderImgHeight:200 iconHeight:100];
    
    
    [self.view addSubview:b];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
