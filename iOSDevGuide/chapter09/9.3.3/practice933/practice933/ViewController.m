//
//  ViewController.m
//  practice933
//
//  Created by aa64mac on 10/27/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"
#import "DrawImageTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"dog.jpg"];
    DrawImageTest *test = [[DrawImageTest alloc] initWithImage:image];
    test.frame = self.view.bounds;
    test.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
