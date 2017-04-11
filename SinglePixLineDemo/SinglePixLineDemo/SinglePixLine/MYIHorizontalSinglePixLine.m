//
//  MYIHorizontalSinglePixLine.m
//  qukanbin
//
//  Created by 雷浩宇 on 16/7/11.
//  Copyright © 2016年 MingYi. All rights reserved.
//

#import "MYIHorizontalSinglePixLine.h"

#define SINGLE_LINE_WIDTH (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET(floatValue) (floatValue + (1 / [UIScreen mainScreen].scale) / 2)
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface MYIHorizontalSinglePixLine ()


@end

@implementation MYIHorizontalSinglePixLine




- (void)setIsTop:(BOOL)isTop {
    _isTop = isTop;
    [self setNeedsDisplay];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.opaque = NO;
}


- (void)drawRect:(CGRect)rect {
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    if (self.isTop) {
        [bezierPath moveToPoint:CGPointMake(0, SINGLE_LINE_ADJUST_OFFSET(0))];
        [bezierPath addLineToPoint:CGPointMake(rect.size.width, SINGLE_LINE_ADJUST_OFFSET(0))];
    } else {
        [bezierPath moveToPoint:CGPointMake(0, rect.size.height - SINGLE_LINE_ADJUST_OFFSET(0))];
        [bezierPath addLineToPoint:CGPointMake(rect.size.width, rect.size.height - SINGLE_LINE_ADJUST_OFFSET(0))];
    }
    
    bezierPath.lineCapStyle = kCGLineCapRound;
    [self.color setStroke];
    bezierPath.lineWidth = SINGLE_LINE_WIDTH;
    [bezierPath stroke];
    
}








@end
