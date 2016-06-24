//
//  PersonDataViewController.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "PersonDataViewController.h"
#import "UIImageView+LBBlurredImage.h"
#import "UserModel.h"
#import "CoreArchive+Version.h"
#import "ZHBlurtView.h"
@interface PersonDataViewController ()<ZHBlurtViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *backView;

@end

@implementation PersonDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ZHBlurtView *b = [[ZHBlurtView alloc] initWithFrame:CGRectMake(0, 64, _backView.frame.size.width, SCREEN_HEIGHT-64-44) WithHeaderImgHeight:200 iconHeight:100];
    
    UserModel *userModel =[UserModel readSingleModelForKey:@"userModel"];
    b.nameeee = userModel.nickname;
    [_backView addSubview:b];

    b.delegate = self;
  

}
-(void)exitLoginBtn:(ZHBlurtView *)view
{
    NSLog(@"11111");
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
