//
//  UIAlertManager.h
//  UIAlertManager
//
//  Created by 菊池達也 on 2015/08/09.
//  Copyright (c) 2015年 菊池達也. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  Alert Manager Class
 */
@interface UIAlertManager : NSObject

typedef void (^AlertManagerCompletionBlocks) (NSInteger buttonIndex);

/**
 *  ShowAlert Method
 *
 *  @param viewController    parent ViewController
 *  @param title             Title String
 *  @param message           Message String
 *  @param cancelButtonTitle Cancel Button String
 *  @param otherButtonTitles Other Button String
 *  @param completionBlocks  Blocks
 */
+ (void)showAlertManagerWithViewController:(UIViewController *)viewController
                                 withTitle:(NSString *)title
                               withMessage:(NSString *)message
                     withCancelButtonTitle:(NSString *)cancelButtonTitle
                     withOtherButtonTitles:(NSArray *)otherButtonTitles
                      withCompletionBlocks:(AlertManagerCompletionBlocks)completionBlocks;
@end
