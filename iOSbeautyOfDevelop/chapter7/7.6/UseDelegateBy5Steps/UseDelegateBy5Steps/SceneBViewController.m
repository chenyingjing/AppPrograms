//
//  SceneBViewController.m
//  UseDelegateBy5Steps
//
//  Created by aa64mac on 8/29/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "SceneBViewController.h"

@interface SceneBViewController ()

@end

@implementation SceneBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.delegate) {
        [self.delegate sceneBViewControllerDidInputed:self.inputInformation.text];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)buttonBTouchUpInside:(id)sender {
    [self.delegate sceneBViewControllerDidInputed:self.inputInformation.text];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
