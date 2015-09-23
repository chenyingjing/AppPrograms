//
//  ViewController.m
//  test714
//
//  Created by aa64mac on 9/23/15.
//  Copyright © 2015 ccxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *textField = [UITextField new];
    textField.frame = CGRectMake(20, 100, 280, 100);
    textField.borderStyle = UITextBorderStyleBezel;
    textField.backgroundColor = [UIColor blackColor];
    textField.textColor = [UIColor redColor];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.font = [UIFont systemFontOfSize:36];
    textField.text = @"看我的字体和颜色";
    [self.view addSubview:textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
