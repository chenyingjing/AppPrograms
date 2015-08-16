//
//  ViewController.m
//  MakeKeyboardDisappear
//
//  Created by aa64mac on 8/16/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

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

- (IBAction)didEndOnExit:(id)sender {
    [self.textField resignFirstResponder];
    
}

@end
