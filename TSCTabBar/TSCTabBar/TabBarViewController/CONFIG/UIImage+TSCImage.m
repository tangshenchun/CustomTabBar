//
//  UIImage+TSCImage.m
//  UIDemo
//
//  Created by Tangshenchun on 2017/7/29.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import "UIImage+TSCImage.h"

@implementation UIImage (TSCImage)

+ (instancetype)imageWithOriginalName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


+ (instancetype)imageWithStretchableName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
