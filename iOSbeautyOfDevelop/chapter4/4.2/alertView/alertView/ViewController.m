//
//  ViewController.m
//  alertView
//
//  Created by aa64mac on 8/16/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTouchUpInside:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"提示框标题"
                          message:@"提示框内容"
                          delegate:self
                          cancelButtonTitle:@"取消"
                          otherButtonTitles:@"确定",
                          nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            NSLog(@"选择了“取消”按钮");
            break;
        case 1:
            NSLog(@"选择了“确定”按钮");
            break;
            
        default:
            break;
    }
}

@end
