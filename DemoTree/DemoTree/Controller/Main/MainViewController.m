//
//  MainViewController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/22.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "MainViewController.h"
#import "RestaurantController.h"
#import "NewHeaderView.h"
#import "MainTableViewCell.h"
#import "AdScrollView.h"
#import "MainRequestHeader.h"
#import "DefaultReplyDishList.h"
#import "ResDetailViewController.h"
#import "ZZRequestAPI.h"

@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate, HeaderViewDelegate> {
    
//    UICollectionView *_collectionView;
    UITableView *_tableView;
    NewHeaderView *_headerView;
    NSArray     *_adList;
    NSMutableArray *_tableList;
}


@end

@implementation MainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"众享时刻";
        _tableList = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTableView];
    [self requestDailySaleList];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.zz_tabBarController setTabBarHidden:NO animeted:YES];
}

- (void)createTableView {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [self addHeaderView:tableView];
    _tableView = tableView;
}

- (void)addHeaderView:(UITableView *)tableView {
    
    _headerView = [[NewHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, adjustsSizeToFitWithWidth320(390))];
    tableView.tableHeaderView = _headerView;
    _headerView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _tableList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MainTableViewCell" owner:nil options:nil] lastObject];
    
    if (_tableList.count) {
        cell.dishDetail = _tableList[indexPath.row];
        cell.showCheck = NO;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ResDetailViewController *detailVc = [[ResDetailViewController alloc] init];
    detailVc.dishDetail = _tableList[indexPath.row];
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (void)headerView:(NewHeaderView *)headerView selectedItemTag:(NSInteger)tag {
    
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

//- (void)bannerRequest {
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    NSString *str = IDS_MAIN_BANNER;
//    NSDictionary *dic = [MainRequestHeader getMainBannerRequestHeader];
//    [manager POST:str parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *dic = responseObject;
//        
//        
//        NSLog(@"%@",dic);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error);
//    }];
//}
//
- (void)requestDailySaleList {
    
    NSString *str = IDS_MAIN_SALELIST;
    NSDictionary *dic = [MainRequestHeader getMainDailySaleListRequestHeader:1];
    
    [ZZRequestAPI postBody:dic andUrl:str andSucceed:^(DefaultReply *reply) {
        
//        for (NSDictionary *dic in reply.dishList) {
//            DefaultReplyDishList *obj = [DefaultReplyDishList objectWithKeyValues:dic];
//            [_tableList addObject:obj];
//        }
        
        NSArray *array = [DefaultReplyDishList objectArrayWithKeyValuesArray:reply.dishList];
        [_tableList addObjectsFromArray:array];
        
        [_tableView reloadData];
        
    } andFailed:^(NSError *error) {
        
    }];

}



@end
