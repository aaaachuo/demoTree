//
//  MineViewController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/2.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "MineViewController.h"
#import "EnrollViewController.h"

@interface MineViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *curImage;
@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UITextField *telephone;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UIView *backView;


@end

@implementation MineViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"用户登录";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(exitView)];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)exitView {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)savePwd:(id)sender {
}
- (IBAction)autoLogin:(id)sender {
}
- (IBAction)searchPwd:(id)sender {
}
- (IBAction)enroll:(id)sender {
}

- (IBAction)Login:(UIButton *)sender {
    
    EnrollViewController *enrollVc = [[EnrollViewController alloc] init];
    
    [self.navigationController pushViewController:enrollVc animated:YES];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
