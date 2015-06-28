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

@property (nonatomic,strong)UIView *clearView;

@end

@implementation FilterView

-(id)initWithItem:(NSArray *)items type:(FilterType)type
{
    self = [super init];
    if (self) {
        
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:items];
        self.itemArray = array;
        self.type = type;
        self.frame = [self getViewFrame];
        
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
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-50-_originY);
    
    return frame;
}


-(void)show
{
    self.handerView = [UIButton buttonWithType:UIButtonTypeCustom];
    [_handerView setFrame:CGRectMake(0, _originY, SCREEN_WIDTH, SCREEN_HEIGHT - _originY+20)];
    [_handerView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5f]];
    [_handerView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [_handerView addSubview:self];
    
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    UIView *clearView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    clearView.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [clearView addGestureRecognizer:tapGes];
    [window addSubview:clearView];
    [window addSubview:_handerView];
    self.clearView = clearView;
    
    CGRect rect = [self getViewFrame];
    rect.size.height = 0;
    self.frame = rect;
    
    self.alpha = 0.f;
    
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = [self getViewFrame];
        self.alpha = 1.f;
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
    self.isDismiss();
    
    if (!animate) {
        [_handerView removeFromSuperview];
        [_clearView removeFromSuperview];
        return;
    }
    
    CGRect rect = [self getViewFrame];
    rect.size.height = 0;
    
    
    [UIView animateWithDuration:0.2f animations:^{
        //        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.frame = rect;
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [_handerView removeFromSuperview];
        [_clearView removeFromSuperview];
        
    }];
    
}

#pragma mark - UITableView

-(UITableView *)tableView
{
    if (_tableView != nil) {
        return _tableView;
    }
    
    CGRect rect = self.frame;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(rect.origin.x, 0, rect.size.width, rect.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.alwaysBounceHorizontal = NO;
    tableView.alwaysBounceVertical = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView = tableView;
    
    return tableView;
}

#pragma mark - UITableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_itemArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"GoodsListcell";
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
    return 0;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //填充颜色
    [kUIColorFromRGB(0xefefef) setFill];
}



@end
