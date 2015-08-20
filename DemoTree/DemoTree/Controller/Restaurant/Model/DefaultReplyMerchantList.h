//
//DefaultReplyMerchantList.h 
//
//
//Create by zhaizhijie on 15/8/17 
//Copyright (c) 2015年 zhaizhijie. All rights reserved.
//
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DefaultReplyMerchantList:NSObject
@property (nonatomic,assign) NSInteger userId;
@property (nonatomic,copy) NSString *areaName;
@property (nonatomic,copy) NSString *nickName;
@property (nonatomic,assign) NSInteger bizReserveStatus;
@property (nonatomic,copy) NSString *merchantName;
@property (nonatomic,assign) NSInteger userStatus;
@property (nonatomic,copy) NSString *userTel;
@property (nonatomic,copy) NSString *siginTime;
@property (nonatomic,assign) NSInteger uuId;
@property (nonatomic,assign) NSInteger areaId;
@property (nonatomic,copy) NSString *userPic;
@property (nonatomic,assign) NSInteger userType;
@property (nonatomic,copy) NSString *closeTime;
@property (nonatomic,assign) NSInteger realTimeStatus;
@property (nonatomic,assign) NSInteger merchantId;
@property (nonatomic,copy) NSString *distance;
@property (nonatomic,copy) NSString *securityCode;
@property (nonatomic,copy) NSString *openTime;
@property (nonatomic,assign) NSInteger takeOutStatus;
@property (nonatomic,assign) CGFloat startCount;
@property (nonatomic,copy) NSString *superAreaName;
@property (nonatomic,assign) NSInteger merchantTypeId;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,copy) NSString *merchantDesc;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,assign) NSInteger waitCount;
@property (nonatomic,copy) NSString *addressDetail;

@end