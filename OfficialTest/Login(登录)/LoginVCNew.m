//
//  LoginVCNew.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "LoginVCNew.h"
#import "RegisterVCNew.h"
#import "ForgetPassWordVCNew.h"
#import "YFSplashScreenView.h"
#import "PersonDataViewController.h"
#import "LoginNetWorkRequest.h"
#import "CircleImageView.h"
#import "MainViewController.h"
#import "UserModel.h"
#import "CoreArchive+Version.h"
#import "AppDelegate.h"
@interface LoginVCNew ()
@property(nonatomic,strong)UIImageView *backImgV;
@property(nonatomic,strong)UIImageView *backView;
@property(nonatomic,strong)UITextField *phoneTextField;
@property(nonatomic,strong)UIImageView *phoneImgV;
@property(nonatomic,strong)UITextField *passwordText;
@property(nonatomic,strong)UIImageView *passwordImgV;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *forgetPassWordBtn;
@property(nonatomic,strong)UIButton *savePassWordBtn;
@property(nonatomic,strong)UIButton *registBtn;
@property(nonatomic,strong)UIImageView *headImgV;
@property(nonatomic,strong)UIButton *returnTopBtn;

@end

@implementation LoginVCNew
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:YES];
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vcTagName = @"登陆界面";
    self.view.backgroundColor = [UIColor whiteColor];
    [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(interFaceDesign) userInfo:nil repeats:NO];

    
}
-(void)interFaceDesign
{
    _backImgV =[UIImageView addImgWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) AndImage:@"ditu"];
    [self.view addSubview:_backImgV];
    _backImgV.userInteractionEnabled = YES;
    
    
    _backView =[UIImageView addImgWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) AndImage:@"zuizhongbanquan"];
    [self.view addSubview:_backView];
    _backView.userInteractionEnabled = YES;
    
    CircleImageView *headImgv = [[CircleImageView alloc]initWithFrame:CGRectMake(125*Width, 90*Height, 70*Width, 70*Height)];
    headImgv.backgroundColor = [UIColor clearColor];
    headImgv.imageName = @"touxiang";
//    _headImgV =[UIImageView addImgWithFrame:CGRectMake(125*Width, 90*Height, 70*Width, 70*Height) AndImage:@"touxiang"];
//    _headImgV.layer.cornerRadius = 35;
//    _headImgV.clipsToBounds = YES;
    [_backView addSubview:headImgv];
    
    _phoneTextField =[self addtextFieldWithHeight:200 AndImgStr:nil AndStr:@"请输入手机号码"];
    _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneTextField.keyboardType =UIKeyboardTypeNumberPad;
    [_backView addSubview:_phoneTextField];
    
    _passwordText =[self addtextFieldWithHeight:250 AndImgStr:nil AndStr:@"请输入密码"];
    _passwordText.secureTextEntry = YES;
    _passwordText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_backView addSubview:_passwordText];
    
    _loginBtn =[UIButton addBtnImage:@"loginBtn" AndFrame:CGRectMake(30*Width, 300*Height, 260*Width, 36*Height) WithTarget:self action:@selector(loginAccountButton)];
    [_backView addSubview:_loginBtn];
    
    _savePassWordBtn = [UIButton addBtnImage:nil AndFrame:CGRectMake(30*Width, 340*Height, 90*Width, 20*Height) WithTarget:self action:@selector(savePasswordClick)];
    [_savePassWordBtn setTitle:@"记住密码 ?" forState:UIControlStateNormal];
    _savePassWordBtn.titleLabel.font =[UIFont systemFontOfSize:12*Width weight:0.5];
    [_backView addSubview:_savePassWordBtn];

    
    _forgetPassWordBtn =[UIButton addBtnImage:nil AndFrame:CGRectMake(215*Width, 340*Height, 90*Width, 20*Height) WithTarget:self action:@selector(forgetPasswordClick)];
    [_forgetPassWordBtn setTitle:@"修改密码 ?" forState:UIControlStateNormal];
    _forgetPassWordBtn.titleLabel.font =[UIFont systemFontOfSize:12*Width weight:0.5];
    [_backView addSubview:_forgetPassWordBtn];
    
    _registBtn =[UIButton addBtnImage:@"register_loginBtn" AndFrame:CGRectMake(110*Width, 380*Height, 100*Width, 15*Height) WithTarget:self action:@selector(registAccountInterface)];
    [_backView addSubview:_registBtn];
}
-(void)returnLoginBtnsss
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)savePasswordClick
{
    
}
-(void)forgetPasswordClick{
    ForgetPassWordVCNew *forget=[[ForgetPassWordVCNew alloc]init];
    [self presentViewController:forget animated:YES completion:nil];
}
//注册接口
-(void)registAccountInterface
{
    RegisterVCNew *regist=[[RegisterVCNew alloc]init];
    [self presentViewController:regist animated:YES completion:nil];
    
}
//登录方法
-(void)loginAccountButton
{
    NSString *userName =[FormValidator checkMobile:_phoneTextField.text];
    NSString *passWord=[FormValidator checkPassword:_passwordText.text];
    if ([_phoneTextField.text isEqualToString:@""]||_phoneTextField.text == nil||[_passwordText.text isEqualToString:@""]||_passwordText.text == nil) {
        [FormValidator showAlertWithStr:@"用户名或密码不能为空"];
        return;
    }else if (IsValidPhoneNum(_phoneTextField.text) != YES) {
        [FormValidator showAlertWithStr:@"请输入正确的手机号"];
        return;
    }else {
        if (passWord) {
            [FormValidator showAlertWithStr:passWord];
            return;
        }
    }
    [self loginAccountInter];
    
    
}


