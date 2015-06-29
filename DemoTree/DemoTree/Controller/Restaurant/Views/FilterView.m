//
//  FilterView.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/28.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "FilterView.h"

@interface FilterView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *itemArray;
@property (nonatomic, strong) UIButton *handerView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *secondaryTable;
@property (nonatomic, strong) UIView *cotegoryView;
@property (nonatomic, strong) UIView *cityView;
/// 样式
@property (nonatomic, assign) FilterType type;
/// 初始Y值
@property (nonatomic, assign) NSInteger originY;
@property (nonatomic, assign) NSInteger height;

@property (nonatomic,strong)UIView *clearView;

@end

@implementation FilterView

-(id)initWithItem:(NSArray *)items type:(FilterType)type
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:items];
        self.itemArray = array;
        self.type = type;
//        _height = 0;
//        self.frame = [self getViewFrame];
        switch (_type) {
            case FilterCotegory:
            {
                [self addSubview:self.cotegoryView];
            }
                break;
            case FilterCity:
            {
                [self addSubview:self.cityView];
            }
                break;
            case FilterSynthesis:
            {
                _height = 88;
                [self addSubview:self.tableView];
            }
                break;
                
            default:
                break;
        }
        
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
    
//    self.alpha = 0.f;
    
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = [self getViewFrame];
        self.tableView.frame = self.frame;
//        self.alpha = 1.f;
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
        //        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.frame = rect;
        self.tableView.frame = self.frame;
    } completion:^(BOOL finished) {
        [_handerView removeFromSuperview];
    }];
    
}

#pragma mark - UITableView

-(UITableView *)tableView
{
    if (_tableView != nil) {
        return _tableView;
    }
    
    CGRect rect = self.frame;
//    rect.size.height = _height;
    
    self.tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.alwaysBounceHorizontal = NO;
    _tableView.alwaysBounceVertical = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = [UIColor redColor];
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return _tableView;
}

#pragma mark - UITableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_type == FilterSynthesis) {
        return _itemArray.count;
    }
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_type == FilterSynthesis) {
        
        static NSString *SynID = @"SynthesisCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SynID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SynID];
        }
        
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.text = [_itemArray objectAtIndex:indexPath.row];
        cell.textLabel.textColor = [UIColor blueColor];
        
        return cell;
    }
    
    return nil;
}

#pragma mark - UITableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self dismiss:NO];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}



@end
