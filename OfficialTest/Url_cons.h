//
//  Url_cons.h
//  YBT_iOS_tch
//  URL地址定义
//  Created by 郭顺 on 15/10/29.
//  Copyright © 2015年 郭顺. All rights reserved.
//

#ifndef Url_cons_h
#define Url_cons_h





//测试地址nmbg.nmgxxt.cn:7080  正式地址:nmbg.xxt.cn
//#define XOHOST          @"http://nmbg.xxt.cn"
#define XOHOST          @"http://www.yyq.com"



//注册前判断
#define beforeRegistJudgeURL [NSString stringWithFormat:@"%@/exam/selectIfMobile.do",XOHOST]
//注册
#define RegistOfficialURL [NSString stringWithFormat:@"%@/exam/insertUser.do",XOHOST]
//登录
#define LoginOfficialUrl [NSString stringWithFormat:@"%@/exam/selectLogin.do",XOHOST]
//修改密码
#define ModifiedPwdOfficialUrl [NSString stringWithFormat:@"%@/exam/updatePwd.do",XOHOST]
#endif /* Url_cons_h */









