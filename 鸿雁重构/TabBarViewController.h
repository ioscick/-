//
//  TabBarViewController.h
//  鸿雁重构
//
//  Created by shenliping on 16/3/14.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarViewController : UITabBarController

@property (strong, nonatomic) UITabBar *tabBari;

+ (TabBarViewController *)shareTabBar;

@end
