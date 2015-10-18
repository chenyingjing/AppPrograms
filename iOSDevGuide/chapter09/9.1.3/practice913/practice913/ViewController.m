//
//  ViewController.m
//  practice913
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
    CGRect frame = self.view.bounds;
    frame.origin.y -= 50;
    label_.frame = frame;
    label_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label_.text = @"标题";
    label_.font = [UIFont boldSystemFontOfSize:48];
    label_.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label_];
    
    UISlider *slider = [UISlider new];
    slider.frame = CGRectMake(0, 0, 250, 50);
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.5;
    slider.center = self.view.center;
    UIImage *imageForMin = [UIImage imageNamed:@"roope_small.png"];
    UIImage *imageForMax = [UIImage imageNamed:@"roope_big.png"];
    slider.minimumValueImage = imageForMin;
    slider.maximumValueImage = imageForMax;
    [self.view addSubview:slider];
    [slider addTarget:self action:@selector(sliderDidChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sliderDidChange: (id)sender {
    UISlider *slider = sender;
    label_.font = [UIFont boldSystemFontOfSize:(96 * slider.value)];
}

@end
