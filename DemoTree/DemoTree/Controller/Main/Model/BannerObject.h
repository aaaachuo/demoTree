//
//  BannerObject.h
//  DemoTree
//
//  Created by 翟志杰 on 15/8/2.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerObject : NSObject

/// 图片描述
@property (nonatomic, copy) NSString *picDesc;
/// 图片名称
@property (nonatomic, copy) NSString *picName;
/// 图片大小
@property (nonatomic, copy) NSString *picSize;
/// 图片ID
@property (nonatomic, copy) NSString *picId;
/// 图片类型 1-banner
@property (nonatomic, copy) NSString *picType;
/// 图片类型ID
@property (nonatomic, copy) NSString *picTypeId;
/// 图片路径
@property (nonatomic, copy) NSString *picUrl;

@end
