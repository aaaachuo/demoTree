//
//  ZZTabBarView.h
//  CustTabbarController
//
//  Created by 翟志杰 on 15/6/8.
//  Copyright (c) 2015年 翟志杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZZTabBarItem, ZZTabBarView;

@protocol ZZTabBarDelegate <NSObject>

/**
 *   @brief 告诉控制器，选项将要被选中
 *
 *   @param index          选项卡选线
 *
 *   @return
 */
- (BOOL)ZZTabBar:(ZZTabBarView *)tabBar shouldSelectedItemAtIndex:(NSInteger)index;

/**
 *   @brief 告诉控制器，选项被选中
 *
 *   @param index          选项卡选线
 *
 *   @return
 */
- (void)ZZTabBar:(ZZTabBarView *)tabBar didSelectItemAtIndex:(NSInteger)index;

@end


@interface ZZTabBarView : UIView

@property (nonatomic, assign) id<ZZTabBarDelegate> delegate;

@property (nonatomic, copy) NSArray *items;

@property (nonatomic, weak) ZZTabBarItem *selectedItem;

@property (nonatomic, readonly) UIView *backgroundView;

@property UIEdgeInsets contentEdgeInsets;

- (void)setHeight:(CGFloat)height;

- (CGFloat)minimumContentHeight;

@property (nonatomic, getter=isTranslucent) BOOL translucent;

@end
