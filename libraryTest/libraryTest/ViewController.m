//
//  ViewController.m
//  libraryTest
//
//  Created by aa64mac on 4/11/15.
//  Copyright (c) 2015 aa64mac. All rights reserved.
//

#import "ViewController.h"
#import "lib2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    lib2 *l2 = [lib2 alloc];
    int x = [l2 addTest:1 withNumber:2];
    NSLog(@"%d", x);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
