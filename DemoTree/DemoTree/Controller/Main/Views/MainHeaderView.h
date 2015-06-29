//
//  MainHeaderView.h
//  DemoTree
//
//  Created by 翟志杰 on 15/6/22.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AdScrollView;
@class MainHeaderView;

@protocol MainHeaderViewDelegate <NSObject>

- (void)headerView:(MainHeaderView *)headerView selectedItemTag:(NSInteger)tag;

@end

@interface MainHeaderView : UICollectionReusableView
/// 广告
@property (nonatomic, strong) AdScrollView *adScrollView;
@property (nonatomic, assign) id <MainHeaderViewDelegate> delegate;

@end
