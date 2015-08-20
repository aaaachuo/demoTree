//
//  MainRequestHeader.h
//  DemoTree
//
//  Created by 翟志杰 on 15/8/1.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MainRequestHeader : NSObject

/**
 *   @brief 获取首页banner接口
 *
 *   @return
 */
+ (NSDictionary *)getMainBannerRequestHeader;

/**
 *   @brief 获取首页推荐接口
 *
 *   @param page          页码
 *
 *   @return
 */
+ (NSDictionary *)getMainDailySaleListRequestHeader:(NSInteger)page;

/**
 *   @brief 获取分类接口
 *
 *   @param type          餐厅分类类型, area-区域 distance-距离 merchanttype:餐厅分类
 *   @param page          页码
 *
 *   @return
 */
+ (NSDictionary *)getResListWithType:(NSString *)type
                                area:(NSString *)area
                            distance:(NSString *)distance
                                page:(NSInteger)page;


/**
 *   @brief 获取餐厅列表
 *
 *   @param type          餐厅分类类型, area-区域 distance-距离 merchanttype:餐厅分类
 *   @param page          页码
 *
 *   @return
 */
+ (NSDictionary *)getMerchantListWithType:(NSString *)type
                                     area:(NSString *)area
                                 distance:(NSString *)distance
                                     page:(NSInteger)page;

/**
 *   @brief 获取餐厅菜品列表
 *
 *   @param merchantID          餐厅ID
 *
 *   @return
 */
+ (NSDictionary *)getDishListWithMerchantID:(NSInteger)merchantID;
@end
