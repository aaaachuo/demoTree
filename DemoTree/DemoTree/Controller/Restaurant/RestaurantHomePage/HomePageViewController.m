//
//  HomePageViewController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/5.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "HomePageViewController.h"
#import "RecommendCell.h"
#import "MainCollectionCell.h"
#import "MainDetailCell.h"
#import "RecommendHeaderView.h"


@interface HomePageViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    UICollectionView    *_collectionView;
}

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kUIColorFromRGB(0xeeeee9);
    [self autoLayoutSubviews];
}

- (void)autoLayoutSubviews {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collection];
    
    _collectionView = collection;
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        
        make.width.equalTo(@(self.view.frame.size.width));
        make.height.equalTo(@(SCREEN_HEIGHT-113));
    }];
    
    [_collectionView registerClass:[RecommendCell class] forCellWithReuseIdentifier:@"RecommendCell"];
    [_collectionView registerClass:[MainCollectionCell class] forCellWithReuseIdentifier:@"MainCollectionCell"];
    [_collectionView registerClass:[MainDetailCell class] forCellWithReuseIdentifier:@"MainDetailCell"];
    [_collectionView registerClass:[RecommendHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RecommendHeaderView"];
    
    self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-113);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 1) {
        return 3;
    }else {
        return 2;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *identifier = @"RecommendCell";
        
        RecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        [cell sizeToFit];
        
        return cell;
    }else if (indexPath.section == 1) {
        static NSString *MainIdentifier = @"MainCollectionCell";
        
        MainCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MainIdentifier forIndexPath:indexPath];
        [cell sizeToFit];
        
        return cell;
    }else {
        
        static NSString *detIdentifier = @"MainDetailCell";
        
        MainDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:detIdentifier forIndexPath:indexPath];
        
        return cell;
    }
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake((SCREEN_WIDTH - 30) / 2, 130);
    }else if (indexPath.section == 1) {
        return CGSizeMake((SCREEN_WIDTH - 40) / 3, 96);
    }else {
        return CGSizeMake((SCREEN_WIDTH - 30) / 2, 152);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 1) {
        return CGSizeMake(CGRectGetWidth(self.view.frame), 40);
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
    
    if (indexPath.section == 1 && kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *view = nil;
        
        RecommendHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RecommendHeaderView" forIndexPath:indexPath];
        
        view = headerView;
        
        return view;
    }
    
    return nil;
}


@end
