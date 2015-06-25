//
//  ZZTabBarViewController.h
//  CustTabbarController
//
//  Created by 翟志杰 on 15/6/8.
//  Copyright (c) 2015年 翟志杰. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ZZTabBarViewController, ZZTabBarItem, ZZTabBarView;

@protocol ZZTabBarControllerDelegate <NSObject>

- (BOOL)tabBarConroller:(ZZTabBarViewController *)tabBarController shouldSelectedViewController:(UIViewController *)viewController;

- (BOOL)tabBarConroller:(ZZTabBarViewController *)tabBarController didSelectViewController:(UIViewController *)viewController;

@end

@interface ZZTabBarViewController : UIViewController

@property (nonatomic, assign) id<ZZTabBarControllerDelegate> delegate;

/// controllers
@property (nonatomic, copy) NSArray *controllers;

/// tabBar
@property (nonatomic, readonly) ZZTabBarView *tabBar;

/// 选中的控制器
@property (nonatomic, strong) UIViewController *selectController;

/// 选中的下标
@property (nonatomic) NSInteger selectedIndex;

/// 是否隐藏选项卡
@property (nonatomic, getter=isTabBarHidden) BOOL tabBarHidden;

/**
 *   @brief 是否隐藏选项卡
 *
 *   @return
 */
- (void)setTabBarHidden:(BOOL)tabBarHidden animeted:(BOOL)animeted;

@end

@interface UIViewController (ZZTabBarControllerItem)

@property (nonatomic, setter = zz_setTabBarItem:) ZZTabBarItem *zz_tabBarItem;

@property (nonatomic, readonly) ZZTabBarViewController *zz_tabBarController;

@end
