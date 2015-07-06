//
//  RecommendCell.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/5.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "RecommendCell.h"

@interface RecommendCell ()

@property (nonatomic, strong) UIImageView   *curImage;
@property (nonatomic, strong) UIImageView   *recommend;

@end

@implementation RecommendCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        _curImage = [[UIImageView alloc] init];
        _curImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_curImage];
        
        [_curImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(0);
            make.top.equalTo(self.mas_top).with.offset(10);
            make.width.equalTo(@(145));
            make.height.equalTo(@(110));
        }];
        
        _recommend = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"recommend"]];
        [_curImage addSubview:_recommend];
        
        [_recommend mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_curImage.mas_top).with.offset(0);
            make.right.equalTo(_curImage.mas_right).with.offset(0);
            make.width.equalTo(@(36));
            make.height.equalTo(@(30));
        }];
    }
    
    return self;
}


@end
