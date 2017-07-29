//
//  TSCTabBar.h
//  UIDemo
//
//  Created by tangshenchun on 2017/7/28.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TABBAR_FONT_SIZE 13

@class TSCTabBar;

@protocol TSCTabBarDelegate <NSObject>

@optional
- (void)tabBar:(TSCTabBar *)tabBar didClickButton:(NSInteger)index;
/**
 *  点击加号按钮的时候调用
 */
- (void)tabBarDidClickPlusButton:(TSCTabBar *)tabBar;

@end


@interface TSCTabBar : UIView

// items:保存每一个按钮对应tabBarItem模型
@property (nonatomic, strong) NSArray * items;

@property (nonatomic, weak) id<TSCTabBarDelegate> delegate;

@end
