//
//  ZZTabBarItem.h
//  CustTabbarController
//
//  Created by 翟志杰 on 15/6/8.
//  Copyright (c) 2015年 翟志杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZTabBarItem : UIControl

/// 高度 
@property CGFloat itemHeight;
/// 标题
@property (nonatomic, copy) NSString *title;
/// 没选中的标题样式
@property (copy) NSDictionary *unselectedTitleAttributes;
/// 选中的标题样式
@property (copy) NSDictionary *selectedTitleAttributes;
/// 选中的图片
@property (nonatomic, strong) UIImage *selectedImage;
/// 未选中的图片
@property (nonatomic, strong) UIImage *unselectedImage;
/// 角标背景颜色
@property (nonatomic, strong) UIColor *badgeBackgroundColor;
/// 角标文字颜色
@property (nonatomic, strong) UIColor *badgeTextColor;
/// 角标文字
@property (nonatomic, copy) NSString *badgeValue;
/// 角标字体
@property (nonatomic, strong) UIFont *badgeTextFont;


- (void)setFinishedSelectedImage:(UIImage *)selectedImage withFinishedUnselectedImage:(UIImage *)unselectedImage;

@end
