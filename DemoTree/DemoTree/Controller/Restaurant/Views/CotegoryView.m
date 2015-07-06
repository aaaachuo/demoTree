//
//  CotegoryView.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/29.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "CotegoryView.h"

@interface CotegoryView ()

@property (nonatomic, strong) UIButton *handerView;
@property (nonatomic, strong) UIView *cotegoryView;
/// 初始Y值
@property (nonatomic, assign) NSInteger originY;
@property (nonatomic, assign) NSInteger height;

@property (nonatomic, strong) UIButton *cotegory1;
@property (nonatomic, strong) UIButton *cotegory2;
@property (nonatomic, strong) UIButton *cotegory3;
@property (nonatomic, strong) UIButton *cotegory4;

@end

@implementation CotegoryView

-(id)init
{
    self = [super init];
    if (self) {
        _height = 67;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.cotegoryView];
    }
    return self;
}

-(CGRect)getViewFrame
{
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, _height);
    
    return frame;
}


-(void)show
{
    self.handerView = [UIButton buttonWithType:UIButtonTypeCustom];
    [_handerView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_handerView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5f]];
    [_handerView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [_handerView addSubview:self];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_handerView];
    
    CGRect rect = [self getViewFrame];
    rect.size.height = 0;
    self.frame = rect;
    
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = [self getViewFrame];
        _cotegoryView.frame = self.frame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
}

-(void)dismiss
{
    [self dismiss:YES];
}

-(void)dismiss:(BOOL)animate
{
    
    if (!animate) {
        [_handerView removeFromSuperview];
        return;
    }
    
    CGRect rect = [self getViewFrame];
    rect.size.height = 0;
    
    [UIView animateWithDuration:0.2f animations:^{
        self.frame = rect;
        _cotegoryView.frame = self.frame;
    } completion:^(BOOL finished) {
        [_handerView removeFromSuperview];
    }];
    
}

- (UIView *)cotegoryView {
    
    self.cotegoryView = [[UIView alloc] initWithFrame:self.frame];
    
    CGFloat buttonWidth = 70.5;
    NSInteger interval = 6;
    
    _cotegory1 = [[UIButton alloc] init];
    [_cotegory1 setTitle:@"默认" forState:UIControlStateNormal];
    [_cotegory1 setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [_cotegory1 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_cotegory1 addTarget:self action:@selector(selectedCotegory:) forControlEvents:UIControlEventTouchUpInside];
    _cotegory1.layer.borderWidth = 0.5f;
    _cotegory1.layer.borderColor = kUIColorFromRGB(0xcacbc8).CGColor;
    _cotegory1.layer.cornerRadius = 2.f;
    _cotegory1.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [_cotegoryView addSubview:_cotegory1];
    
    _cotegory2 = [[UIButton alloc] init];
    [_cotegory2 setTitle:@"默认" forState:UIControlStateNormal];
    [_cotegory2 setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [_cotegory2 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_cotegory2 addTarget:self action:@selector(selectedCotegory:) forControlEvents:UIControlEventTouchUpInside];
    _cotegory2.layer.borderWidth = 0.5f;
    _cotegory2.layer.borderColor = kUIColorFromRGB(0xcacbc8).CGColor;
    _cotegory2.layer.cornerRadius = 2.f;
    _cotegory2.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [_cotegoryView addSubview:_cotegory2];
    
    _cotegory3 = [[UIButton alloc] init];
    [_cotegory3 setTitle:@"默认" forState:UIControlStateNormal];
    [_cotegory3 setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [_cotegory3 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_cotegory3 addTarget:self action:@selector(selectedCotegory:) forControlEvents:UIControlEventTouchUpInside];
    _cotegory3.layer.borderWidth = 0.5f;
    _cotegory3.layer.borderColor = kUIColorFromRGB(0xcacbc8).CGColor;
    _cotegory3.layer.cornerRadius = 2.f;
    _cotegory3.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [_cotegoryView addSubview:_cotegory3];
    
    _cotegory4 = [[UIButton alloc] init];
    [_cotegory4 setTitle:@"默认" forState:UIControlStateNormal];
    [_cotegory4 setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [_cotegory4 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_cotegory4 addTarget:self action:@selector(selectedCotegory:) forControlEvents:UIControlEventTouchUpInside];
    _cotegory4.layer.borderWidth = 0.5f;
    _cotegory4.layer.borderColor = kUIColorFromRGB(0xcacbc8).CGColor;
    _cotegory4.layer.cornerRadius = 2.f;
    _cotegory4.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [_cotegoryView addSubview:_cotegory4];
    
    _cotegory1.backgroundColor = [UIColor colorWithRed:252/255.0 green:113/255.0 blue:114/255.0 alpha:1];
    _cotegory2.backgroundColor = [UIColor whiteColor];
    _cotegory3.backgroundColor = [UIColor whiteColor];
    _cotegory4.backgroundColor = [UIColor whiteColor];
    _cotegory1.selected = self;
    
    [_cotegory1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cotegoryView.mas_top).with.offset(15);
        make.left.equalTo(_cotegoryView.mas_left).with.offset(10);
        make.bottom.equalTo(_cotegoryView.mas_bottom).with.offset(-20);
        make.width.equalTo(@(buttonWidth));
    }];
    
    [_cotegory2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cotegory1.mas_top).with.offset(0);
        make.left.equalTo(_cotegory1.mas_right).with.offset(interval);
        make.bottom.equalTo(_cotegory1.mas_bottom).with.offset(0);
        make.width.equalTo(_cotegory1.mas_width);
    }];
    
    [_cotegory3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cotegory1.mas_top).with.offset(0);
        make.left.equalTo(_cotegory2.mas_right).with.offset(interval);
        make.bottom.equalTo(_cotegory1.mas_bottom).with.offset(0);
        make.width.equalTo(_cotegory1.mas_width);
    }];
    
    [_cotegory4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cotegory1.mas_top).with.offset(0);
        make.left.equalTo(_cotegory3.mas_right).with.offset(interval);
        make.bottom.equalTo(_cotegory1.mas_bottom).with.offset(0);
        make.width.equalTo(_cotegory1.mas_width);
    }];
    
    return _cotegoryView;
}

- (void)selectedCotegory:(UIButton *)sender {
    
    [self setButtonState];
    sender.selected = YES;
    sender.backgroundColor = [UIColor colorWithRed:252/255.0 green:113/255.0 blue:114/255.0 alpha:1];
}

- (void)setButtonState {
    _cotegory1.selected = NO;
    _cotegory2.selected = NO;
    _cotegory3.selected = NO;
    _cotegory4.selected = NO;
    
    _cotegory1.backgroundColor = [UIColor whiteColor];
    _cotegory2.backgroundColor = [UIColor whiteColor];
    _cotegory3.backgroundColor = [UIColor whiteColor];
    _cotegory4.backgroundColor = [UIColor whiteColor];
}


@end
