//
//  ViewController.m
//  practice914
//
//  Created by aa64mac on 10/19/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.circularSlider addTarget:self action:@selector(updateProgress:) forControlEvents:UIControlEventValueChanged];
    [self.circularSlider setMinimumValue:self.slider.minimumValue];
    [self.circularSlider setMaximumValue:self.slider.maximumValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (IBAction)updateProgress:(UISlider *)sender {
    float progress = translateValueFromSourceIntervalToDestinationInterval(sender.value, sender.minimumValue, sender.maximumValue, 0.0, 1.0);
    [self.progressView setProgress:progress];
    [self.circularSlider setValue:sender.value];
    [self.slider setValue:sender.value];
}


@end
