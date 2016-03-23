//
//  AboutViewController.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/15.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "AboutViewController.h"
#import "LoginManager.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [LoginManager postWithLoginNameStr:@"00048" password:@"00048" success:^(id json) {
        
    } fail:^{
        
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
