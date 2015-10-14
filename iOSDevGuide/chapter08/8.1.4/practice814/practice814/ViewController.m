//
//  ViewController.m
//  practice814
//
//  Created by aa64mac on 10/14/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UITextAlignment";
    self.view.backgroundColor = [UIColor blackColor];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 30)];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 30)];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 320, 30)];
    label1.textAlignment = NSTextAlignmentLeft;
    label2.textAlignment = NSTextAlignmentCenter;
    label3.textAlignment = NSTextAlignmentRight;
    label1.text = @"NSTextAlignmentLeft";
    label2.text = @"NSTextAlignmentCenter";
    label3.text = @"NSTextAlignmentRight";
    label1.textColor = [UIColor whiteColor];
    label2.textColor = [UIColor whiteColor];
    label3.textColor = [UIColor whiteColor];
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
