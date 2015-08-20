//
//  ZJCutLine.m
//  vjifen
//
//  Created by 翟志杰 on 15/8/17.
//
//

#import "ZJCutLine.h"

@implementation ZJCutLine


- (instancetype)initWithLineType:(LineType)lineType origin:(CGFloat)origin length:(CGFloat)length lineColor:(UIColor *)lineColor {
    
    self = [super init];
    
    if (self) {
        
        if (lineType == ZJLineTypeHorizontal) {
            
            self.frame = CGRectMake(origin, 0, length - origin * 2, 0.5);
            
        }else if (lineType == ZJLineTypeVertical) {
            
            self.frame = CGRectMake(0, origin, length - origin * 2, 0.5);
        }
        
        self.backgroundColor = lineColor;
    }
    
    return self;
}


@end
