//
//  ForgetPassWordVCNew.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "ForgetPassWordVCNew.h"
#import "LoginNetWorkRequest.h"
#import "ModifiePwdNetWorkRequest.h"
@interface ForgetPassWordVCNew ()

@property(nonatomic,strong)UIButton *loginBtnReturn;
@property(nonatomic,strong)UIImageView *backImgV;
@property(nonatomic,strong)UIImageView *backView;
@property(nonatomic,strong)UITextField *phoneTextField;
@property(nonatomic,strong)UIImageView *phoneImgV;
@property(nonatomic,strong)UITextField *oldpasswordText;
@property(nonatomic,strong)UITextField *passwordText;
@property(nonatomic,strong)UIImageView *passwordImgV;
@property(nonatomic,strong)UIButton *loginBtn;


@property(nonatomic,copy)NSString *registStr;
@end

@implementation ForgetPassWordVCNew
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _backImgV =[UIImageView addImgWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) AndImage:@"ditu"];
    [self.view addSubview:_backImgV];
    _backImgV.userInteractionEnabled = YES;
    _backView =[UIImageView addImgWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) AndImage:@"zuizhongbanquan"];
    [self.view addSubview:_backView];
    _backView.userInteractionEnabled = YES;
    
    _loginBtnReturn =[UIButton addBtnImage:@"login_Return_Left" AndFrame:CGRectMake(20*Height, 30*Height, 25*Width, 25*Height) WithTarget:self action:@selector(returnLoginBtn)];
    [_backView addSubview:_loginBtnReturn];
    
    _phoneTextField =[self addtextFieldWithHeight:150 AndImgStr:nil AndStr:@"请输入手机号码"];
    _phoneTextField.keyboardType =UIKeyboardTypeNumberPad;
    [_backView addSubview:_phoneTextField];
    
    _oldpasswordText = [self addtextFieldWithHeight:200 AndImgStr:nil AndStr:@"请输入旧的密码"];
    [_backView addSubview:_passwordText];
    
    _passwordText =[self addtextFieldWithHeight:250 AndImgStr:nil AndStr:@"请输入新的密码"];
    [_backView addSubview:_passwordText];
    
    _loginBtn =[UIButton addBtnImage:@"forgetPassWord" AndFrame:CGRectMake(30*Width, 300*Height, 260*Width, 36*Height) WithTarget:self action:@selector(loginAccountButton)];
    [_backView addSubview:_loginBtn];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//更改密码按钮
-(void)loginAccountButton
{
    if ([_phoneTextField.text isEqualToString:@""]||_phoneTextField.text == nil||[_passwordText.text isEqualToString:@""]||_passwordText.text == nil || [_oldpasswordText.text isEqualToString:@""] || _oldpasswordText.text == nil) {
        [FormValidator showAlertWithStr:@"手机号或新旧密码都不能为空"];
        return;
    }else if (IsValidPhoneNum(_phoneTextField.text) != YES) {
        [FormValidator showAlertWithStr:@"请输入正确的手机号"];
        return;
    }else if(_passwordText.text.length <6 || _oldpasswordText.text.length < 6){
        [FormValidator showAlertWithStr:@"密码必须6位以上"];
    }else {
    
    //首先进行登录操作
    LoginNetWorkRequest *LNWR = [[LoginNetWorkRequest alloc]initWithMobile:_phoneTextField.text Pwd:_oldpasswordText.text ResultBlock:^(NSDictionary *result) {
        NSLog(@"%@",result);
        if ([result[@"resultCode"] isEqualToNumber:@(1)]) {
        //进行更改密码的操作
            ModifiePwdNetWorkRequest *MPNR = [[ModifiePwdNetWorkRequest alloc]initWithNewPassword:_passwordText.text ResultBlock:^(NSDictionary *modifiePwd) {
                NSLog(@"%@",modifiePwd);
                
                if ([modifiePwd[@"resultCode"] isEqualToNumber:@(1)]) {
                    [FormValidator showAlertWithStr:@"修改成功,请登录!"];
                    [self returnLoginBtn];
                }
                if ([modifiePwd[@"resultCode"] isEqualToNumber:@(0)]) {
                    [FormValidator showAlertWithStr:@"新密码与旧密码相同，请进行修改"];
                }
                

            }];
            [MPNR exec];

        }else if ([result[@"resultCode"] isEqualToNumber:@(-1)])
        {
            [FormValidator showAlertWithStr:@"该用户不存在!"];
            _passwordText.text = nil;
            _oldpasswordText.text = nil;
            _phoneTextField.text = nil;
        }else if ([result[@"resultCode"] isEqualToNumber:@(0)])
        {
            [FormValidator showAlertWithStr:@"旧密码输入错误!请重新输入"];
            _oldpasswordText.text = nil;
        }
    }];
    [LNWR exec];

    
    }
}

-(UITextField *)addtextFieldWithHeight:(CGFloat)heigh AndImgStr:(NSString *)imgStr AndStr:(NSString *)str
{
    UIImageView *imgBack =[UIImageView addImgWithFrame:CGRectMake(30*Width, heigh*Height, 260*Width, 36*Height) AndImage:@"login_Register_Bord"];
    [_backView addSubview:imgBack];
    
    UITextField *textF=[UITextField addTextFieldWithFrame:CGRectMake(30*Width, (heigh+0.5)*Height, 260*Width, 35*Height) AndStr:str AndFont:14 AndTextColor:whitesColor];
    [_backView addSubview:textF];
    
    
    return textF;
}
-(UITextField *)textWithH:(CGFloat)heigh AndW:(CGFloat)Widh AndStr:(NSString *)str
{
    UIImageView *imgBack =[UIImageView addImgWithFrame:CGRectMake(30*Width, heigh*Height, Widh*Width, 36*Height) AndImage:@"login_Register_Bord"];
    [_backView addSubview:imgBack];
    UITextField *textF=[UITextField addTextFieldWithFrame:CGRectMake(30*Width, (heigh+0.5)*Height, Widh*Width, 35*Height) AndStr:str AndFont:14 AndTextColor:whitesColor];
    
    return textF;
    
}

-(void)returnLoginBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
