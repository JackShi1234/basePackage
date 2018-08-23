//
//  SSTTabBarViewController.m
//  封装底层框架
//
//  Created by apple on 2018/8/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SSTTabBarViewController.h"
#import "SSTNavigationViewController.h"

@interface SSTTabBarViewController ()

@end

@implementation SSTTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBar];
}

- (void)createTabBar {
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    NSArray *controller = @[@"ViewControllerGuanyu",@"ViewControllerZhangfei",@"ViewControllerLiubei",@"ViewControllerMine"];
    NSArray *imageNormal = @[@"h",@"1",@"f",@"d"];
    NSArray *imageSelect = @[@"l",@"w",@"l",@"-"];
    NSArray *title = @[@"关羽",@"张飞",@"刘备",@"我的"];
    NSMutableArray *arrayContrllers = [NSMutableArray array];
    for(int i=0;i<controller.count;i++)
    {
        Class class = NSClassFromString(controller[i]);
        UIViewController *vc = [[class alloc]init];
        SSTNavigationViewController *nv = [[SSTNavigationViewController alloc]initWithRootViewController:vc];
        UIImage *normal = [UIImage imageNamed:imageNormal[i]];
        UIImage *select = [UIImage imageNamed:imageSelect[i]];
        UIImage *normal1 = [normal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *select1 = [select imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:title[i] image:normal1 selectedImage:select1];
        nv.tabBarItem = item;
        [nv.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -4)];
        [arrayContrllers addObject:nv];
    }
    self.viewControllers  = arrayContrllers;
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
