//
//  RegisterVCNew.m
//  OfficialTest
//
//  Created by xxt-imac on 16/6/23.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "RegisterVCNew.h"
#import <SMS_SDK/SMSSDK.h>
#import "BeforeRegistJudge.h"
#import "RegistNetWorkRequest.h"
#import "Url_cons.h"


//判断是否是11位手机号
#define IsValidPhoneNum(phoneNum)\
[[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^\\d{11}$"] evaluateWithObject:[NSString stringWithFormat:@"%@",phoneNum]]
@interface RegisterVCNew ()
{
    int timeCount;
    NSTimer*timer;
}
@property(nonatomic,strong)UILabel *tipLabel;
@property(nonatomic,strong)UIButton *loginBtnReturn;
@property(nonatomic,strong)UIImageView *backImgV;
@property(nonatomic,strong)UIImageView *backView;
@property(nonatomic,strong)UITextField *phoneTextField;
@property(nonatomic,strong)UIImageView *phoneImgV;
@property(nonatomic,strong)UITextField *passwordText;
@property(nonatomic,strong)UITextField *nicknameText;
@property(nonatomic,strong)UIImageView *passwordImgV;
@property(nonatomic,strong)UIButton *loginBtn;

@property(nonatomic,strong)UITextField *yanzhengTextF;
@property(nonatomic,strong)UIButton *huoquBtn;
@property(nonatomic,copy)NSString *registStr;

@end



@implementation RegisterVCNew

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
    
    _nicknameText = [self addtextFieldWithHeight:200 AndImgStr:nil AndStr:@"请输入昵称"];
    [_backView addSubview:_nicknameText];
    
    _passwordText =[self addtextFieldWithHeight:250 AndImgStr:nil AndStr:@"请输入密码"];
    [_backView addSubview:_passwordText];
    
    _loginBtn =[UIButton addBtnImage:@"registerBtn" AndFrame:CGRectMake(30*Width, 350*Height, 260*Width, 36*Height) WithTarget:self action:@selector(registAccountButton)];
    [_backView addSubview:_loginBtn];
    
    _yanzhengTextF =[self textWithH:300 AndW:140 AndStr:@"输入验证码"];
    _yanzhengTextF.keyboardType =UIKeyboardTypeNumberPad;
    [_backView addSubview:_yanzhengTextF];
    
    
    _huoquBtn =[UIButton addBtnImage:nil AndFrame:CGRectMake(180*Width, 300*Width, 110*Width, 36*Height) WithTarget:self action:@selector(registYanZheng)];
    [_huoquBtn setBackgroundImage:[UIImage imageNamed:@"register_huoqu"] forState:UIControlStateNormal];
    [_huoquBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_huoquBtn setTitleColor:whitesColor forState:UIControlStateNormal];
    _huoquBtn.titleLabel.font =[UIFont systemFontOfSize:12*Width weight:1];
    [_backView addSubview:_huoquBtn];
    
    //验证提交之后的跑秒提示防止用户的重复提交数据有效时间30秒
    timeCount = 30;
    _tipLabel=[[UILabel alloc ]initWithFrame:CGRectMake(180*Width, 300*Height, 110*Width, 35*Height)];
    _tipLabel.textAlignment=NSTextAlignmentCenter;
    _tipLabel.text=[[NSString alloc]initWithFormat:@"%ds",timeCount];
    _tipLabel.textColor=[UIColor whiteColor];
    _tipLabel.layer.cornerRadius=3;
    _tipLabel.clipsToBounds=YES;
    _tipLabel.backgroundColor=[UIColor lightGrayColor];
    _tipLabel.hidden=YES;
    _tipLabel.font=[UIFont systemFontOfSize:14];
    [_backView addSubview:_tipLabel];
    
    
}





#pragma mark-->读秒开始
-(void)readSecond{
    _huoquBtn.hidden=YES;
    
    _tipLabel.hidden=NO;
    
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dealTimer) userInfo:nil repeats:YES];
    timer.fireDate=[NSDate distantPast];
}

#pragma mark-->跑秒操作
-(void)dealTimer{
    
    _tipLabel.text=[[NSString alloc]initWithFormat:@"%ds",timeCount];
    timeCount=timeCount - 1;
    if(timeCount== 0){
        timer.fireDate=[NSDate distantFuture];
        timeCount= 30;
        _tipLabel.hidden=YES;
        _huoquBtn.hidden=NO;
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_phoneTextField endEditing:YES];
    [_passwordText endEditing:YES];
    [_yanzhengTextF endEditing:YES];
    
}





