//
//  ResDetailHeaderView.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/7.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "ResDetailHeaderView.h"
#import "AdScrollView.h"

@implementation ResDetailHeaderView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        AdScrollView *scroll = [[AdScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 140)];
        [self addSubview:scroll];
        

    }
    
    return self;
}

@end
