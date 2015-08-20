//
//  MainTableViewCell.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/31.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "MainTableViewCell.h"
#import "DefaultReplyDishList.h"

@interface MainTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *dishPic;
@property (weak, nonatomic) IBOutlet UILabel *dishName;
@property (weak, nonatomic) IBOutlet UILabel *dishPrice;
@property (weak, nonatomic) IBOutlet UILabel *dishTaste;
@property (weak, nonatomic) IBOutlet UILabel *dishMaterial;
@property (weak, nonatomic) IBOutlet UILabel *bookCount;
@property (weak, nonatomic) IBOutlet UIButton *check;


@end

@implementation MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDishDetail:(DefaultReplyDishList *)dishDetail {
    
    [_dishPic sd_setImageWithURL:[NSURL URLWithString:dishDetail.dishPic] placeholderImage:nil];
    _dishName.text = dishDetail.dishName;
    NSNumberFormatter *formatter= [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterRoundDown;
    _dishPrice.text = [NSString stringWithFormat:@"￥%.2f",dishDetail.dishPrice];
    _dishTaste.text = [NSString stringWithFormat:@"口味：%@",dishDetail.dishTaste];
    _dishMaterial.text = dishDetail.dishMaterial;
    _bookCount.text = [NSString stringWithFormat:@"月销量：%ld",dishDetail.bookCount];
}

- (void)setShowCheck:(BOOL)showCheck {
    
    _check.hidden = !showCheck;
}

@end
