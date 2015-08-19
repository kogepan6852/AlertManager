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

    
    if (cancelButtonTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action){
                                                                 if (completionBlocks) {
                                                                     completionBlocks(UIAlertControllerBlocksCancelButtonIndex);
                                                                 }
                                                             }];
        [strongController addAction:cancelAction];
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
        [strongController addAction:otherAction];
    }
    
    [viewController presentViewController:strongController animated:YES completion:nil];
    
    return strongController;
}



@end
