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
#import "ZZRequestAPI.h"
//#import ade
@interface MainViewController ()</*UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, MainHeaderViewDelegate*/UITableViewDataSource, UITableViewDelegate, HeaderViewDelegate> {
    
//    UICollectionView *_collectionView;
    UITableView *_tableView;
    NewHeaderView *_headerView;
    NSArray     *_adList;
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

//    [self autoLayoutSubViews];
    [self createTableView];
//    [self bannerRequest];
    [self requestDailySaleList];
//    [self testNetWork];
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
    
    _headerView = [[NewHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 390)];
    tableView.tableHeaderView = _headerView;
    _headerView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MainTableViewCell" owner:nil options:nil] lastObject];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

- (void)bannerRequest {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *str = IDS_MAIN_BANNER;
    NSDictionary *dic = [MainRequestHeader getMainBannerRequestHeader];
    [manager POST:str parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = responseObject;
        
        
        NSLog(@"%@",dic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)requestDailySaleList {
    
    NSString *str = IDS_TEST_SERVER;
    NSDictionary *dic = [MainRequestHeader getResListWithType:@"area" page:1];

    str = @"http://10.10.10.16:8080/meichu/api/merchant/detail";
    dic = [MainRequestHeader getMerchantList:1];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:str parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@--%@",dic,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testNetWork {
    
    
    NSString *str = REQUEST_URL(@"common/getResList");
    NSDictionary *dic = [MainRequestHeader getResListWithType:@"distance" page:1];
    
    
//http://101.200.233.41:8100/meichu-api/meichu/api/common/getResList?clientInfo=1&properties=2&commandInfo={type:%27area%27,parentId%20:%270%27}&page=1
    
    
//    str = @"http://i.vjifen.com/DBTVinterface/home/homePage.do";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager GET:str parameters:dic  success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@--%@",dic,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)requestPath:(NSString*)path
        parameters:(id)parameters
           success:(void(^)(int status,NSString *message))success
           failure:(void(^)(NSString *message))failure
{
    NSError *error1=nil;
    NSData *dataJson=[NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&error1];//加入body
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 15;
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //添加json数据到body
    request.HTTPBody=[NSData dataWithData:dataJson];
    // Request Operation
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        int status = [string intValue];
        if (success) {
            success(status,@"操作成功");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(@"网络请求异常");
        }
    }];
    [operation start];
}

/*
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
*/

@end
