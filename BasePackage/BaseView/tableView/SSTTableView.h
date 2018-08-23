//
//  SSTTableView.h
//  封装底层框架
//
//  Created by apple on 2018/8/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

//点击cell触发此回调方法/
typedef void(^SelectCell)(NSIndexPath* indexPath);
//在此block中返回你要创建的cell*/
typedef UITableViewCell *(^CreateCell)(NSIndexPath *indexPath);

//CommonTableView继承UITableView,遵守tableView协议/

@interface SSTTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

//重构tableiView初始化方法,在需要的地方调用此初始化方法传入相应参数即可/
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style rowCount:(NSInteger)rows cellHeight:(CGFloat)height cell:(CreateCell)cell selectedCell:(SelectCell)selectBlock;

@end
