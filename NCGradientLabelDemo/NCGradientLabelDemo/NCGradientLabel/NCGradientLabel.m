//
//  NCGradientLabel.m
//  SheLong
//
//  Created by lishengfeng on 2019/10/18.
//  Copyright © 2019 lishengfeng. All rights reserved.
//

#import "NCGradientLabel.h"

@implementation NCGradientLabel
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSMutableArray *colors = [NSMutableArray arrayWithCapacity:[self.gradientColors count]];
    [self.gradientColors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIColor class]]) {
            [colors addObject:(__bridge id)[obj CGColor]];
        } else if (CFGetTypeID((__bridge void *)obj) == CGColorGetTypeID()) {
            [colors addObject:obj];
        } else {
            @throw [NSException exceptionWithName:@"CRGradientLabelError"
                                           reason:@"Object in gradientColors array is not a UIColor or CGColorRef"
                                         userInfo:NULL];
        }
    }];
    
    CGContextSaveGState(context);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0, -rect.size.height);
    
    CGGradientRef gradient = CGGradientCreateWithColors(NULL, (__bridge CFArrayRef)colors, NULL);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    if (self.directionType == eGradientDirectionType_leftToRight) {
        startPoint = CGPointMake(0, CGRectGetMinY(rect));
        endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
    }else if (self.directionType == eGradientDirectionType_leftBottomToRightTop){
        startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
        endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMinX(rect));
    }else if (self.directionType == eGradientDirectionType_leftTopToRightBootom){
        startPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMinX(rect));
        endPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
    }
   
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint,
                                kCGGradientDrawsAfterEndLocation | kCGGradientDrawsBeforeStartLocation);
    
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    
    [super drawRect: rect];
}

+ (NCGradientLabel *)createLabelWithFrame:(CGRect)frame
                withTextAlignment:(NSTextAlignment)ta
                         withFont:(UIFont *)font
                    withBackColor:(UIColor *)backcolor
                    withTextColor:(UIColor *)txtColor
                          withTag:(NSInteger)tag {
    
    @autoreleasepool {
        __autoreleasing NCGradientLabel *label = [[NCGradientLabel alloc] initWithFrame:frame];
        label.textAlignment = ta;
        label.textColor = txtColor;
        label.font = font;
        label.backgroundColor = backcolor;
        label.tag = tag;
        
        return label;
    }
}
@end
