//
//  ViewController.m
//  UserDefaults
//
//  Created by aa64mac on 8/16/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ViewController.h"

#define MYDATA      @"MyData"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *myUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *myData = [myUserDefaults objectForKey:MYDATA];
    self.textField1.text = myData;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchUpInside:(id)sender {
    NSUserDefaults *myUserDefaults = [NSUserDefaults standardUserDefaults];
    [myUserDefaults setObject:self.textField1.text forKey:MYDATA];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
