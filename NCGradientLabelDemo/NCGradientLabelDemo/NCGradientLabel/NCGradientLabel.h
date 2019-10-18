//
//  NCGradientLabel.h
//  SheLong
//
//  Created by lishengfeng on 2019/10/18.
//  Copyright © 2019 lishengfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
enum GradientDirectionType{
    eGradientDirectionType_topToBottom = 0,////从上到下
    eGradientDirectionType_leftToRight = 1,//从左到右
    eGradientDirectionType_leftBottomToRightTop = 2,////从左下到右上
    eGradientDirectionType_leftTopToRightBootom = 3,//从左上到右下
};
@interface NCGradientLabel : UILabel
@property (nonatomic, strong)NSArray <UIColor *> *gradientColors;
//default eGradientDirectionType_topToBottom
@property (nonatomic)enum GradientDirectionType directionType;

+ (NCGradientLabel *)createLabelWithFrame:(CGRect)frame
                withTextAlignment:(NSTextAlignment)ta
                         withFont:(UIFont *)font
                    withBackColor:(UIColor *)backcolor
                    withTextColor:(UIColor *)txtColor
                          withTag:(NSInteger)tag;
@end

NS_ASSUME_NONNULL_END
