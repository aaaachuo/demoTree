//
//  ZJCutLine.h
//  vjifen
//
//  Created by 翟志杰 on 15/8/17.
//
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZJLineTypeHorizontal,
    ZJLineTypeVertical,
} LineType;

@interface ZJCutLine : UIView

/**
 *   @brief 初始化
 *
 *   @param LineType            方向
 *   @param origin              原点
 *   @param length              长度
 *   @param lineColor           颜色
 *
 *   @return
 */
- (instancetype)initWithLineType:(LineType)lineType
                          origin:(CGFloat)origin
                          length:(CGFloat)length
                       lineColor:(UIColor *)lineColor;


@end
