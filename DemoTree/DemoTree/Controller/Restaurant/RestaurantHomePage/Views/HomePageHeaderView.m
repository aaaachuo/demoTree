//
//  HomePageHeaderView.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/18.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "HomePageHeaderView.h"
#import "ZJCutLine.h"

@interface HomePageHeaderView ()

@property (nonatomic, strong) UIImageView   *curImage;
@property (nonatomic, strong) UIImageView   *recommend;

@property (nonatomic, strong) UIImageView   *curImage1;
@property (nonatomic, strong) UIImageView   *recommend1;

@end

@implementation HomePageHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        _curImage = [[UIImageView alloc] init];
        _curImage.backgroundColor = [UIColor redColor];
        [self addSubview:_curImage];
        
        [_curImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.top.equalTo(self.mas_top).with.offset(10);
            make.width.equalTo(@(adjustsSizeToFitWithWidth320(145)));
            make.height.equalTo(@(adjustsSizeToFitWithWidth320(110)));
        }];
        
        _recommend = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"recommend"]];
        [_curImage addSubview:_recommend];
        
        [_recommend mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_curImage.mas_top).with.offset(0);
            make.right.equalTo(_curImage.mas_right).with.offset(0);
            make.width.equalTo(@(adjustsSizeToFitWithWidth320(36)));
            make.height.equalTo(@(adjustsSizeToFitWithWidth320(30)));
        }];
        
        
        _curImage1 = [[UIImageView alloc] init];
        _curImage1.backgroundColor = [UIColor redColor];
        [self addSubview:_curImage1];
        [_curImage1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.mas_top).with.offset(10);
            make.width.equalTo(@(adjustsSizeToFitWithWidth320(145)));
            make.height.equalTo(@(adjustsSizeToFitWithWidth320(110)));
        }];
        
        _recommend1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"recommend"]];
        [_curImage1 addSubview:_recommend1];
        
        [_recommend1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_curImage.mas_top).with.offset(0);
            make.right.equalTo(_curImage.mas_right).with.offset(0);
            make.width.equalTo(@(adjustsSizeToFitWithWidth320(36)));
            make.height.equalTo(@(adjustsSizeToFitWithWidth320(30)));
        }];
        
        UIView *grayView = [[UIView alloc] init];
        grayView.backgroundColor = KRGBColor(237, 237, 234);
        [self addSubview:grayView];
        
        [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_curImage.mas_bottom).with.offset(adjustsSizeToFitWithWidth320(10));
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(0);
            make.height.equalTo(@(adjustsSizeToFitWithWidth320(10)));
        }];
        
        ZJCutLine *line1 = [[ZJCutLine alloc] initWithLineType:ZJLineTypeHorizontal origin:0 length:SCREEN_WIDTH lineColor:kUIColorFromRGB(0xe1e1e1)];
        [grayView addSubview:line1];
        
        UIView *cutRule2 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 0.5)];
        cutRule2.backgroundColor = kUIColorFromRGB(0xe1e1e1);
        [self addSubview:cutRule2];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, SCREEN_WIDTH, 20)];
        title.text = @"  全部菜品";
        title.font = [UIFont boldSystemFontOfSize:15];
        title.textColor = KRGBColor(51, 51, 51);
        [self addSubview:title];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(grayView.mas_bottom).with.offset(0);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.height.equalTo(@(adjustsSizeToFitWithWidth320(30)));
        }];
        
        ZJCutLine *line2 = [[ZJCutLine alloc] initWithLineType:ZJLineTypeHorizontal origin:0 length:SCREEN_WIDTH lineColor:kUIColorFromRGB(0xe1e1e1)];
        [title addSubview:line2];
    }
    
    return self;
}

@end
