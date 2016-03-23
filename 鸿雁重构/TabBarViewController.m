//
//  TabBarViewController.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/14.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "TabBarViewController.h"
#import "IndexViewController.h"
#import "CommerceViewController.h"
#import "LogsticViewController.h"
#import "ServiceViewController.h"
#import "PersonViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBari = self.tabBar;
    _tabBari.tintColor = [UIColor colorWithRed:0.0f/255.0f green:157.0f/255.0f blue:133.0f/255.0f alpha:1];
    
    IndexViewController *indexVc = [IndexViewController new];
    indexVc.title = @"HONYAR 鸿雁";
    UINavigationController *indexNav = [[UINavigationController alloc] initWithRootViewController:indexVc];
    indexNav.navigationBar.barTintColor = RGBCOLOR(0, 157, 133);
    indexNav.navigationBar.tintColor = [UIColor whiteColor];
    [indexNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    CommerceViewController *commerceVc = [CommerceViewController new];
    commerceVc.title = @"商 务";
    UINavigationController *commerceNav = [[UINavigationController alloc] initWithRootViewController:commerceVc];
    commerceNav.navigationBar.barTintColor = RGBCOLOR(0, 157, 133);
    commerceNav.navigationBar.tintColor = [UIColor whiteColor];
    [commerceNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    LogsticViewController *logisticVc = [LogsticViewController new];
    logisticVc.title = @"物 流";
    UINavigationController *logisticNav = [[UINavigationController alloc] initWithRootViewController:logisticVc];
    logisticNav.navigationBar.barTintColor = RGBCOLOR(0, 157, 133);
    commerceNav.navigationBar.tintColor = [UIColor whiteColor];
    [logisticNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    ServiceViewController *serviceVc = [ServiceViewController new];
    serviceVc.title = @"服 务";
    UINavigationController *serviceNav = [[UINavigationController alloc] initWithRootViewController:serviceVc];
    serviceNav.navigationBar.barTintColor = RGBCOLOR(0, 157, 133);
    serviceNav.navigationBar.tintColor = [UIColor whiteColor];
    [serviceNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    PersonViewController *personVc = [PersonViewController new];
    personVc.title = @"我 的";
    UINavigationController *personNav = [[UINavigationController alloc] initWithRootViewController:personVc];
    personNav.navigationBar.barTintColor = RGBCOLOR(0, 157, 133);
    personNav.navigationBar.tintColor = [UIColor whiteColor];
    [personNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.viewControllers = @[indexNav, commerceNav, logisticNav, serviceNav, personNav];
    
    UIImage *unselectedindexImg = [UIImage imageNamed:@"4"];
    UIImage *selectedIndexImg = [UIImage imageNamed:@"4-1"];
    UITabBarItem *item1 = [_tabBari.items objectAtIndex:0];
    item1.tag = 0;
    item1.selectedImage = [selectedIndexImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item1 setImage:[unselectedindexImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UIImage *unselectedSortImg = [UIImage imageNamed:@"2"];
    UIImage *selectedSortImg =[UIImage imageNamed:@"2-2"];
    UITabBarItem *item2 = [_tabBari.items objectAtIndex:1];
    item2.tag = 1;
    item2.selectedImage = [selectedSortImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item2 setImage:[unselectedSortImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    UIImage *unselectedGoodsImg = [UIImage imageNamed:@"3-1"];
    UIImage *selectedGoodsImg = [UIImage imageNamed:@"3"];
    UITabBarItem *item3 = [_tabBari.items objectAtIndex:2];
    item3.tag = 2;
    item3.selectedImage = [selectedGoodsImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item3 setImage:[unselectedGoodsImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UIImage *unselectedUserImg = [UIImage imageNamed:@"5"];
    UIImage *selectedUserImg = [UIImage imageNamed:@"5-1"];
    UITabBarItem *item4 = [_tabBari.items objectAtIndex:3];
    item4.tag = 3;
    item4.selectedImage = [selectedUserImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item4 setImage:[unselectedUserImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UIImage *unselectedUserImg1 = [UIImage imageNamed:@"1"];
    UIImage *selectedUserImg1 = [UIImage imageNamed:@"1-1"];
    UITabBarItem *item5 = [_tabBari.items objectAtIndex:4];
    item5.tag = 4;
    item5.selectedImage = [selectedUserImg1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item5 setImage:[unselectedUserImg1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    // Do any additional setup after loading the view.
}

+ (TabBarViewController *)shareTabBar{
    static TabBarViewController *tabBarVc = nil;
    if (tabBarVc == nil) {
        tabBarVc = [[TabBarViewController alloc] init];
    }
    return tabBarVc;
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
