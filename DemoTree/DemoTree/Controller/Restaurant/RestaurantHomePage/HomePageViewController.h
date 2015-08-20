//
//  HomePageViewController.h
//  DemoTree
//
//  Created by 翟志杰 on 15/7/5.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DefaultReplyMerchantList;

@interface HomePageViewController : UIViewController

/// 餐厅数据
@property (nonatomic, strong) DefaultReplyMerchantList *merchant;

@end
