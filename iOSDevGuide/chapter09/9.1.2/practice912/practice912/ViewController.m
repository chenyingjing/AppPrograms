//
//  ViewController.m
//  practice912
//
//  Created by aa64mac on 10/18/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
UILabel *label_;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    label_ = [UILabel new];
    label_.frame = self.view.bounds;
    label_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label_.text = @"0.5";
    label_.font = [UIFont boldSystemFontOfSize:36];
    label_.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label_];
    
    UISlider *slider = [UISlider new];
    slider.frame = CGRectMake(0, 0, 250, 50);
    
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.5;
    slider.center = self.view.center;
    CGRect frame = slider.frame;
    frame.origin.y += 50;
    slider.frame = frame;
    [slider addTarget:self action:@selector(sliderDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sliderDidChange: (id)sender {
    if ([sender isKindOfClass:[UISlider class]]) {
        UISlider *slider = sender;
        label_.text = [NSString stringWithFormat:@"%0.1f", slider.value];
    }
}

@end
