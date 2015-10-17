//
//  ViewController.m
//  practice822
//
//  Created by aa64mac on 10/17/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"危险！请勿触碰！" forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    button.center = self.view.center;
    button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonDidPush {
//    UIAlertView *alert = [UIAlertView new];
//    alert.message = @"哈哈，这是一个笑话！！";
//    [alert addButtonWithTitle:@"OK"];
//    [alert show];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"" message:@"哈哈，这是一个笑话！！" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
