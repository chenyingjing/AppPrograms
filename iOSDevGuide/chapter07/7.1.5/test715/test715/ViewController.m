//
//  ViewController.m
//  test715
//
//  Created by aa64mac on 9/23/15.
//  Copyright © 2015 ccxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray *textFields_;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *textField1 = [UITextField new];
    textField1.delegate = self;
    textField1.clearsOnBeginEditing = YES;
    textField1.frame = CGRectMake(20, 20, 280, 30);
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.clearButtonMode = UITextFieldViewModeNever;
    textField1.text = @"UITextFieldViewModeNever";
    [self.view addSubview:textField1];
    
    UITextField *textField2 = [UITextField new];
    textField2.delegate = self;
    textField2.frame = CGRectMake(20, 60, 280, 30);
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField2.text = @"UITextFieldViewModeWhileEditing";
    [self.view addSubview:textField2];
    
    UITextField *textField3 = [UITextField new];
    textField3.delegate = self;
    textField3.frame = CGRectMake(20, 100, 280, 30);
    textField3.borderStyle = UITextBorderStyleRoundedRect;
    textField3.clearButtonMode = UITextFieldViewModeUnlessEditing;
    textField3.text = @"UITextFieldViewModeUnlessEditing";
    [self.view addSubview:textField3];
    
    UITextField *textField4 = [UITextField new];
    textField4.delegate = self;
    textField4.frame = CGRectMake(20, 140, 280, 30);
    textField4.borderStyle = UITextBorderStyleRoundedRect;
    textField4.clearButtonMode = UITextFieldViewModeAlways;
    textField4.text = @"UITextFieldViewModeAlways";
    [self.view addSubview:textField4];
    
    textFields_ = @[textField1, textField2, textField3, textField4];
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"textFieldShouldClear:%@", textField.text);
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
