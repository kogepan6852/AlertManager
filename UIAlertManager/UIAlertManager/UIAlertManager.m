//
//  UIAlertManager.m
//  UIAlertManager
//
//  Created by 菊池達也 on 2015/08/09.
//  Copyright (c) 2015年 菊池達也. All rights reserved.
//

#import "UIAlertManager.h"
#import "UIAlertController+Blocks.h"
#import "UIAlertView+Blocks.h"

@implementation UIAlertManager

+ (void)showAlertManagerWithViewController:(UIViewController *)viewController
                                 withTitle:(NSString *)title
                               withMessage:(NSString *)message
                     withCancelButtonTitle:(NSString *)cancelButtonTitle
                     withOtherButtonTitles:(NSArray *)otherButtonTitles
                      withCompletionBlocks:(AlertManagerCompletionBlocks)completionBlocks {
    
    Class class = NSClassFromString(@"UIAlertController");
    if(class) {
        //ここの処理を0.1秒止めているんですか。
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
            [UIAlertController showAlertViewController:viewController
                                             withTitle:title
                                               withMessage:message
                                     withCancelButtonTitle:cancelButtonTitle
                                     withOtherButtonTitles:otherButtonTitles
                                              withCompletionBlocks:completionBlocks];
        });
    } else {
        [UIAlertView showWithTitle:title
                           message:message
                 cancelButtonTitle:cancelButtonTitle
                 otherButtonTitles:otherButtonTitles
                        completion:completionBlocks];
    }
}

@end
