//
//  DetailHeaderView.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/31.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "DetailHeaderView.h"
#import "DetailBtn.h"

@interface DetailHeaderView () {
    
    UILabel *_title;
    UIImageView *_curImage;
    UIImageView *_star1;
    UIImageView *_star2;
    UIImageView *_star3;
    UIImageView *_star4;
    UIImageView *_star5;
    UILabel *_time;
    UILabel *_area;
    
}

@end

@implementation DetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIView *currentView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 176)];
        currentView.layer.cornerRadius = 5.f;
        currentView.layer.masksToBounds = YES;
        currentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:currentView];
        
        _title = [[UILabel alloc] initWithFrame:CGRectMake(18, 0, SCREEN_WIDTH - 36, 44)];
        _title.text = @"【王府井/东单】舌尖记忆";
        _title.font = [UIFont systemFontOfSize:16];
        [currentView addSubview:_title];
        
        _curImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        _curImage.backgroundColor = [UIColor yellowColor];
        [currentView addSubview:_curImage];
        [_curImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(currentView.mas_left).with.offset(18);
            make.top.equalTo(_title.mas_bottom).with.offset(0);
            make.width.equalTo(@58);
            make.height.equalTo(@58);
        }];
        
        _star1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"evalUncheck"] highlightedImage:[UIImage imageNamed:@"evalSelect"]];
        
        [currentView addSubview:_star1];
        
        [_star1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_curImage.mas_right).with.offset(18);
            make.top.equalTo(_curImage.mas_top).with.offset(5);
            make.width.equalTo(@12);
            make.height.equalTo(@12);
        }];
        
        _star2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"evalUncheck"] highlightedImage:[UIImage imageNamed:@"evalSelect"]];
        
        [currentView addSubview:_star2];
        
        [_star2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_star1.mas_right).with.offset(2);
            make.top.equalTo(_curImage.mas_top).with.offset(5);
            make.width.equalTo(@12);
            make.height.equalTo(@12);
        }];
        
        _star3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"evalUncheck"] highlightedImage:[UIImage imageNamed:@"evalSelect"]];
        
        [currentView addSubview:_star3];
        
        [_star3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_star2.mas_right).with.offset(2);
            make.top.equalTo(_curImage.mas_top).with.offset(5);
            make.width.equalTo(@12);
            make.height.equalTo(@12);
        }];
        
        _star4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"evalUncheck"] highlightedImage:[UIImage imageNamed:@"evalSelect"]];
        
        [currentView addSubview:_star4];
        
        [_star4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_star3.mas_right).with.offset(2);
            make.top.equalTo(_curImage.mas_top).with.offset(5);
            make.width.equalTo(@12);
            make.height.equalTo(@12);
        }];
        
        _star5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"evalUncheck"] highlightedImage:[UIImage imageNamed:@"evalSelect"]];
        
        [currentView addSubview:_star5];
        
        [_star5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_star4.mas_right).with.offset(2);
            make.top.equalTo(_curImage.mas_top).with.offset(5);
            make.width.equalTo(@12);
            make.height.equalTo(@12);
        }];
        
        _time = [UILabel new];
        _time.text = @"营业时间：9：00-23：00";
        _time.font = [UIFont systemFontOfSize:13];
        _time.textColor = kUIColorFromRGB(0xb5b5b5);
        [currentView addSubview:_time];
        
        [_time mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_curImage.mas_right).with.offset(18);
            make.top.equalTo(_star1.mas_bottom).with.offset(6);
            make.width.equalTo(@150);
        }];
        
        _area = [UILabel new];
        _area.text = @"地区：北京市，朝阳区";
        _area.font = [UIFont systemFontOfSize:14];
        _area.textColor = kUIColorFromRGB(0x666666);
        [currentView addSubview:_area];
        
        [_area mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_curImage.mas_right).with.offset(18);
            make.top.equalTo(_time.mas_bottom).with.offset(3);
            make.width.equalTo(@150);
        }];
        
        UIView *cutLine = [UIView new];
        cutLine.backgroundColor = kUIColorFromRGB(0xeaeaea);
        [currentView addSubview:cutLine];
        
        [cutLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(currentView.mas_left).with.offset(0);
            make.right.equalTo(currentView.mas_right).with.offset(0);
            make.top.equalTo(_curImage.mas_bottom).with.offset(26);
            make.height.equalTo(@0.5);
        }];
        
        
        CGFloat width = CGRectGetWidth(currentView.frame)/3;
        UIView *cutLine1 = [UIView new];
        cutLine1.backgroundColor = kUIColorFromRGB(0xeaeaea);
        [currentView addSubview:cutLine1];
        
        [cutLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(currentView.mas_left).with.offset(width);
            make.top.equalTo(cutLine.mas_bottom).with.offset(0);
            make.width.equalTo(@1);
            make.height.equalTo(@52);
        }];
        
        UIView *cutLine2 = [UIView new];
        cutLine2.backgroundColor = kUIColorFromRGB(0xeaeaea);
        [currentView addSubview:cutLine2];
        
        [cutLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cutLine1.mas_left).with.offset(width);
            make.top.equalTo(cutLine.mas_bottom).with.offset(0);
            make.width.equalTo(@1);
            make.height.equalTo(@52);
        }];
        
        DetailBtn *btn1 = [DetailBtn new];
        [btn1 addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
        [btn1 setImage:[UIImage imageNamed:@"merchant_order"] forState:UIControlStateNormal];
        btn1.tag = 100;
        [btn1 setTitle:@"及时点餐" forState:UIControlStateNormal];
        [currentView addSubview:btn1];
        
        [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(currentView.mas_left).with.offset(0);
            make.top.equalTo(cutLine.mas_bottom).with.offset(0);
            make.width.equalTo(@(width));
            make.height.equalTo(@52);
        }];
        
        DetailBtn *btn2 = [DetailBtn new];
        [btn2 addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
        [btn2 setImage:[UIImage imageNamed:@"merchant_ordering"] forState:UIControlStateNormal];
        btn2.tag = 200;
        [btn2 setTitle:@"商业预订" forState:UIControlStateNormal];
        [currentView addSubview:btn2];
        
        [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn1.mas_right).with.offset(0);
            make.top.equalTo(cutLine.mas_bottom).with.offset(0);
            make.width.equalTo(@(width));
            make.height.equalTo(@52);
        }];
        
        DetailBtn *btn3 = [DetailBtn new];
        [btn3 addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
        [btn3 setImage:[UIImage imageNamed:@"merchant_takeaway"] forState:UIControlStateNormal];
        btn3.tag = 300;
        [btn3 setTitle:@"外卖" forState:UIControlStateNormal];
        [currentView addSubview:btn3];
        
        [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn2.mas_right).with.offset(0);
            make.top.equalTo(cutLine.mas_bottom).with.offset(0);
            make.width.equalTo(@(width));
            make.height.equalTo(@52);
        }];
    }
    
    return self;
}

- (void)btn1Action:(UIButton *)sender {
    
    switch (sender.tag) {
        case 100:
        {
            self.merchantOrder();
        }
            break;
        case 200:
        {
            self.merchantOrdering();
        }
            break;
        case 300:
        {
            self.merchantTakeaway();
        }
            break;
        default:
            break;
    }
}

@end