//登陆接口
-(void)loginAccountInter
{
    [self.view endEditing:YES];
    
    LoginNetWorkRequest *LNWR = [[LoginNetWorkRequest alloc]initWithMobile:_phoneTextField.text Pwd:_passwordText.text ResultBlock:^(NSDictionary *result) {
        NSLog(@"%@",result);
        if ([result[@"resultCode"] isEqualToNumber:@(1)]) {
            
            //存储个人信息
            UserModel *userModel = [[UserModel alloc] init];
            userModel.mobile = _phoneTextField.text;
            userModel.nickname = [result[@"loginmap"] objectForKey:@"nickname"];
            BOOL res = [UserModel saveSingleModel:userModel forKey:@"userModel"];
            
            if(res){
                NSLog(@"保存成功");
            }else{
                NSLog(@"保存失败");
            }

            //进行界面跳转
            UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            MainViewController *vc = [mainStory instantiateViewControllerWithIdentifier:@"gotoMain"];
//            PersonDataViewController *pvc = [[PersonDataViewController alloc]init];
            [self presentViewController:vc animated:YES completion:nil];
        }else if ([result[@"resultCode"] isEqualToNumber:@(-1)])
        {
            [FormValidator showAlertWithStr:@"该用户不存在!"];
            _passwordText.text = nil;
            _phoneTextField.text = nil;
        }else if ([result[@"resultCode"] isEqualToNumber:@(0)])
        {
            [FormValidator showAlertWithStr:@"密码错误!请重新输入"];
            _passwordText.text = nil;
        }
    }];
    [LNWR exec];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_phoneTextField endEditing:YES];
    [_passwordText endEditing:YES];
    
}

-(UITextField *)addtextFieldWithHeight:(CGFloat)heigh AndImgStr:(NSString *)imgStr AndStr:(NSString *)str
{
    UIImageView *imgBack =[UIImageView addImgWithFrame:CGRectMake(30*Width, heigh*Height, 260*Width, 36*Height) AndImage:@"login_Register_Bord"];
    [_backView addSubview:imgBack];
    
    UITextField *textF =[UITextField addTextFieldWithFrame:CGRectMake(30*Width, (heigh+0.5)*Height, 260*Width, 35*Height) AndStr:str AndFont:14 AndTextColor:whitesColor];
    [_backView addSubview:textF];
    
    
    return textF;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.view endEditing:YES];
    [super viewWillDisappear:animated];
    
}
@end
