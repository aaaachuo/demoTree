//
//  MainViewController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/22.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "MainViewController.h"
#import "MainHeaderView.h"
#import "MainCollectionCell.h"
#import "MainDetailCell.h"
#import "RestaurantController.h"

@interface MainViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, MainHeaderViewDelegate> {
    
    UICollectionView *_collectionView;
}


@end

@implementation MainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"众享时刻";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self autoLayoutSubViews];
}

- (void)autoLayoutSubViews
{
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                          collectionViewLayout:flowLayout];
    
    _collectionView = collectionView;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        
        make.width.equalTo(@(self.view.frame.size.width));
        make.height.equalTo(@(SCREEN_HEIGHT-113));
    }];
    
    [_collectionView registerClass:[MainCollectionCell class]
            forCellWithReuseIdentifier:@"customCell"];
    
    [_collectionView registerClass:[MainHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    [_collectionView registerClass:[MainDetailCell class] forCellWithReuseIdentifier:@"detailCell"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
       return 3;
    }else {
        return 2;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *identifier = @"customCell";
        
        MainCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        [cell sizeToFit];
        
        return cell;
    }else {
        
        static NSString *detIdentifier = @"detailCell";
        
        MainDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:detIdentifier forIndexPath:indexPath];
        
        return cell;
    }
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake((SCREEN_WIDTH - 40) / 3, 96);
    }else {
        return CGSizeMake((SCREEN_WIDTH - 30) / 2, 152);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return CGSizeMake(CGRectGetWidth(self.view.frame), 378);
    }
    
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 5, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *view = nil;
        
        MainHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        header.delegate = self;
        
        view = header;
        
        return view;
    }
    
    
    
    return nil;
}

- (void)headerView:(MainHeaderView *)headerView selectedItemTag:(NSInteger)tag {
    
    switch (tag) {
        case 100:
        {
            RestaurantController *rsVc = [[RestaurantController alloc] init];
            [self.navigationController pushViewController:rsVc animated:YES];
        }
            break;
            
        default:
            break;
    }

}


@end
