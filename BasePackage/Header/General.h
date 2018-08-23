//
//  General.h
//  封装底层框架
//
//  Created by apple on 2018/8/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#ifndef General_h
#define General_h

//是否是iOS11系统
#define iOS11 @available(iOS 11.0, *)?YES:NO
//字体
#define FONT(Font) [UIFont systemFontOfSize:Font]

//屏幕宽高
#define kHeigth [UIScreen mainScreen].bounds.size.height
#define kWidth [UIScreen mainScreen].bounds.size.width

#define SDHHEIGHT(y) (y)*kHeigth/667
#define SDHWIDTH(x) (x)*kHeigth/667
#define bigSVHEIGHT  (kHeigth-64-SDHHEIGHT(40)-49)


//自定义颜色
#define RGBCOLOR(R,G,B,a) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:a]

//常用的颜色
#define UsualBlueColor RGBCOLOR(90,157,252,1)
#define UsualGrayColor RGBCOLOR(241, 242, 244, 1)
#define Usual66Color RGBCOLOR(66,66,66,1)

//导航栏高度和tabbar高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

#define HUD(string) MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];\
hud.mode=MBProgressHUDModeText;\
hud.bezelView.backgroundColor = [UIColor blackColor];\
hud.label.textColor = [UIColor whiteColor];\
hud.label.text=string;\
hud.margin=10.0f;\
hud.removeFromSuperViewOnHide=YES;\
[hud hideAnimated:YES afterDelay:1.5];

#define ShowError UIAlertController *errorVC = [UIAlertController alertControllerWithTitle:@"错误" message:[error localizedDescription] preferredStyle:(UIAlertControllerStyleAlert)];\
UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:nil];\
[errorVC addAction:alertAction];\
[self presentViewController:errorVC animated:YES completion:nil];
#endif /* General_h */
