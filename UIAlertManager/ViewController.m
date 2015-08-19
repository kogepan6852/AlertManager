//
//  ViewController.m
//  UIAlertManager
//
//  Created by 菊池達也 on 2015/08/09.
//  Copyright (c) 2015年 菊池達也. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertManager.h"

static NSInteger const CANCEL = 0;
static NSInteger const OK = 1;



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *cellStringArray = @[@"OK", @"other", @"other", @"other", @"other", @"other", @"other", @"other", @"other"];
    
    /*-----------------------------------------------------------------------------*/
    [UIAlertManager showAlertManagerWithViewController:self
                                             withTitle:@"Title"
                                           withMessage:@"Message"
                                     withCancelButtonTitle:@"cancel"
                                     withOtherButtonTitles: cellStringArray
                                            withCompletionBlocks:^(NSInteger buttonIndex) {
                                                switch (buttonIndex) {
                                                    case CANCEL:
                                                        NSLog(@"buttonIndex = %ld",(long)buttonIndex);
                                                        NSLog(@"cancel");
                                                        break;
                                                    case OK:
                                                        NSLog(@"buttonIndex = %ld",(long)buttonIndex);
                                                        NSLog(@"ok");
                                                        break;
                                                    default:
                                                        NSLog(@"buttonIndex = %ld",(long)buttonIndex);
                                                        NSLog(@"other");
                                                        break;
                                                }
                                            }];
    /*-----------------------------------------------------------------------------*/
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
