//
//  ViewController.m
//  TSCTabBar
//
//  Created by Tangshenchun on 2017/7/29.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import "ViewController.h"
#import "TSCTabBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonClicked:(UIButton *)sender {
    
    TSCTabBarViewController *tabBarController = [[TSCTabBarViewController alloc] init];
    
    [self presentViewController:tabBarController animated:true completion:nil];
    
}
@end
