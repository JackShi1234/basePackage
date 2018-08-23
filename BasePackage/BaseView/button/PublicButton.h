//
//  PublicButton.h
//  封装底层框架
//
//  Created by apple on 2018/8/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicButton : UIButton

// 添加button
- (UIButton *)adonWithImage:(NSString *)image highImage:(NSString *)highimage frame:(CGRect)frame title:(NSString *)title textColor:(UIColor *)color textFont:(UIFont *)font backgroundColor:(UIColor *)backgroundColor addView:(UIView *)view target:(id)target action:(SEL)action;

@end
