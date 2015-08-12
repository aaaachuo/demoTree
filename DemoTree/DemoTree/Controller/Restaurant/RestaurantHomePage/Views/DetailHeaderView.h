//
//  DetailHeaderView.h
//  DemoTree
//
//  Created by 翟志杰 on 15/7/31.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailHeaderView : UIView

/// 及时点餐
@property (nonatomic, copy) void (^merchantOrder) (void);
@property (nonatomic, copy) void (^merchantOrdering) (void);
@property (nonatomic, copy) void (^merchantTakeaway) (void);

@end
