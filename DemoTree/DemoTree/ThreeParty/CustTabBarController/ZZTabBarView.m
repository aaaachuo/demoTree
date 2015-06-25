//
//  ZZTabBarView.m
//  CustTabbarController
//
//  Created by 翟志杰 on 15/6/8.
//  Copyright (c) 2015年 翟志杰. All rights reserved.
//

#import "ZZTabBarView.h"
#import "ZZTabBarItem.h"

@interface ZZTabBarView ()

@property (nonatomic) CGFloat itemWidth;
@property (nonatomic) UIView *backgroundView;

@end


@implementation ZZTabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInitialization];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInitialization];
    }
    
    return self;
}

- (id)init {
    
    return [self initWithFrame:CGRectZero];
}

- (void)commonInitialization {
    
    _backgroundView = [[UIView alloc] init];
    [self addSubview:_backgroundView];
    
    [self setTranslucent:NO];
}

- (void)layoutSubviews {
    
    CGSize frameSize = self.frame.size;
    CGFloat mininumContentHeight = [self minimumContentHeight];
    
    [[self backgroundView] setFrame:CGRectMake(0, frameSize.height - mininumContentHeight,
                                               frameSize.width, frameSize.height)];
    
    [self setItemWidth:roundf((frameSize.width - self.contentEdgeInsets.left - self.contentEdgeInsets.right)
                              / self.items.count)];
    
    NSInteger index = 0;
    
    for (ZZTabBarItem *item in self.items) {
        CGFloat itemHeight = item.itemHeight;
        
        if (!itemHeight) {
            itemHeight = frameSize.height;
        }
        
        [item setFrame:CGRectMake(self.contentEdgeInsets.left + index * self.itemWidth,
                                  roundf(frameSize.height - itemHeight) - self.contentEdgeInsets.top + 0.5,
                                  self.itemWidth, frameSize.height - self.contentEdgeInsets.bottom - 0.5)];
        
        [item setNeedsDisplay];
        
        index ++;
    }
}

- (void)setItemWidth:(CGFloat)itemWidth {
    
    if (itemWidth > 0) {
        _itemWidth = itemWidth;
    }
}

- (void)setItems:(NSArray *)items {
    
    for (ZZTabBarItem *item in items) {
        [item removeFromSuperview];
    }
    
    _items = [items copy];
    
    for (ZZTabBarItem *item in items) {
        [item addTarget:self action:@selector(tabBarItemWasSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:item];
    }
}

- (void)setHeight:(CGFloat)height {
    
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame),
                              CGRectGetWidth(self.frame), height)];
}

- (CGFloat)minimumContentHeight {
    
    CGFloat minimumTabBarContnetHeight = CGRectGetHeight(self.frame);
    
    for (ZZTabBarItem *item in self.items) {
        CGFloat itemHeight = item.itemHeight;
        
        if (itemHeight && (itemHeight < minimumTabBarContnetHeight)) {
            minimumTabBarContnetHeight = itemHeight;
        }
    }
    
    return minimumTabBarContnetHeight;
}

- (void)tabBarItemWasSelected:(id)sender {
    
    
    if ([self.delegate respondsToSelector:@selector(ZZTabBar:shouldSelectedItemAtIndex:)]) {
        NSInteger index = [self.items indexOfObject:sender];
        
        if (![self.delegate ZZTabBar:self shouldSelectedItemAtIndex:index]) {
            return;
        }
    }
    
    [self setSelectedItem:sender];
    
    if ([self.delegate respondsToSelector:@selector(ZZTabBar:didSelectItemAtIndex:)]) {
        NSInteger index = [self.items indexOfObject:sender];
        
        [self.delegate ZZTabBar:self didSelectItemAtIndex:index];
    }
}

- (void)setSelectedItem:(ZZTabBarItem *)selectedItem {
    
    if (_selectedItem == selectedItem) {
        return;
    }
    
    _selectedItem.selected = NO;
    _selectedItem = selectedItem;
    _selectedItem.selected = YES;
}

- (void)setTranslucent:(BOOL)translucent {
    
    _translucent = translucent;
    
    CGFloat alpha = (translucent ? 0.9 : 1.f);
    
    [_backgroundView setBackgroundColor:[UIColor colorWithWhite:0 alpha:alpha]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
