//
//  ZZTabBarItem.m
//  CustTabbarController
//
//  Created by 翟志杰 on 15/6/8.
//  Copyright (c) 2015年 翟志杰. All rights reserved.
//

#import "ZZTabBarItem.h"

@implementation ZZTabBarItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInitialization];
    }
    
    return self;
}

- (void)commonInitialization {
    
    self.backgroundColor = [UIColor whiteColor];
    self.title = @"";
    
    self.unselectedTitleAttributes = @{
                                       NSFontAttributeName : [UIFont systemFontOfSize:12],
                                       NSForegroundColorAttributeName : [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]
                                       };
    self.selectedTitleAttributes = @{
                                       NSFontAttributeName : [UIFont systemFontOfSize:12],
                                       NSForegroundColorAttributeName : [UIColor colorWithRed:252/255.0 green:113/255.0 blue:114/255.0 alpha:1]
                                       };
    
    self.badgeBackgroundColor = [UIColor redColor];
    self.badgeTextColor = [UIColor whiteColor];
}

- (void)drawRect:(CGRect)rect {

    CGSize frameSize = self.frame.size;
    CGSize imageSize = CGSizeZero;
    CGSize titleSize = CGSizeZero;
    NSDictionary *titleAttributes = nil;
    
    UIImage *image = nil;
    CGFloat imageStartingY = 0.f;
    
    if (self.selected) {
        image = self.selectedImage;
        titleAttributes = self.selectedTitleAttributes;
        
        if (!titleAttributes) {
            titleAttributes = self.unselectedTitleAttributes;
        }
    }else {
        image = self.unselectedImage;
        titleAttributes = self.unselectedTitleAttributes;
    }
    
    imageSize = image.size;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    if (!_title.length) {
        [image drawInRect:CGRectMake(roundf(frameSize.width/2 - imageSize.width/2),
                                     roundf(frameSize.height/2 - imageSize.height/2),
                                     imageSize.width*0.5, imageSize.height*0.5)];
        
    }else {
        
        titleSize = [_title boundingRectWithSize:CGSizeMake(frameSize.width, 20)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:titleAttributes[NSFontAttributeName]}
                                         context:nil].size;
        
        imageStartingY = roundf((frameSize.height - imageSize.height - titleSize.height)/2);
        
        [image drawInRect:CGRectMake(roundf(frameSize.width/2 - imageSize.width/2)+imageSize.width*0.15,
                                     imageStartingY, imageSize.width*0.7, imageSize.height*0.7)];
        
        CGContextSetFillColorWithColor(context, [titleAttributes[NSForegroundColorAttributeName] CGColor]);
        
        [_title drawInRect:CGRectMake(roundf(frameSize.width/2 - titleSize.width/2), imageStartingY + imageSize.height*0.8,
                                      titleSize.width, titleSize.height)
            withAttributes:titleAttributes];
    }
    
    if (self.badgeValue.length) {
        
        CGSize badgeSize = CGSizeZero;
        
        badgeSize = [self.badgeValue boundingRectWithSize:CGSizeMake(frameSize.width, 20)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName: self.badgeTextFont} context:nil].size;
        
        
        CGFloat textOffset = 2.f;
        
        if (badgeSize.width < badgeSize.height) {
            badgeSize = CGSizeMake(badgeSize.height, badgeSize.height);
        }
        
        CGRect badgeBackgroundFrame = CGRectMake(roundf(frameSize.width/2 + imageSize.width/2 * 0.9), textOffset,
                                                 badgeSize.width + textOffset * 2, badgeSize.height + textOffset * 2);
        
        if (self.badgeBackgroundColor) {
            CGContextSetFillColorWithColor(context, self.badgeBackgroundColor.CGColor);
            
            CGContextFillEllipseInRect(context, badgeBackgroundFrame);
        }
        
        CGContextSetFillColorWithColor(context, self.badgeTextColor.CGColor);
        
        NSMutableParagraphStyle *badgeTextStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
        [badgeTextStyle setLineBreakMode:NSLineBreakByWordWrapping];
        [badgeTextStyle setAlignment:NSTextAlignmentCenter];
        
        NSDictionary *badgeTextAttributes = @{NSFontAttributeName : self.badgeTextFont,
                                              NSForegroundColorAttributeName : self.badgeTextColor,
                                              NSParagraphStyleAttributeName : badgeTextStyle};
        
        [self.badgeValue drawInRect:CGRectMake(CGRectGetMinX(badgeBackgroundFrame) + textOffset,
                                               CGRectGetMinY(badgeBackgroundFrame) + textOffset,
                                               badgeSize.width, badgeSize.height)
                     withAttributes:badgeTextAttributes];
    }
    
    CGContextRestoreGState(context);
}

- (UIImage *)finishedSelectImage {
    return [self selectedImage];
}

- (UIImage *)finishedUnselectImage {
    return [self unselectedImage];
}

- (void)setFinishedSelectedImage:(UIImage *)selectedImage withFinishedUnselectedImage:(UIImage *)unselectedImage {
    
    if (selectedImage && selectedImage != [self selectedImage]) {
        [self setSelectedImage:selectedImage];
    }
    
    if (unselectedImage && unselectedImage != [self unselectedImage]) {
        [self setUnselectedImage:unselectedImage];
    }
    
}

- (void)setBadgeValue:(NSString *)badgeValue {
    
    _badgeValue = badgeValue;
    
    [self setNeedsDisplay];
}



@end
