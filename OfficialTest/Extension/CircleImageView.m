//
//  CircleImageView.m
//  CircleImageView
//
//  Created by xxt-imac on 16/5/10.
//  Copyright © 2016年 xxt-imac. All rights reserved.
//

#import "CircleImageView.h"

@implementation CircleImageView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    self.backgroundColor = [UIColor clearColor];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect imageRect =  CGRectMake(0, 0, rect.size.width, rect.size.height);
    CGContextAddEllipseInRect(context, imageRect);
    CGContextClip(context);
    
    UIImage *image = [UIImage imageNamed:self.imageName];
    [image drawInRect:imageRect];
    
    CGContextSetLineWidth(context, self.boardWidth);
    [self.boardColor set];
    
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    
}

@end
