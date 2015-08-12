//
//  NewHeaderView.h
//  DemoTree
//
//  Created by 翟志杰 on 15/7/31.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdScrollView;
@class NewHeaderView;

@protocol HeaderViewDelegate <NSObject>

- (void)headerView:(NewHeaderView *)headerView selectedItemTag:(NSInteger)tag;

@end

@interface NewHeaderView : UIView

@property (nonatomic, strong) AdScrollView *adScrollView;
@property (nonatomic, assign) id <HeaderViewDelegate> delegate;

@end
