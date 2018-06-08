//
//  CxfWaterMarkView.m
//  iOSPractice
//
//  Created by 柴雪飞 on 2018/5/18.
//  Copyright © 2018年 柴雪飞. All rights reserved.
//

#import "CxfWaterMarkView.h"
#import "CxfWaterMarkTableViewCell.h"

@interface CxfWaterMarkView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)NSString *waterMarkText;

@end

@implementation CxfWaterMarkView

+(CxfWaterMarkView*)addWaterMarkView:(NSString*)waterMarkText{
    CxfWaterMarkView *watermarkView =  [[CxfWaterMarkView alloc] initWithFrame:CGRectMake(-screen_height,-screen_height, screen_height*3, screen_height*3) waterMarkText:waterMarkText];
    watermarkView.transform = CGAffineTransformMakeRotation(-M_PI*0.25);
    return watermarkView;
}

- (instancetype)initWithFrame:(CGRect)frame waterMarkText:(NSString*)waterMarkText
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.waterMarkText = waterMarkText;
        [self setUI];
    }
    return self;
}
-(void)setUI{
    [self addSubview:self.tableView];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.tableView.frame = CGRectMake(0,0,self.frame.size.width,self.frame.size.height);
}
#pragma mark ==========tableView代理方法==========
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cellWaterMark";
    //出列可重用的cell ，通俗理解:从缓存池取标识为"Cell"的cell
    CxfWaterMarkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CxfWaterMarkTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }else{
        
    }
    cell.waterTextLabel.text = self.dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100*[CxfUtils getRate];
}
-  (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.userInteractionEnabled = NO;
        return _tableView;
    }
    return _tableView;
}
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [[NSMutableArray alloc]init];
        for (int i = 0; i<screen_height*3/100*[CxfUtils getRate]; i++) {
            NSString *str = @"";
            for (int j = 0; j<50; j++) {
                str = [NSString stringWithFormat:@"%@        %@",str,self.waterMarkText];
            }
            if (i%2 == 0) {
                [_dataSource addObject:str];
            }else{
                [_dataSource addObject:[NSString stringWithFormat:@"%@%@",@"        ",str]];
            }
        }
    }
    return _dataSource;
}

@end
