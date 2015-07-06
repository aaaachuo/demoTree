//
//  FilterView.h
//  DemoTree
//
//  Created by 翟志杰 on 15/6/30.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterView : UIView

/// 全部分类
@property (nonatomic, strong) UIButton *leftFilter;
/// 地区
@property (nonatomic, strong) UIButton *centerFilter;
/// 排序
@property (nonatomic, strong) UIButton *rightFilter;

@end
