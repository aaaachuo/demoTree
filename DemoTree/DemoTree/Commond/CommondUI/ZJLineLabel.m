//
//  ZJLineLabel.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/12.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "ZJLineLabel.h"

@interface ZJLineLabel () {
    
    CGFloat orginY;
    NSString *_key;
    NSString *_colorKey;
    UIColor *_color;
}

@end

@implementation ZJLineLabel

- (instancetype)initWithFrame:(CGRect)frame textColor:(UIColor *)textColor lineType:(LineType)lineType {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        switch (lineType) {
            case LabelLineInCenter:
            {
                _key = NSStrikethroughStyleAttributeName;
                _colorKey = NSStrikethroughColorAttributeName;
            }
                break;
            case LabelLineInBottom:
            {
                _key = NSUnderlineStyleAttributeName;
                _colorKey = NSUnderlineColorAttributeName;
            }
                break;
                
            default:
                break;
        }
        
        _color = textColor;
        self.textColor = _color;
        self.font = [UIFont systemFontOfSize:12];
    }
    
    return self;
}

- (void)setText:(NSString *)text {
    
    NSDictionary *attribtDic = @{_key: [NSNumber numberWithInteger:NSUnderlineStyleSingle],
                                 _colorKey: _color};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:text
                                                                                  attributes:attribtDic];
    self.attributedText = attribtStr;
}

@end
