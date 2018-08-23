//
//  PublicButton.m
//  封装底层框架
//
//  Created by apple on 2018/8/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PublicButton.h"

@implementation PublicButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIButton *)adonWithImage:(NSString *)image highImage:(NSString *)highimage frame:(CGRect)frame title:(NSString *)title textColor:(UIColor *)color textFont:(UIFont *)font backgroundColor:(UIColor *)backgroundColor addView:(UIView *)view target:(id)target action:(SEL)action{
    
    UIButton * btn = [[UIButton alloc]init];
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highimage] forState:UIControlStateSelected];
    btn.frame = frame;
    
    [btn setTitle:title forState:(UIControlStateNormal)];
    
    btn.titleLabel.textColor = color;
    
    [btn setTitleColor:color forState:(UIControlStateNormal)];
    
    btn.titleLabel.font = font;
    
    btn.backgroundColor = backgroundColor;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:btn];
    
    return btn;
}



@end
