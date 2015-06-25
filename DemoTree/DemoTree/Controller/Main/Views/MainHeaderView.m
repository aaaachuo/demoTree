//
//  MainHeaderView.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/22.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "MainHeaderView.h"
#import "AdScrollView.h"

@implementation MainHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        AdScrollView *adscrollView = [[AdScrollView alloc] init];
        adscrollView.PageControlShowStyle = UIPageControlShowStyleRight;
        adscrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        adscrollView.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        
        _adScrollView = adscrollView;
        [self addSubview:_adScrollView];
        
        
    }
    
    return self;
}

@end
