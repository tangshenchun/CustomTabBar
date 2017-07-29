//
//  UIBarButtonItem+ButtonItem.m
//  UIDemo
//
//  Created by Tangshenchun on 2017/7/29.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import "UIBarButtonItem+ButtonItem.h"

@implementation UIBarButtonItem (ButtonItem)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
