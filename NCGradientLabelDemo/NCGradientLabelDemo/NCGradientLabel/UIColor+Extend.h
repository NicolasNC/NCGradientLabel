//
//  UIColor+Extend.h
//  NCGradientLabelDemo
//
//  Created by lishengfeng on 2019/10/18.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor(Extend)
+(UIColor *)getColorWithHexString:(NSString *)hexString;
+(UIColor *)getColorWithHexString:(NSString *)hexString andAlpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
