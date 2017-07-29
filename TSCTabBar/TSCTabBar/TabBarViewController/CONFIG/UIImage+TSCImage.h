//
//  UIImage+TSCImage.h
//  UIDemo
//
//  Created by Tangshenchun on 2017/7/29.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TSCImage)

// 加载最原始的图片，没有渲染
+(instancetype)imageWithOriginalName:(NSString *)imageName;

+(instancetype)imageWithStretchableName:(NSString *)imageName;


@end
