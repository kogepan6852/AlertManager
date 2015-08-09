//
//  UIAlertController+Blocks.m
//  UIAlertManager
//
//  Created by 菊池達也 on 2015/08/09.
//  Copyright (c) 2015年 菊池達也. All rights reserved.
//

#import "UIAlertController+Blocks.h"

static NSInteger const UIAlertControllerBlocksCancelButtonIndex = 0;
static NSInteger const UIAlertControllerBlocksFirstOtherButtonIndex = 1;

@implementation UIAlertController (Blocks)

+ (instancetype)showViewController:(UIViewController *)viewController
                           withTitle:(NSString *)title
                             withMessage:(NSString *)message
                      withPreferredStyle:(UIAlertControllerStyle)preferredStyle
                   withCancelButtonTitle:(NSString *)cancelButtonTitle
                   withOtherButtonTitles:(NSArray *)otherButtonTitles
                            withCompletionBlocks:(UIAlertControllerCompletionBlock)completionBlocks {
    UIAlertController *strongController = [self alertControllerWithTitle:title
                                                                 message:message
                                                          preferredStyle:preferredStyle];
    __weak UIAlertController *controller = strongController;
    
    if (cancelButtonTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action){
                                                                 if (completionBlocks) {
                                                                     completionBlocks(UIAlertControllerBlocksCancelButtonIndex);
                                                                 }
                                                             }];
        [controller addAction:cancelAction];
    }
    
    for (NSUInteger i = 0; i < otherButtonTitles.count; i++) {
        NSString *otherButtonTitle = otherButtonTitles[i];
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action){
                                                                if (completionBlocks) {
                                                                    completionBlocks(UIAlertControllerBlocksFirstOtherButtonIndex + i);
                                                                }
                                                            }];
        [controller addAction:otherAction];
    }
    
    [viewController presentViewController:controller animated:YES completion:nil];
    
    return controller;
}

+ (instancetype)showAlertViewController:(UIViewController *)viewController
                                withTitle:(NSString *)title
                                  withMessage:(NSString *)message
                        withCancelButtonTitle:(NSString *)cancelButtonTitle
                        withOtherButtonTitles:(NSArray *)otherButtonTitles
                                 withCompletionBlocks:(UIAlertControllerCompletionBlock)completionBlocks {
    return [self showViewController:viewController
                            withTitle:title
                              withMessage:message
                       withPreferredStyle:UIAlertControllerStyleAlert
                    withCancelButtonTitle:cancelButtonTitle
                    withOtherButtonTitles:otherButtonTitles
                             withCompletionBlocks:completionBlocks];
}

@end
