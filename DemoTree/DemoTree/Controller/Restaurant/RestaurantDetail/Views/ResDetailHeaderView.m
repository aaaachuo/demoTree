//
//  ResDetailHeaderView.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/7.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "ResDetailHeaderView.h"
#import "AdScrollView.h"
#import "ZJLineLabel.h"
#import "DefaultReplyDishList.h"

@interface ResDetailHeaderView () {
    
    UILabel *_money;
    ZJLineLabel *_sale;
    UIView *_titleView;
    AdScrollView *_adScrollView;
    UILabel *_titleLabel;
}



@end

@implementation ResDetailHeaderView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        AdScrollView *scroll = [[AdScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, adjustsSizeToFitWithWidth320(140))];
        _adScrollView = scroll;
        [self addSubview:_adScrollView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, adjustsSizeToFitWithWidth320(140)-40, SCREEN_WIDTH, 40)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
        [self addSubview:_titleLabel];
        
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(scroll.frame), SCREEN_WIDTH, adjustsSizeToFitWithWidth320(56))];
        [self addSubview:_titleView];
        
        _money = [[UILabel alloc] init];
        [_titleView addSubview:_money];
        
        _sale = [[ZJLineLabel alloc] initWithFrame:CGRectZero textColor:[UIColor lightGrayColor] lineType:LabelLineInCenter];
        [_titleView addSubview:_sale];
        
        UIButton *btn = [UIButton new];
        [btn setTitle:@"立即预定" forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"merchant_bg"] forState:UIControlStateNormal];
        [_titleView addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleView.mas_top).with.offset(13);
            make.bottom.equalTo(_titleView.mas_bottom).with.offset(-13);
            make.right.equalTo(_titleView.mas_right).with.offset(-10);
            make.width.equalTo(@(100));
        }];
    }
    
    return self;
}

- (void)setDetailData:(DefaultReplyDishList *)detailData {
    
    _money.text = [NSString stringWithFormat:@"%.2f元",detailData.dishPrice];
    _sale.text = [NSString stringWithFormat:@"%.2f元",detailData.salePrice];
    _titleLabel.text = [NSString stringWithFormat:@"  %@",detailData.dishName];
    
    [_money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleView.mas_left).with.offset(10);
        make.top.equalTo(_titleView.mas_top).with.offset(0);
        make.bottom.equalTo(_titleView.mas_bottom).with.offset(0);
    }];
    
    [_sale mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_money.mas_right).with.offset(15);
        make.centerY.equalTo(_money.mas_centerY).with.offset(2);
    }];
}
@end
