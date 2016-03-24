//
//  AboutViewController.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/15.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "AboutViewController.h"
#import "LoginManager.h"
#import "UpButton.h"
#import "IntruduceViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self set_buttons];
    // Do any additional setup after loading the view.
}

- (void)set_buttons{
    for (int i = 0; i < 3; i++) {
        UpButton *button = [[UpButton alloc] initWithFrame:CGRectMake(30 + i % 4 * (60 + WIDTH / 2 - 120), 80, 60, 70)];
        button.imageView.image = [UIImage imageNamed:@"zlfkmsg_img_zlfk"];
        button.tag = i;
        [button setTitle:@"关于鸿雁" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button setTitleColor:RGBCOLOR(0, 149, 133) forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTapedItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)buttonTapedItem:(UpButton *)sender{
    IntruduceViewController *inVc = [[IntruduceViewController alloc] init];
    [self.navigationController pushViewController:inVc animated:YES];
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
