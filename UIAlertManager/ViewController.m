//
//  ViewController.m
//  UIAlertManager
//
//  Created by 菊池達也 on 2015/08/09.
//  Copyright (c) 2015年 菊池達也. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Sample Code　　AutoLayoutになっていない
    /*-----------------------------------------------------------------------------*/
    [UIAlertManager showAlertManagerWithViewController:self
                                             withTitle:@"Title"
                                           withMessage:@"Message"
                                     withCancelButtonTitle:@"cancel"
                                     withOtherButtonTitles:@[@"OK", @"other", @"other", @"other", @"other", @"other", @"other", @"other", @"other"] //配列名でひとつにしたいです。
                                            withCompletionBlocks:^(NSInteger buttonIndex) {
                                                switch (buttonIndex) {
                                                    case 0://マジックナンバーになっていること,else処理がないこと
                                                        NSLog(@"buttonIndex = %ld",(long)buttonIndex);
                                                        NSLog(@"cancel");
                                                        break;
                                                    case 1:
                                                        NSLog(@"buttonIndex = %ld",(long)buttonIndex);
                                                        NSLog(@"ok");
                                                        break;
                                                    case 2:
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