//验证码
-(void)registYanZheng
{
//    IsValidPhoneNum(_phoneTextField.text);
    if (IsValidPhoneNum(_phoneTextField.text) != YES) {
        [FormValidator showAlertWithStr:@"请输入正确的手机号"];
        //            UIAlertView *phoneAlert = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"手机号码为空或者格式有误，请输入正确的手机号码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        //            [phoneAlert  show];
    }else{
        
   
        /**
         *  @from                    v1.1.1
         *  @brief                   获取验证码(Get verification code)
         *
         *  @param method            获取验证码的方法(The method of getting verificationCode)
         *  @param phoneNumber       电话号码(The phone number)
         *  @param zone              区域号，不要加"+"号(Area code)
         *  @param customIdentifier  自定义短信模板标识 该标识需从官网http://www.mob.com上申请，审核通过后获得。(Custom model of SMS.  The identifier can get it  from http://www.mob.com  when the application had approved)
         *  @param result            请求结果回调(Results of the request)
         */
       
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_phoneTextField.text
                                       zone:@"86"
                           customIdentifier:nil
                                     result:^(NSError *error){
                                         if (!error) {
                                             
                                              [self readSecond];
                                             NSLog(@"获取验证码成功");
                                         } else {
                                             [FormValidator showAlertWithStr:@"获取验证码失败"];
                                             NSLog(@"错误信息：%@",error);
                                         }}];
    }
    
}




//用户注册
-(void)registAccountButton
{
  
//    [self registAccountInterface];
    if ([_phoneTextField.text isEqualToString:@""]||_phoneTextField.text ==nil ||[_passwordText.text isEqualToString:@""]||_passwordText.text == nil|| [_yanzhengTextF.text isEqualToString:@""]||_yanzhengTextF.text == nil || [_nicknameText.text isEqualToString:@""] || _nicknameText.text == nil) {
        [FormValidator showAlertWithStr:@"请将您信息填写完整！"];
        return;
    }else if(_passwordText.text.length <6 ){
        [FormValidator showAlertWithStr:@"密码必须6位以上"];
    }
    else{
        /**
         * @from               v1.1.1
         * @brief              提交验证码(Commit the verification code)
         *
         * @param code         验证码(Verification code)
         * @param phoneNumber  电话号码(The phone number)
         * @param zone         区域号，不要加"+"号(Area code)
         * @param result       请求结果回调(Results of the request)
         */

        [SMSSDK commitVerificationCode:self.yanzhengTextF.text phoneNumber:_phoneTextField.text zone:@"86" result:^(NSError *error) {
            
            if (!error) {
//                [FormValidator showAlertWithStr:@"验证成功"];
                [self registAccountInterface];

            }
            else
            {
                [FormValidator showAlertWithStr:@"请输入正确验证码"];
                NSLog(@"错误信息:%@",error);
            }
        }];
    }

}
//注册接口
-(void)registAccountInterface
{
    
    BeforeRegistJudge *BRJ = [[BeforeRegistJudge alloc]initWithMobile:_phoneTextField.text ResultBlock:^(NSDictionary *Mobile) {
        NSLog(@"%@",Mobile);
        if ([Mobile[@"resultCode"] isEqualToNumber:@(1)]) {
            //该号可以注册；直接到注册网络请求
            RegistNetWorkRequest *RNWR = [[RegistNetWorkRequest alloc]initWithMobile:_phoneTextField.text pwd:_passwordText.text nikeName:_nicknameText.text ResultBlock:^(NSDictionary *result) {
                if ([result[@"resultCode"] isEqualToNumber:@(1)]) {
                    [FormValidator showAlertWithStr:@"注册成功,请登录!"];
                }
                [self returnLoginBtn];
                
            }];
            [RNWR exec];
            
        }else if ([Mobile[@"resultCode"] isEqualToNumber:@(-1)])
        {
            [FormValidator showAlertWithStr:@"电话格式不符"];
        }else
        {
            [FormValidator showAlertWithStr:@"该号已经注册"];
            _passwordText.text = nil;
            _phoneTextField.text = nil;
            _nicknameText.text = nil;
            _yanzhengTextF.text = nil;

        }
      

    }];
    [BRJ exec];
    

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
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_phoneTextField endEditing:YES];
    [_passwordText endEditing:YES];
    [_yanzhengTextF endEditing:YES];
    self.navigationController.navigationBarHidden = NO;
}

@end
