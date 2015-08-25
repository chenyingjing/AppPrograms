//
//  ViewController.m
//  go2anotherView
//
//  Created by aa64mac on 8/25/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ViewController.h"
#import "SceneBViewController.h"

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

- (IBAction)buttonTouchUpInside:(id)sender {
    SceneBViewController *dest = [self.storyboard instantiateViewControllerWithIdentifier:@"SceneB"];
    dest.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    dest.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:dest animated:YES completion:nil];
}

@end
