//
//  TSCBadgeView.m
//  UIDemo
//
//  Created by Tangshenchun on 2017/7/29.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import "TSCBadgeView.h"
#import "UIView+Frame.h"

#define BADGEVALUE_FONT_SIZE 11

@implementation TSCBadgeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.userInteractionEnabled = NO;
        
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        
        // 设置字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:BADGEVALUE_FONT_SIZE];
        
        [self sizeToFit];
    }
    
    return self;
}



- (void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue = badgeValue;
    
    // 判断badgeValue是否有内容
    if (badgeValue.length == 0 || [badgeValue isEqualToString:@"0"]) { // 没有内容或者空字符串,等于0
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
    
    CGSize size = [self getBadgeValueSize];
    
    if (size.width > self.width) { // 文字的尺寸大于控件的宽度
//        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
//        [self setTitle:nil forState:UIControlStateNormal];
//        [self setBackgroundImage:nil forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        [self setTitle:@"99+" forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        [self setTitle:badgeValue forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }
    
}

// Get the size of BadgeValue
- (CGSize)getBadgeValueSize {
    
    UIFont *font = [UIFont systemFontOfSize:BADGEVALUE_FONT_SIZE];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //paragraphStyle.lineSpacing = MESSAGE_LINE_SPACE;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize size = [_badgeValue boundingRectWithSize:CGSizeMake(99, 99)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:attributes context:nil].size;
    
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    
    return size;
}

@end
