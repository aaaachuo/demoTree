//
//Default.m 
//
//
//Create by zhaizhijie on 15/8/17 
//Copyright (c) 2015年 zhaizhijie. All rights reserved.
//
//
#import "Default.h"
@implementation Default

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
		self.protocol = [aDecoder decodeObjectForKey:@"protocol"];
		self.code = [aDecoder decodeIntegerForKey:@"code"];
		self.businessMessage = [aDecoder decodeObjectForKey:@"businessMessage"];
		self.message = [aDecoder decodeObjectForKey:@"message"];
		self.reply = [aDecoder decodeObjectForKey:@"reply"];
		self.replyTime = [aDecoder decodeIntegerForKey:@"replyTime"];
		self.businessCode = [aDecoder decodeIntegerForKey:@"businessCode"];
	}
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:_protocol forKey:@"protocol"];
	[aCoder encodeInteger:_code forKey:@"code"];
	[aCoder encodeObject:_businessMessage forKey:@"businessMessage"];
	[aCoder encodeObject:_message forKey:@"message"];
	[aCoder encodeObject:_reply forKey:@"reply"];
	[aCoder encodeInteger:_replyTime forKey:@"replyTime"];
	[aCoder encodeInteger:_businessCode forKey:@"businessCode"];
}

-(NSString *)description{
	return [NSString stringWithFormat:@"{protocol:%@,code:%ld,businessMessage:%@,message:%@,reply:%@,replyTime:%ld,businessCode:%ld}",_protocol,_code,_businessMessage,_message,_reply,_replyTime,_businessCode];
}

@end