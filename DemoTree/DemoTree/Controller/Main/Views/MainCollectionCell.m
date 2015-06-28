//
//  MainCollectionCell.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/26.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "MainCollectionCell.h"

@interface MainCollectionCell ()

@property (nonatomic, strong) UIImageView   *curImage;
@property (nonatomic, strong) UILabel       *title;

@end

@implementation MainCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor cyanColor];
        
        _curImage = [[UIImageView alloc] init];
        _curImage.backgroundColor = [UIColor redColor];
        [self addSubview:_curImage];
        
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:12];
        _title.textColor = KRGBColor(51, 51, 51);
        _title.backgroundColor = [UIColor yellowColor];
        [self addSubview:_title];
        
        [_curImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(0);
            make.top.equalTo(self.mas_top).with.offset(0);
            make.width.equalTo(@(93));
            make.height.equalTo(@(74));
        }];
        
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_curImage.mas_bottom).with.offset(0);
            make.centerX.equalTo(_curImage.mas_centerX);
            make.width.equalTo(_curImage.mas_width);
            make.height.equalTo(@(22));
        }];
    }
    
    return self;
}

@end
