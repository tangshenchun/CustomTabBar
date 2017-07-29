//
//  TSCTabBarViewController.m
//  UIDemo
//
//  Created by Tangshenchun on 2017/7/29.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import "TSCTabBarViewController.h"
#import "TSCTabBar.h"
#import "UIImage+TSCImage.h"

@interface TSCTabBarViewController () <TSCTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation TSCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%lu",self.viewControllers.count);
 
    // 1
    UIViewController *home = [[UIViewController alloc] init];
    home.view.backgroundColor = [UIColor redColor];
    //    home.tabBarItem.badgeValue = @"2";
    [self setTabBarButtonMessage:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"] title:@"首页"];
    
    
    // 2
    UIViewController *message = [[UIViewController alloc] init];
    message.view.backgroundColor = [UIColor orangeColor];
    message.tabBarItem.badgeValue = @"4";
    [self setTabBarButtonMessage:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"] title:@"邮件"];
    
    // 3
    UIViewController *discover = [[UIViewController alloc] init];
    discover.view.backgroundColor = [UIColor grayColor];
    [self setTabBarButtonMessage:discover image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"] title:@"发现"];
    
    // 4
    UIViewController *profile = [[UIViewController alloc] init];
    profile.view.backgroundColor = [UIColor greenColor];
    [self setTabBarButtonMessage:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"] title:@"我"];
    [self setUpTabBar];
}



- (NSMutableArray *)items{
    if (_items == nil) {
        
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)setUpTabBar{
    // 自定义tabBar
    TSCTabBar *tabBar = [[TSCTabBar alloc] initWithFrame:self.tabBar.frame];
    tabBar.backgroundColor = [UIColor lightGrayColor];
    tabBar.delegate = self;
    tabBar.items = self.items;
    [self.view addSubview:tabBar];
    // 移除系统的tabBar
    [self.tabBar removeFromSuperview];
}


- (void)setTabBarButtonMessage:(UIViewController * _Nullable)vc image:(UIImage * _Nullable)image selectedImage:(UIImage * _Nullable)selectedImage title:(NSString * _Nullable)title{
    
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    
    // 保存tabBarItem模型到数组
    [self.items addObject:vc.tabBarItem];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}

//  点击最中央按钮的时候调用
- (void)tabBarDidClickPlusButton:(TSCTabBar *)tabBar{
   
    NSLog(@"模态");
}

// *************************  此处添加所有的子控制器end  ***********************

#pragma mark - 当点击tabBar上的按钮调用
- (void)tabBar:(TSCTabBar *)tabBar didClickButton:(NSInteger)index{
    if (index == 0 && self.selectedIndex == index) {
        
    }
    self.selectedIndex = index;
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
