//
//  SStBaseViewController.m
//  封装底层框架
//
//  Created by apple on 2018/8/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SStBaseViewController.h"
#import "PublicButton.h"
#import "SSTTableView.h"
#import "General.h"

@interface SStBaseViewController ()
@property (nonatomic,strong) NSMutableArray * arrayDatas;
@property (nonatomic,strong) SSTTableView * sstTableView;
@property (nonatomic,strong) NSMutableArray * SSTDatas;

@end

@implementation SStBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PublicButton * button1 = [[PublicButton alloc]init];
    [button1 adonWithImage:nil highImage:nil frame:CGRectMake(0, 40, 200, 200) title:@"ceshi" textColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:15] backgroundColor:[UIColor blueColor] addView:self.view target:self action:@selector(dianji)];
    
    //[self createView];
    //[self createArrayDatas];
    [self.view addSubview:self.sstTableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIColor *color = RGBCOLOR(34, 116, 255, 1);
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [button setImage:[UIImage imageNamed:@"fh"] forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 4);
    [button addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.navigationController.navigationBar setBarTintColor:color];
    
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    if (self.navigationController.viewControllers.count>1) {
        self.navigationItem.leftBarButtonItem = leftItem;
    }
}

- (void)goback {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-  (void)dianji {
    NSLog(@"dddd");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray*)SSTDatas {
    if (!_SSTDatas) {
        _SSTDatas = [NSMutableArray arrayWithCapacity:20];
        for (int i=0; i<20; i++) {
            [_SSTDatas addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _SSTDatas;
}

- (SSTTableView*)sstTableView {
    if (!_sstTableView) {
        __weak UITableView * tb = _sstTableView;
        _sstTableView = [[SSTTableView alloc]initWithFrame:CGRectMake(0, 201, self.view.bounds.size.width, self.view.bounds.size.height - 200) style:UITableViewStylePlain rowCount:[self.SSTDatas count] cellHeight:100 cell:^UITableViewCell *(NSIndexPath *indexPath) {
            //创建你自定义的cell
            static NSString *identifier = @"cell";
            
            UITableViewCell * cell = [tb dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell)
            {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            
            cell.textLabel.text = self.SSTDatas[indexPath.row];
            return cell;
            
        } selectedCell:^(NSIndexPath *indexPath) {
            NSLog(@"%ld",indexPath.row);
        }];
    };
    return _sstTableView;
}

@end
