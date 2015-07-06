//
//  TakeOutCell.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/1.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "TakeOutCell.h"

@interface TakeOutCell ()

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *curImage;
@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;
@property (weak, nonatomic) IBOutlet UILabel *sales;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UILabel *head;
@property (weak, nonatomic) IBOutlet UILabel *headDetail;
@property (weak, nonatomic) IBOutlet UILabel *subtract;
@property (weak, nonatomic) IBOutlet UILabel *subtractDetail;

@end

@implementation TakeOutCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
