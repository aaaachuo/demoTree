//
//  MainDetailCell.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/28.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "MainDetailCell.h"

@interface MainDetailCell ()

@property (nonatomic, strong) UIImageView   *curImage;
@property (nonatomic, strong) UILabel       *title;
@property (nonatomic, strong) UILabel       *detailTitle;

@end

@implementation MainDetailCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor cyanColor];
        
        _curImage = [[UIImageView alloc] init];
        _curImage.backgroundColor = [UIColor redColor];
        [self addSubview:_curImage];
        
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:14];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.textColor = KRGBColor(51, 51, 51);
        _title.backgroundColor = [UIColor yellowColor];
        [self addSubview:_title];
        
        _detailTitle = [[UILabel alloc] init];
        _detailTitle.font = [UIFont systemFontOfSize:11];
        _detailTitle.textAlignment = NSTextAlignmentLeft;
        _detailTitle.textColor = KRGBColor(255, 111, 111);
        _detailTitle.backgroundColor = [UIColor greenColor];
        [self addSubview:_detailTitle];
        
        [_curImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(0);
            make.top.equalTo(self.mas_top).with.offset(0);
            make.width.equalTo(@(145));
            make.height.equalTo(@(114));
        }];
        
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_curImage.mas_bottom).with.offset(0);
            make.left.equalTo(_curImage.mas_left).with.offset(0);
            make.width.equalTo(_curImage.mas_width);
            make.height.equalTo(@(22));
        }];
        
        [_detailTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_title.mas_bottom).with.offset(0);
            make.left.equalTo(_curImage.mas_left).with.offset(0);
            make.width.equalTo(_curImage.mas_width);
            make.height.equalTo(@(16));
        }];
    }
    
    return self;
}

@end
