//
//DefaultReply.m 
//
//
//Create by zhaizhijie on 15/8/17 
//Copyright (c) 2015年 zhaizhijie. All rights reserved.
//
//
#import "DefaultReply.h"
@implementation DefaultReply

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
		self.dishList = [aDecoder decodeObjectForKey:@"dishList"];
        self.merchantList = [aDecoder decodeObjectForKey:@"merchantList"];
	}
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:_dishList forKey:@"dishList"];
    [aCoder encodeObject:_merchantList forKey:@"merchantList"];
}

-(NSString *)description{
	return [NSString stringWithFormat:@"{dishList:%@,merchantList:%@}",_dishList,_merchantList];
}

@end