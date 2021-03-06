//
//  TSCTabBar.m
//  UIDemo
//
//  Created by tangshenchun on 2017/7/28.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#define DEVICE_WIDTH [[UIScreen mainScreen] bounds].size.width
#define DEVICE_HEIGHT [[UIScreen mainScreen] bounds].size.height
#import "TSCTabBar.h"
#import "TSCTabBarButton.h"

@interface TSCTabBar()

@property (nonatomic, weak) UIButton *plusButton;

@property (nonatomic, strong) NSMutableArray *buttons;

@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation TSCTabBar


- (NSMutableArray *)buttons{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void)setItems:(NSArray *)items{
    _items = items;
    for (UITabBarItem * item in _items) {
        
        TSCTabBarButton *btn = [TSCTabBarButton buttonWithType:UIButtonTypeCustom];
        btn.item = item;
        
        btn.tag = self.buttons.count;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        if (btn.tag == 0) {
            [self btnClick:btn];
        }
        
        [self addSubview:btn];
        [self.buttons addObject:btn];
    }
}

// 点击tabBarButton调用
-(void)btnClick:(UIButton *)button{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    
    // 通知tabBarVc切换控制器，
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}


- (UIButton *)plusButton{
    if (_plusButton == nil) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_mainbtn"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"fabu_pressed"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_mainbtn"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_mainbtn"] forState:UIControlStateHighlighted];
        
        [btn sizeToFit];
        
        // 监听按钮的点击
        [btn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        
        _plusButton = btn;
        
        [self addSubview:_plusButton];
        
    }
    return _plusButton;
}

// 点击加号按钮的时候调用
- (void)plusClick{
    // modal出控制器
    if ([_delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [_delegate tabBarDidClickPlusButton:self];
    }
}

// self.items UITabBarItem模型，有多少个子控制器就有多少个UITabBarItem模型
// 调整子控件的位置
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / (self.items.count + 1);
    CGFloat btnH = self.bounds.size.height;
    
    
    int i = 0;
    // 设置tabBarButton的frame
    for (UIView *tabBarButton in self.buttons) {
        if (i == 2) {
            i = 3;
        }
        btnX = i * btnW;
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
        i++;
    }
    
    
    // 设置添加按钮的位置
    self.plusButton.center = CGPointMake(w * 0.5, h * 0.5 - 5);
    
}


/*
- (void)setTabBarItem:(NSArray*)itemArray imageNormalArray:(NSArray*)imageNormalArray selectImageArray:(NSArray*)selectImageArray
{
    
    for (int i=0; i < itemArray.count;i++) {
        

        NSString * imagePath = [imageNormalArray objectAtIndex:i];
        NSString * imagePath_Select = [selectImageArray objectAtIndex:i];
        
        // 按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(i*DEVICE_WIDTH/itemArray.count, DEVICE_HEIGHT-49, DEVICE_WIDTH/itemArray.count, 49);
        [btn setTitle:itemArray[i] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imagePath] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imagePath_Select] forState:UIControlStateSelected];
        //按钮图片大小设置
        //btn.imageEdgeInsets = UIEdgeInsetsMake(i*DEVICE_WIDTH/5,0,DEVICE_WIDTH/5,49);
       // [btn addTarget:self action:@selector(<#selector#>) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self addSubview:btn];
        
        
    }
    
}
*/



@end
