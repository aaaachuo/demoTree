//
//  FilterView.h
//  DemoTree
//
//  Created by 翟志杰 on 15/6/28.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    FilterCotegory,
    FilterCity,
    FilterSynthesis,
} FilterType;

@interface FilterView : UIView

/// 类型
@property (nonatomic, readonly) FilterType type;

-(id)initWithItem:(NSArray *)items type:(FilterType)type;
-(void)show;
-(void)dismiss;
-(void)dismiss:(BOOL)animated;


@property (nonatomic, copy) void (^selectRowAtIndex)();

@property (nonatomic, copy) void (^isDismiss)(void);

@end
