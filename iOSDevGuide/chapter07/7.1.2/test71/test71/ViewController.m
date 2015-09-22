//
//  ViewController.m
//  test71
//
//  Created by aa64mac on 9/22/15.
//  Copyright © 2015 ccxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(20, 100, 280, 30);
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.placeholder = @"请输入信息";
    [self.view addSubview:textField];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
