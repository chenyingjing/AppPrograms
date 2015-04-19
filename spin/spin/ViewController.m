//
//  ViewController.m
//  spin
//
//  Created by aa64mac on 4/11/15.
//  Copyright (c) 2015 aa64mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.spin1.frame.size.width = 50;
    //self.spin1.frame.size.height = 50;
    CGRect rect1 = self.spin1.frame;
    //rect1.size = {50.0d, 50.0d};
    rect1.size.width = 200;
    rect1.size.height = 200;
    [self.spin1 setFrame:rect1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonOnClick:(id)sender {
    static BOOL animate = YES;
    if (animate) {
        [self.spin1 startAnimating];
    } else {
        [self.spin1 stopAnimating];
    }
    animate = !animate;
    
}

@end
