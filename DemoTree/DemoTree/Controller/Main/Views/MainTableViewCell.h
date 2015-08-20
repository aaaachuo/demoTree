//
//  MainTableViewCell.h
//  DemoTree
//
//  Created by 翟志杰 on 15/7/31.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DefaultReplyDishList;

@interface MainTableViewCell : UITableViewCell

/// 赋值
@property (nonatomic, strong) DefaultReplyDishList *dishDetail;
/// 是否显示选项框
@property (nonatomic, assign) BOOL showCheck;

@end
