//
//  DetailBtn.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/1.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "DetailBtn.h"

@implementation DetailBtn

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(roundf(contentRect.size.width/2 - 8),
                      9, 16, 15);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(roundf(contentRect.size.width/2 - 40), 24,
                      80, 20);
}

@end
