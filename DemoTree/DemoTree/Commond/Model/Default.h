//
//Default.h 
//
//
//Create by zhaizhijie on 15/8/17 
//Copyright (c) 2015年 zhaizhijie. All rights reserved.
//
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DefaultReply.h"
@interface Default:NSObject<NSCoding>
@property (nonatomic,copy) NSString *protocol;
@property (nonatomic,assign) NSInteger code;
@property (nonatomic,copy) NSString *businessMessage;
@property (nonatomic,copy) NSString *message;
@property (nonatomic,strong) DefaultReply *reply;
@property (nonatomic,assign) NSInteger replyTime;
@property (nonatomic,assign) NSInteger businessCode;

@end