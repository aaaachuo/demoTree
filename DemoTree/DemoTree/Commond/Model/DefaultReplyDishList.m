//
//DefaultReplyDishList.m 
//
//
//Create by zhaizhijie on 15/8/17 
//Copyright (c) 2015年 zhaizhijie. All rights reserved.
//
//
#import "DefaultReplyDishList.h"
@implementation DefaultReplyDishList

-(instancetype)init{
	self = [super init];
	if(self){

	}
	return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	if(self){
		self.dishId = [aDecoder decodeIntegerForKey:@"dishId"];
		self.dailySaleStatus = [aDecoder decodeIntegerForKey:@"dailySaleStatus"];
		self.dishPrice = [aDecoder decodeDoubleForKey:@"dishPrice"];
		self.dishDesc1 = [aDecoder decodeObjectForKey:@"dishDesc1"];
		self.dataState = [aDecoder decodeIntegerForKey:@"dataState"];
		self.dishDesc3 = [aDecoder decodeObjectForKey:@"dishDesc3"];
		self.dishDesc5 = [aDecoder decodeObjectForKey:@"dishDesc5"];
		self.bookCount = [aDecoder decodeIntegerForKey:@"bookCount"];
		self.picList = [aDecoder decodeObjectForKey:@"picList"];
		self.recommendStatus = [aDecoder decodeIntegerForKey:@"recommendStatus"];
		self.dishTaste = [aDecoder decodeObjectForKey:@"dishTaste"];
		self.dishName = [aDecoder decodeObjectForKey:@"dishName"];
		self.merchantId = [aDecoder decodeIntegerForKey:@"merchantId"];
		self.dishMaterial = [aDecoder decodeObjectForKey:@"dishMaterial"];
		self.dishDesc2 = [aDecoder decodeObjectForKey:@"dishDesc2"];
		self.dishDesc4 = [aDecoder decodeObjectForKey:@"dishDesc4"];
		self.dishDesc6 = [aDecoder decodeObjectForKey:@"dishDesc6"];
		self.dishTypeId = [aDecoder decodeIntegerForKey:@"dishTypeId"];
		self.salePrice = [aDecoder decodeDoubleForKey:@"salePrice"];
		self.saleStatus = [aDecoder decodeIntegerForKey:@"saleStatus"];
	}
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeInteger:_dishId forKey:@"dishId"];
	[aCoder encodeInteger:_dailySaleStatus forKey:@"dailySaleStatus"];
	[aCoder encodeDouble:_dishPrice forKey:@"dishPrice"];
	[aCoder encodeObject:_dishDesc1 forKey:@"dishDesc1"];
	[aCoder encodeInteger:_dataState forKey:@"dataState"];
	[aCoder encodeObject:_dishDesc3 forKey:@"dishDesc3"];
	[aCoder encodeObject:_dishDesc5 forKey:@"dishDesc5"];
	[aCoder encodeInteger:_bookCount forKey:@"bookCount"];
	[aCoder encodeObject:_picList forKey:@"picList"];
	[aCoder encodeInteger:_recommendStatus forKey:@"recommendStatus"];
	[aCoder encodeObject:_dishTaste forKey:@"dishTaste"];
	[aCoder encodeObject:_dishName forKey:@"dishName"];
	[aCoder encodeInteger:_merchantId forKey:@"merchantId"];
	[aCoder encodeObject:_dishMaterial forKey:@"dishMaterial"];
	[aCoder encodeObject:_dishDesc2 forKey:@"dishDesc2"];
	[aCoder encodeObject:_dishDesc4 forKey:@"dishDesc4"];
	[aCoder encodeObject:_dishDesc6 forKey:@"dishDesc6"];
	[aCoder encodeInteger:_dishTypeId forKey:@"dishTypeId"];
	[aCoder encodeDouble:_salePrice forKey:@"salePrice"];
	[aCoder encodeInteger:_saleStatus forKey:@"saleStatus"];
}

-(NSString *)description{
	return [NSString stringWithFormat:@"{dishId:%ld,dailySaleStatus:%ld,dishPrice:%lf,dishDesc1:%@,dataState:%ld,dishDesc3:%@,dishDesc5:%@,bookCount:%ld,picList:%@,recommendStatus:%ld,dishTaste:%@,dishName:%@,merchantId:%ld,dishMaterial:%@,dishDesc2:%@,dishDesc4:%@,dishDesc6:%@,dishTypeId:%ld,salePrice:%lf,saleStatus:%ld}",(long)_dishId,_dailySaleStatus,_dishPrice,_dishDesc1,_dataState,_dishDesc3,_dishDesc5,_bookCount,_picList,_recommendStatus,_dishTaste,_dishName,_merchantId,_dishMaterial,_dishDesc2,_dishDesc4,_dishDesc6,_dishTypeId,_salePrice,_saleStatus];
}

@end