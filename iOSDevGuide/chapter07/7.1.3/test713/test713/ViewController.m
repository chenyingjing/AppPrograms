//
//  ViewController.m
//  test713
//
//  Created by aa64mac on 9/22/15.
//  Copyright © 2015 ccxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray *textFields_;
NSUInteger currentFieldIndex_;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *textField1 = [UITextField new];
    textField1.delegate = self;
    textField1.frame = CGRectMake(20, 20, 280, 30);
    textField1.borderStyle = UITextBorderStyleLine;
    textField1.text = @"aaaaaa";
    textField1.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:textField1];
    
    UITextField *textField2 = [UITextField new];
    textField2.delegate = self;
    textField2.frame = CGRectMake(20, 60, 280, 30);
    textField2.borderStyle = UITextBorderStyleBezel;
    textField2.text = @"bbbbbbb";
    textField2.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:textField2];
    
    UITextField *textField3 = [UITextField new];
    textField3.delegate = self;
    textField3.frame = CGRectMake(20, 100, 280, 30);
    textField3.borderStyle = UITextBorderStyleRoundedRect;
    textField3.text = @"cccccccc";
    textField3.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:textField3];
    
    UITextField *textField4 = [UITextField new];
    textField4.delegate = self;
    textField4.frame = CGRectMake(20, 140, 280, 30);
    textField4.borderStyle = UITextBorderStyleNone;
    textField4.text = @"dddddddd";
    textField4.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:textField4];
    
    textFields_ = [[NSArray alloc] initWithObjects:textField1,
                   textField2, textField3, textField4, nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    currentFieldIndex_ = [textFields_ indexOfObject:textField];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textFields_.count <= ++currentFieldIndex_) {
        currentFieldIndex_  = 0;
    }
    UITextField *newField = [textFields_ objectAtIndex:currentFieldIndex_];
    if ([newField canBecomeFirstResponder]) {
        [newField becomeFirstResponder];
    }
    return YES;
}

@end
