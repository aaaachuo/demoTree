//
//  RestaurantCell.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/30.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "RestaurantCell.h"
#import "DefaultReplyMerchantList.h"

@interface RestaurantCell ()

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *curImage;
@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *waitInLine;
@property (weak, nonatomic) IBOutlet UILabel *location;
@end

@implementation RestaurantCell

- (void)awakeFromNib {

    _backView.layer.cornerRadius = 5.f;
    _backView.layer.masksToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setCellData:(DefaultReplyMerchantList *)cellData {
    
    _title.text = cellData.merchantName;
    _distance.text = cellData.distance;
    _location.text = [NSString stringWithFormat:@"地区：%@",cellData.areaName];
}

@end
