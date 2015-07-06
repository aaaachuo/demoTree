//
//  MenuTableViewCell.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/2.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "MenuTableViewCell.h"

@interface MenuTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *curImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *taste;
@property (weak, nonatomic) IBOutlet UILabel *seasoning;
@property (weak, nonatomic) IBOutlet UIButton *minus;
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UIButton *plus;
@property (weak, nonatomic) IBOutlet UIView *control;
@property (nonatomic, strong) UIButton *defPlus;

@end

@implementation MenuTableViewCell

- (void)awakeFromNib {
    _defPlus = [UIButton buttonWithType:UIButtonTypeCustom];
    [_defPlus setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    _defPlus.layer.cornerRadius = 3.f;
    _defPlus.layer.borderColor = kUIColorFromRGB(0xe1e1e1).CGColor;
    _defPlus.layer.borderWidth = 0.5f;
    _defPlus.layer.masksToBounds = YES;
    [self addSubview:_defPlus];
    
    [_defPlus mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.equalTo(@34);
        make.height.equalTo(@34);
    }];
    
    _control.hidden = YES;
    _control.layer.cornerRadius = 3.f;
    _control.layer.borderColor = kUIColorFromRGB(0xe1e1e1).CGColor;
    _control.layer.borderWidth = 0.5f;
    _control.layer.masksToBounds = YES;
    
    _count.layer.borderColor = kUIColorFromRGB(0xe1e1e1).CGColor;
    _count.layer.borderWidth = 0.5f;
    _count.layer.masksToBounds = YES;
}

@end
