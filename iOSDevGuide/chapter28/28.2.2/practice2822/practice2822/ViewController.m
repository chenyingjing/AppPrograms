//
//  ViewController.m
//  practice2822
//
//  Created by aa64mac on 12/22/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)orientationChanged:(NSNotification *)notification {
    UIDeviceOrientation orientation;
    orientation = [[UIDevice currentDevice] orientation];
    switch (orientation) {
        case UIDeviceOrientationFaceUp:
            self.orientationLabel.text = @"Face Up";
            break;
        case UIDeviceOrientationFaceDown:
            self.orientationLabel.text = @"Face Down";
            break;
        case UIDeviceOrientationPortrait:
            self.orientationLabel.text = @"Standing Up";
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            self.orientationLabel.text = @"Upside Down";
            break;
        case UIDeviceOrientationLandscapeLeft:
            self.orientationLabel.text = @"Left Side";
            break;
        case UIDeviceOrientationLandscapeRight:
            self.orientationLabel.text = @"Right Side";
            break;
            
        default:
            self.orientationLabel.text = @"Unknow";
            break;
    }
}

@end
