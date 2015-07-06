//
//  RecommendHeaderView.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/5.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "RecommendHeaderView.h"

@implementation RecommendHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
     
        UIView *cutRule1 = [[UIView alloc] initWithFrame:CGRectMake(0, -0.5, SCREEN_WIDTH, 0.5)];
        cutRule1.backgroundColor = kUIColorFromRGB(0xe1e1e1);
        [self addSubview:cutRule1];
        
        UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
        grayView.backgroundColor = KRGBColor(237, 237, 234);
        [self addSubview:grayView];
        
        UIView *cutRule2 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 0.5)];
        cutRule2.backgroundColor = kUIColorFromRGB(0xe1e1e1);
        [self addSubview:cutRule2];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, SCREEN_WIDTH, 20)];
        title.text = @"全部菜品";
        title.font = [UIFont boldSystemFontOfSize:15];
        title.textColor = KRGBColor(51, 51, 51);
        
        [self addSubview:title];
    }
    
    return self;
}

@end
