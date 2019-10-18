# NCGradientLabel
 具有渐变背景颜色的label
 
 ![demo效果图.png](https://upload-images.jianshu.io/upload_images/2609892-581580777b12a89e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 
 使用集成：

##导入头文件
```
#import "NCGradientLabel.h"
```

#创建NCGradientLabel对象
```
NCGradientLabel *actionLabel = [NCGradientLabel createLabelWithFrame:CGRectMake(100, 100,100, 52)
                        withTextAlignment:NSTextAlignmentCenter
                            withFont:[UIFont boldSystemFontOfSize:18.0]
                        withBackColor:[UIColor clearColor]
                        withTextColor:[UIColor whiteColor]
                            withTag:1000];
```
##设置颜色渐变方向

```
actionLabel.gradientColors = @[[UIColor getColorWithHexString:@"#FF9900"],[UIColor getColorWithHexString:@"#FFd122"]];
actionLabel.directionType = type;
```
方向枚举值
```
enum GradientDirectionType{
    eGradientDirectionType_topToBottom = 0,////从上到下
    eGradientDirectionType_leftToRight = 1,//从左到右
    eGradientDirectionType_leftBottomToRightTop = 2,////从左下到右上
    eGradientDirectionType_leftTopToRightBootom = 3,//从左上到右下
};
```
