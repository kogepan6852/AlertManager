#import "UIAlertView+Blocks.h"
#import <objc/runtime.h>

@interface AlertViewBlocksWrapper : NSObject <UIAlertViewDelegate>
@property (copy) void(^completionBlock)(NSInteger buttonIndex);
@end

@implementation AlertViewBlocksWrapper

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.completionBlock)
        self.completionBlock(buttonIndex);
}

- (void)alertViewCancel:(UIAlertView *)alertView {
    if (self.completionBlock)
        self.completionBlock(alertView.cancelButtonIndex);
}

@end

static const char kAlertViewBlocksWrapper;

@implementation UIAlertView (Blocks)

+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelButtonTitle
    otherButtonTitles:(NSArray *)otherButtonTitles
           completion:(void(^)(NSInteger buttonIndex))completionBlock {

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:cancelButtonTitle
                                              otherButtonTitles:nil];
    for (NSString *buttonTitle in otherButtonTitles) {
        [alertView addButtonWithTitle:buttonTitle];
    }
    [alertView showCompletion:completionBlock];
}

- (void)showCompletion:(void(^)(NSInteger buttonIndex))completionBlock {
    AlertViewBlocksWrapper *wrapper = [[AlertViewBlocksWrapper alloc] init];
    wrapper.completionBlock = completionBlock;
    self.delegate = wrapper;
    objc_setAssociatedObject(self, &kAlertViewBlocksWrapper, wrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self show];
}

@end