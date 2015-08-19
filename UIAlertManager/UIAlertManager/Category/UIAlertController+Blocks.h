//
//  UIAlertController+Blocks.h
//  UIAlertManager
//
//  Created by 菊池達也 on 2015/08/09.
//  Copyright (c) 2015年 菊池達也. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Blocks)

typedef void (^UIAlertControllerCompletionBlock) (NSInteger buttonIndex);

+ (instancetype)showViewController:(UIViewController *)viewController
                         withTitle:(NSString *)title
                       withMessage:(NSString *)message
                withPreferredStyle:(UIAlertControllerStyle)preferredStyle
             withCancelButtonTitle:(NSString *)cancelButtonTitle
             withOtherButtonTitles:(NSArray *)otherButtonTitles
              withCompletionBlocks:(UIAlertControllerCompletionBlock)completionBlocks;

@end
