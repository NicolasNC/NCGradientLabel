//
//  ViewController.m
//  NCGradientLabelDemo
//
//  Created by lishengfeng on 2019/10/18.
//  Copyright © 2019 Nicolas. All rights reserved.
//

#import "ViewController.h"
#import "NCGradientLabel.h"
#import "UIColor+Extend.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createActionLabel:0];
    
    [self createActionLabel:1];
    
    [self createActionLabel:2];
    
    [self createActionLabel:3];
}
- (NCGradientLabel *)createActionLabel:(NSInteger)type{
    NCGradientLabel *actionLabel = [self.view viewWithTag:1000+type];
    if (!actionLabel) {
            actionLabel = [NCGradientLabel createLabelWithFrame:CGRectMake(100, 200+(52+20)*type,self.view.frame.size.width-100*2, 52)
                        withTextAlignment:NSTextAlignmentCenter
                            withFont:[UIFont boldSystemFontOfSize:18.0]
                        withBackColor:[UIColor clearColor]
                        withTextColor:[UIColor whiteColor]
                            withTag:1000+type];

        [self.view addSubview:actionLabel];
            actionLabel.text = [NSString stringWithFormat:@"button%ld",type];
            
       actionLabel.gradientColors = @[[UIColor getColorWithHexString:@"#FF9900"],[UIColor getColorWithHexString:@"#FFd122"]];
        actionLabel.directionType = type;
        actionLabel.layer.cornerRadius = 5.0;
        actionLabel.layer.masksToBounds = true;
    }
    return actionLabel;
}

@end
