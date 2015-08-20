//
//  ZJLineLabel.h
//  DemoTree
//
//  Created by 翟志杰 on 15/8/12.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LabelLineInCenter,
    LabelLineInBottom,
} LineType;

@interface ZJLineLabel : UILabel

- (instancetype)initWithFrame:(CGRect)frame textColor:(UIColor *)textColor lineType:(LineType)lineType;

@end
