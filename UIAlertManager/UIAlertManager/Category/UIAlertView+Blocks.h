//
//  UIAlertView+Blocks.h
//  UIAlertManager
//
//  Created by 菊池達也 on 2015/08/09.
//  Copyright (c) 2015年 菊池達也. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Blocks)

+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelButtonTitle
    otherButtonTitles:(NSArray *)otherButtonTitles
           completion:(void(^)(NSInteger buttonIndex))completionBlock;

- (void)showCompletion:(void(^)(NSInteger buttonIndex))completionBlock;

@end
