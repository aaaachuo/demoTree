//
//  TabButton.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/9.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "TabButton.h"

@implementation TabButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(roundf(contentRect.size.width/2 - 8),
                      15, 16, 15);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(roundf(contentRect.size.width/2 - 40), 30,
                      80, 20);
}

@end
