//
//  IndexViewController.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/14.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "IndexViewController.h"
#import "AdScrollView.h"
#import "FunctionalTableViewCell.h"
#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "AboutViewController.h"
#import "NewsHeaderView.h"
#import "ClassicalCollectionViewController.h"

@interface IndexViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) AdScrollView *scrollView;

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.title = @"首 页";
    
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.scrollView;
    // Do any additional setup after loading the view.
}

- (AdScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[AdScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH / 3)];
        _scrollView.imageNameArray = @[[NSURL URLWithString:@"http://pic1a.nipic.com/2008-09-19/200891903253318_2.jpg"], [NSURL URLWithString:@"http://pic1a.nipic.com/2008-09-19/200891903253318_2.jpg"], [NSURL URLWithString:@"http://pic1a.nipic.com/2008-09-19/200891903253318_2.jpg"]];
        _scrollView.PageControlShowStyle = UIPageControlShowStyleRight;
        _scrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _scrollView.pageControl.currentPageIndicatorTintColor = RGBCOLOR(0, 157, 133);
    }
    return _scrollView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else{
        return 5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 140.0;
    }
    else{
        return 80.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    else{
        return 40;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        FunctionalTableViewCell *functionCell = [[FunctionalTableViewCell alloc] initWithImageArray:nil];
        __weak typeof(self)weekself = self;
        
        functionCell.block =^(NSInteger tag){
            NSLog(@"%ld",(long)tag);
            [weekself pushView:tag];
        };
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return functionCell;
    }
    else
    {
        NewsTableViewCell *newsCell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"newsCell"];
        [newsCell.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://pic1a.nipic.com/2008-09-19/200891903253318_2.jpg"]];
        newsCell.textLabel.text = @"layoutSubviews在以下情况下会被调用:1、init初始化不会触发layoutSubviews2、addSubview会触发layoutSubviews3、设置view的Frame会触发layoutSubviews,当然前";
        newsCell.detailTextLabel.text = @"2013-1-23";
        return newsCell;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        NewsHeaderView *newsV = [[NewsHeaderView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
        return newsV;
    }
    else{
        return nil;
    }
}

- (void)pushView:(NSInteger)tag{
    if (tag == 0) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 1;
        flowLayout.minimumInteritemSpacing = 0;
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        ClassicalCollectionViewController *classicalVC = [[ClassicalCollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
        classicalVC.view.backgroundColor = [UIColor whiteColor];
        classicalVC.hidesBottomBarWhenPushed = YES;
        classicalVC.title = @"经典作品";
        [self.navigationController pushViewController:classicalVC animated:YES];
    }else if (tag == 1){
        LoginViewController *loginVc = [[LoginViewController alloc] init];
        loginVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:loginVc animated:YES];

    }else{
        AboutViewController *aboutVc = [[AboutViewController alloc] init];
        aboutVc.view.backgroundColor = [UIColor whiteColor];
        aboutVc.title = @"关于鸿雁";
        aboutVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:aboutVc animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
