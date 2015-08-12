//
//  NewHeaderView.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/31.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "NewHeaderView.h"
#import "AdScrollView.h"

@implementation NewHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = kUIColorFromRGB(0xeeeee9);
        
        [TreeManager shareDemoTreeManager];
        
        NSString *deviceScreen = getDeviceScreen();
        
        CGFloat adHeight = 0;
        CGFloat buttonWidth = 0;
        CGFloat touchViewHeight = 0;
        CGFloat cellTitleViewHeight = 0;
        if ([deviceScreen isEqualToString:@"4.7"]) {
            
        }else if ([deviceScreen isEqualToString:@"5.5"]) {
            
        }else {
            adHeight = 160;
            buttonWidth = 88;
            touchViewHeight = 54;
            cellTitleViewHeight = 34;
        }
        
        AdScrollView *adscrollView = [[AdScrollView alloc] init];
        adscrollView.backgroundColor = [UIColor redColor];
        adscrollView.PageControlShowStyle = UIPageControlShowStyleRight;
        adscrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        adscrollView.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        
        _adScrollView = adscrollView;
        [self addSubview:_adScrollView];
        
        [_adScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.mas_top).with.offset(0);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_left).with.offset(0);
            
            make.height.equalTo(@(adHeight));
        }];
        
        UIButton *ordering = [[UIButton alloc] init];
        ordering.layer.cornerRadius = buttonWidth/2;
        ordering.layer.borderColor = kUIColorFromRGB(0xdfd9d1).CGColor;
        ordering.layer.borderWidth = 0.5f;
        ordering.layer.masksToBounds = YES;
        ordering.backgroundColor = [UIColor redColor];
        ordering.tag = 100;
        [ordering addTarget:self action:@selector(headerAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:ordering];
        
        UIButton *reservation = [[UIButton alloc] init];
        reservation.layer.cornerRadius = buttonWidth/2;
        reservation.layer.borderColor = kUIColorFromRGB(0xdfd9d1).CGColor;
        reservation.layer.borderWidth = 0.5f;
        reservation.layer.masksToBounds = YES;
        reservation.backgroundColor = [UIColor redColor];
        reservation.tag = 200;
        [reservation addTarget:self action:@selector(headerAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:reservation];
        
        UIButton *takeOut = [[UIButton alloc] init];
        takeOut.layer.cornerRadius = buttonWidth/2;
        takeOut.layer.borderColor = kUIColorFromRGB(0xdfd9d1).CGColor;
        takeOut.layer.borderWidth = 0.5f;
        takeOut.layer.masksToBounds = YES;
        takeOut.backgroundColor = [UIColor redColor];
        takeOut.tag = 300;
        [takeOut addTarget:self action:@selector(headerAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:takeOut];
        
        [ordering mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_left).with.offset(10);
            make.top.equalTo(adscrollView.mas_bottom).with.offset(15);
            make.width.equalTo(@(buttonWidth));
            make.height.equalTo(@(buttonWidth));
        }];
        
        [reservation mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ordering.mas_right).with.offset(18);
            make.top.equalTo(ordering.mas_top).with.offset(0);
            make.width.equalTo(@(buttonWidth));
            make.height.equalTo(@(buttonWidth));
        }];
        
        [takeOut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(reservation.mas_right).with.offset(18);
            make.top.equalTo(ordering.mas_top).with.offset(0);
            make.width.equalTo(@(buttonWidth));
            make.height.equalTo(@(buttonWidth));
        }];
        
        UILabel *orderingTitle = [[UILabel alloc] init];
        orderingTitle.text = @"及时点餐";
        orderingTitle.font = [UIFont systemFontOfSize:13];
        orderingTitle.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        orderingTitle.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:orderingTitle];
        
        UILabel *reservationTitle = [[UILabel alloc] init];
        reservationTitle.text = @"商业预定";
        reservationTitle.font = [UIFont systemFontOfSize:13];
        reservationTitle.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        reservationTitle.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:reservationTitle];
        
        UILabel *takeOutTitle = [[UILabel alloc] init];
        takeOutTitle.text = @"外卖";
        takeOutTitle.font = [UIFont systemFontOfSize:13];
        takeOutTitle.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        takeOutTitle.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:takeOutTitle];
        
        [orderingTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ordering.mas_bottom).with.offset(10);
            make.centerX.equalTo(ordering.mas_centerX);
            
            make.width.equalTo(ordering.mas_width);
            make.height.equalTo(@(13));
        }];
        
        [reservationTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(orderingTitle.mas_top).with.offset(0);
            make.centerX.equalTo(reservation.mas_centerX);
            
            make.width.equalTo(ordering.mas_width);
            make.height.equalTo(orderingTitle.mas_height);
        }];
        
        [takeOutTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(orderingTitle.mas_top).with.offset(0);
            make.centerX.equalTo(takeOut.mas_centerX);
            
            make.width.equalTo(ordering.mas_width);
            make.height.equalTo(orderingTitle.mas_height);
        }];
        
        UIView *touchView = [[UIView alloc] init];
        touchView.backgroundColor = [UIColor whiteColor];
        [self addSubview:touchView];
        
        [touchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(0);
            make.top.equalTo(orderingTitle.mas_bottom).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(0);
            
            make.height.equalTo(@(touchViewHeight));
        }];
        
        UIButton *aaInvite = [[UIButton alloc] init];
        [aaInvite setTitle:@"AA约饭" forState:UIControlStateNormal];
        aaInvite.titleLabel.font = [UIFont systemFontOfSize:15];
        [aaInvite setTitleColor:KRGBColor(51, 51, 51) forState:UIControlStateNormal];
        [touchView addSubview:aaInvite];
        
        UIImageView *AAImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aaInvite"]];
        [touchView addSubview:AAImage];
        
        [aaInvite mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(touchView.mas_left).with.offset(0);
            make.top.equalTo(touchView.mas_top).with.offset(0);
            make.bottom.equalTo(touchView.mas_bottom).with.offset(0);
            make.width.equalTo(@(SCREEN_WIDTH/2));
        }];
        
        [AAImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(touchView.mas_left).with.offset(20);
            make.centerY.equalTo(touchView.mas_centerY);
            make.width.equalTo(@(23));
            make.height.equalTo(@(23));
        }];
        
        UIView *cutOffRule = [[UIView alloc] init];
        cutOffRule.backgroundColor = kUIColorFromRGB(0xcacbc8);
        [touchView addSubview:cutOffRule];
        
        [cutOffRule mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(touchView.mas_top).with.offset(0);
            make.left.equalTo(aaInvite.mas_right).with.offset(-.5);
            make.width.equalTo(@.5f);
            make.height.equalTo(touchView.mas_height);
            
        }];
        
        UIButton *vouchers = [[UIButton alloc] init];
        [vouchers setTitle:@"代金券" forState:UIControlStateNormal];
        vouchers.titleLabel.font = [UIFont systemFontOfSize:15];
        [vouchers setTitleColor:KRGBColor(51, 51, 51) forState:UIControlStateNormal];
        [touchView addSubview:vouchers];
        
        UIImageView *VHImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vouchers"]];
        [touchView addSubview:VHImage];
        
        [vouchers mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(aaInvite.mas_right).with.offset(0);
            make.top.equalTo(touchView.mas_top).with.offset(0);
            make.bottom.equalTo(touchView.mas_bottom).with.offset(0);
            make.width.equalTo(@(SCREEN_WIDTH/2));
        }];
        
        [VHImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(aaInvite.mas_right).with.offset(20);
            make.centerY.equalTo(touchView.mas_centerY);
            make.width.equalTo(@(23));
            make.height.equalTo(@(23));
        }];
        
        UIView *cutOffRule1 = [[UIView alloc] init];
        cutOffRule1.backgroundColor = kUIColorFromRGB(0xcacbc8);
        [touchView addSubview:cutOffRule1];
        
        [cutOffRule1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(touchView.mas_top).with.offset(touchViewHeight);
            make.centerX.equalTo(touchView.mas_centerX);
            make.width.equalTo(@(SCREEN_WIDTH));
            make.height.equalTo(@1.f);
            
        }];
        
        UIView *cellTitleView = [[UIView alloc] init];
        cellTitleView.backgroundColor = [UIColor whiteColor];
        [self addSubview:cellTitleView];
        
        [cellTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(0);
            make.top.equalTo(cutOffRule1.mas_bottom).with.offset(10);
            make.right.equalTo (self.mas_right).with.offset(0);
            make.height.equalTo(@(cellTitleViewHeight));
        }];
        
        UIView *cutOffRule2 = [[UIView alloc] init];
        cutOffRule2.backgroundColor = kUIColorFromRGB(0xe1e1e1);
        [cellTitleView addSubview:cutOffRule2];
        
        [cutOffRule2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cellTitleView.mas_top).with.offset(0);
            make.centerX.equalTo(cellTitleView.mas_centerX);
            make.width.equalTo(@(SCREEN_WIDTH));
            make.height.equalTo(@0.5f);
            
        }];
        
        UILabel *title = [[UILabel alloc] init];
        title.text = @"每日特惠";
        title.font = [UIFont systemFontOfSize:15];
        title.textColor = KRGBColor(51, 51, 51);
        [cellTitleView addSubview:title];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cellTitleView.mas_left).with.offset(15);
            make.centerY.equalTo(cellTitleView.mas_centerY);
        }];
        
    }
    
    return self;
}

- (void)headerAction:(UIButton *)sender {
    
    if ([_delegate respondsToSelector:@selector(headerView:selectedItemTag:)]) {
        [_delegate headerView:self selectedItemTag:sender.tag];
    }
    
}

@end
