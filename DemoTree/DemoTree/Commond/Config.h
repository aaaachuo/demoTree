//
//  Config.h
//  DemoTree
//
//  Created by 翟志杰 on 15/8/16.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#ifndef DemoTree_Config_h
#define DemoTree_Config_h

#define IS_IOS8                                     [[[UIDevice currentDevice]systemVersion] floatValue] >= 8.0

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define KRGBColor(R,G,B) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:1]

#define TITLE_COLOR [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]
#define PICK_COLOR [UIColor colorWithRed:252/255.0 green:113/255.0 blue:114/255.0 alpha:1]
#define BACKGRAY_COLOR kUIColorFromRGB(0xeeede9)

//
#define IDS_SERVER_COMMON                             @"http://101.200.233.41:8100/meichu-api/meichu/api/common/"
#define IDS_SERVER                                    @"http://101.200.233.41:8100/meichu-api/meichu/api/"

#define IDS_TEST_SERVER                               @"http://10.10.10.16:8080/meichu/api/common/getResList"

#define IDS_MAIN_BANNER         [IDS_SERVER_COMMON stringByAppendingString:@"homepage/getBanner"]
#define IDS_MAIN_SALELIST       [IDS_SERVER_COMMON stringByAppendingString:@"homepage/dailySaleList"]


#define IDS_RES_MERCHANTLIST    [IDS_SERVER stringByAppendingString:@"merchant/list"]


#define IDS_MERCH_DISHLIST      [IDS_SERVER stringByAppendingString:@"dish/list"]


#endif
