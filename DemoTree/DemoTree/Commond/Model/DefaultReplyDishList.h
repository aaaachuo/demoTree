//
//DefaultReplyDishList.h 
//
//
//Create by zhaizhijie on 15/8/17 
//Copyright (c) 2015年 zhaizhijie. All rights reserved.
//
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DefaultReplyDishList:NSObject<NSCoding>
@property (nonatomic,assign) NSInteger dishId;
@property (nonatomic,assign) NSInteger dailySaleStatus;
@property (nonatomic,assign) CGFloat dishPrice;
@property (nonatomic,copy) NSString *dishDesc1;
@property (nonatomic,assign) NSInteger dataState;
@property (nonatomic,copy) NSString *dishDesc3;
@property (nonatomic,copy) NSString *dishDesc5;
@property (nonatomic,assign) NSInteger bookCount;
@property (nonatomic,copy) NSArray *picList;
@property (nonatomic,assign) NSInteger recommendStatus;
@property (nonatomic,copy) NSString *dishTaste;
@property (nonatomic,copy) NSString *dishName;
@property (nonatomic,assign) NSInteger merchantId;
@property (nonatomic,copy) NSString *dishMaterial;
@property (nonatomic,copy) NSString *dishDesc2;
@property (nonatomic,copy) NSString *dishDesc4;
@property (nonatomic,copy) NSString *dishDesc6;
@property (nonatomic,assign) NSInteger dishTypeId;
@property (nonatomic,assign) CGFloat salePrice;
@property (nonatomic,assign) NSInteger saleStatus;
@property (nonatomic,copy) NSString *dishPic;

@end