//
//  ViewController.m
//  practice2813
//
//  Created by aa64mac on 12/21/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .01;
    self.motionManager.gyroUpdateInterval = .1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)controlHardware:(id)sender {
    if ([self.toggleAccelerometer isOn]) {
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
            [self doAcceleration:accelerometerData.acceleration];
        }];
    } else {
        [self.motionManager stopAccelerometerUpdates];
    }
    
    if ([self.toggleGyroscope isOn] && self.motionManager.gyroAvailable) {
        [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
            [self doRotation:gyroData.rotationRate];
        }];
    } else {
        [self.toggleGyroscope setOn:NO animated:YES];
        [self.motionManager stopGyroUpdates];
    }
}

- (void)doAcceleration:(CMAcceleration)acceleration {
//    if (acceleration.x > 1.3) {
//        self.colorView.backgroundColor = [UIColor greenColor];
//    } else if (acceleration.x < -1.3) {
//        self.colorView.backgroundColor = [UIColor orangeColor];
//    }
    
//    if (acceleration.y > 1.3) {
//        self.colorView.backgroundColor = [UIColor redColor];
//    } else if (acceleration.y < -1.3) {
//        self.colorView.backgroundColor = [UIColor blueColor];
//    }
    if (acceleration.z > 1.3) {
        self.colorView.backgroundColor = [UIColor yellowColor];
    } else if (acceleration.z < -1.3) {
        self.colorView.backgroundColor = [UIColor purpleColor];
    }

//    double value = fabs(acceleration.x);
//    if (value > 1.0) {
//        value = 1.0;
//    }
//    self.colorView.alpha = value;
//    
}

- (void)doRotation:(CMRotationRate)rotation {
    NSLog(@"%f", rotation.x);
    double value = (fabs(rotation.x) + fabs(rotation.y) + fabs(rotation.z)) / 8.0;
    self.colorView.alpha = value;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return NO;
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
