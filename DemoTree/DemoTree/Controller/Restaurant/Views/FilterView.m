//
//  FilterView.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/30.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "FilterView.h"

@implementation FilterView

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    UIView *horizontalRule = [[UIView alloc] init];
    horizontalRule.backgroundColor = kUIColorFromRGB(0xe1e1e1);
    [self addSubview:horizontalRule];
    
    [horizontalRule mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
        
        make.height.equalTo(@0.5f);
    }];
    
    UIView *verticalLeftRule = [[UIView alloc] init];
    verticalLeftRule.backgroundColor = kUIColorFromRGB(0xe1e1e1);
    [self addSubview:verticalLeftRule];
    
    UIView *verticalRightRule = [[UIView alloc] init];
    verticalRightRule.backgroundColor = kUIColorFromRGB(0xe1e1e1);
    [self addSubview:verticalRightRule];
    
    [verticalLeftRule mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset((SCREEN_WIDTH - 20) / 3 + 10);
        
        make.height.equalTo(self.mas_height);
        make.width.equalTo(@1);
    }];
    
    [verticalRightRule mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(verticalLeftRule.mas_right).with.offset((SCREEN_WIDTH - 20) / 3);
        
        make.height.equalTo(self.mas_height);
        make.width.equalTo(@1);
    }];
    
    UIImageView *dropLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drop"]];
    [self addSubview:dropLeft];
    
    UIImageView *dropCenter = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drop"]];
    [self addSubview:dropCenter];
    
    UIImageView *dropRight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drop"]];
    [self addSubview:dropRight];
    
    [dropLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(verticalLeftRule.mas_left).offset(-8);
        make.bottom.equalTo(horizontalRule.mas_top).offset(-8);
        
        make.width.equalTo(@(6));
        make.height.equalTo(@(6));
    }];
    
    [dropCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(verticalRightRule.mas_left).offset(-8);
        make.bottom.equalTo(horizontalRule.mas_top).offset(-8);
        
        make.width.equalTo(@(6));
        make.height.equalTo(@(6));
    }];
    
    [dropRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-18);
        make.bottom.equalTo(horizontalRule.mas_top).offset(-8);
        
        make.width.equalTo(@(6));
        make.height.equalTo(@(6));
    }];
    
   // /*
    
    
    _leftFilter = [[UIButton alloc] init];
    [_leftFilter setTitle:@"全部分类" forState:UIControlStateNormal];
    [_leftFilter setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [_leftFilter setTitleColor:PICK_COLOR forState:UIControlStateSelected];
    _leftFilter.titleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_leftFilter];
    
    _centerFilter = [[UIButton alloc] init];
    [_centerFilter setTitle:@"全城" forState:UIControlStateNormal];
    [_centerFilter setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [_centerFilter setTitleColor:PICK_COLOR forState:UIControlStateSelected];
    _centerFilter.titleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_centerFilter];
    
    _rightFilter = [[UIButton alloc] init];
    [_rightFilter setTitle:@"综合排序" forState:UIControlStateNormal];
    [_rightFilter setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [_rightFilter setTitleColor:PICK_COLOR forState:UIControlStateSelected];
    _rightFilter.titleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_rightFilter];
    
    [_leftFilter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(verticalLeftRule.mas_left).offset(0);
        
        make.width.equalTo(@((SCREEN_WIDTH - 20) / 3));
        make.height.equalTo(@(40));
    }];
    
    [_centerFilter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_leftFilter.mas_top).with.offset(0);
        make.left.equalTo(verticalLeftRule.mas_right).with.offset(0);
        make.right.equalTo(verticalRightRule.mas_left).with.offset(0);
        
        make.width.equalTo(_leftFilter.mas_width);
        make.height.equalTo(_leftFilter.mas_height);
    }];
    
    [_rightFilter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_leftFilter.mas_top).with.offset(0);
        make.left.equalTo(verticalRightRule.mas_right).with.offset(0);
        
        make.width.equalTo(_leftFilter.mas_width);
        make.height.equalTo(_leftFilter.mas_height);
    }];
    
}

@end
