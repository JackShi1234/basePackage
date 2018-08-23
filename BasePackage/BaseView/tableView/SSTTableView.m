//
//  SSTTableView.m
//  封装底层框架
//
//  Created by apple on 2018/8/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SSTTableView.h"

@interface SSTTableView()

//rows/
@property (nonatomic)NSInteger rows;
//cell的高度/
@property(nonatomic,assign)CGFloat height;
//声明自定义类型变量/
@property (nonatomic,copy)SelectCell selectBlock;
//声明自定义类型变量/
@property(nonatomic,copy)CreateCell createCell;

@end

@implementation SSTTableView

//初始化方法的实现/
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style rowCount:(NSInteger)rows cellHeight:(CGFloat)height cell:(CreateCell)cell selectedCell:(SelectCell)selectBlock
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.rows = rows;
        self.height = height;
        self.createCell = cell;
        self.selectBlock = selectBlock;
        self.tableFooterView = [[UIView alloc]init];
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = self.createCell(indexPath);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectBlock(indexPath);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rows;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.height;
}


@end
