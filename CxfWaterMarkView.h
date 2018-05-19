//
//  CxfWaterMarkView.h
//  iOSPractice
//
//  Created by 柴雪飞 on 2018/5/18.
//  Copyright © 2018年 柴雪飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CxfWaterMarkView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
//创建水印View
+(CxfWaterMarkView*)addWaterMarkView;
@end
