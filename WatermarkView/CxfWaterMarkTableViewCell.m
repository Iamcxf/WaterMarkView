//
//  CxfWaterMarkTableViewCell.m
//  iOSPractice
//
//  Created by 柴雪飞 on 2018/5/18.
//  Copyright © 2018年 柴雪飞. All rights reserved.
//

#import "CxfWaterMarkTableViewCell.h"

@implementation CxfWaterMarkTableViewCell{
    double rate;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        rate = [CxfUtils getRate];
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.waterTextLabel];
    }
    return self;
}

- (UILabel *)waterTextLabel{
    if(!_waterTextLabel){
        _waterTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screen_height*3, 100*rate)];
        _waterTextLabel.textColor = [UIColor blackColor];
        _waterTextLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:30.0*rate];
        _waterTextLabel.alpha = 0.5;
        _waterTextLabel.backgroundColor = [UIColor clearColor];
    }
    return _waterTextLabel;
}

@end
