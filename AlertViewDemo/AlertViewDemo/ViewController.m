//
//  ViewController.m
//  AlertViewDemo
//
//  Created by aa64mac on 4/28/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                       message:@"viewDidLoad"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    [theAlert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)button1_onClick:(id)sender {
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                       message:@"button1_onClick"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    [theAlert show];
    

}

@end
