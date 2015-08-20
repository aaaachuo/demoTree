//
//  RestaurantView.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/1.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "RestaurantView.h"

@interface RestaurantView () {
    
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

@implementation RestaurantView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        UIView *currentView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 176)];
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
        
        UIView *cutOffRule2 = [[UIView alloc] init];
        cutOffRule2.backgroundColor = BACKGRAY_COLOR;
        [currentView addSubview:cutOffRule2];
        
        [cutOffRule2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_curImage.mas_bottom).with.offset(20);
            make.left.equalTo(currentView.mas_left).with.offset(0);
            make.width.equalTo(@(SCREEN_WIDTH));
            make.height.equalTo(@10);
            
        }];
        
        UILabel *title = [[UILabel alloc] init];
        title.text = @"每日特惠";
        title.font = [UIFont systemFontOfSize:15];
        title.textColor = KRGBColor(51, 51, 51);
        [currentView addSubview:title];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(currentView.mas_left).with.offset(10);
            make.top.equalTo(cutOffRule2.mas_bottom).with.offset(10);
        }];
        
    }
    
    return self;
}

@end
