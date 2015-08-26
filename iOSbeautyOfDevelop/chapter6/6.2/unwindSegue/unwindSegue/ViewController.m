//
//  ViewController.m
//  unwindSegue
//
//  Created by aa64mac on 8/26/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)unwindSceneAViewController:(UIStoryboardSegue *)segue {
    NSLog(@"unwind segue is exectued");
}

@end
