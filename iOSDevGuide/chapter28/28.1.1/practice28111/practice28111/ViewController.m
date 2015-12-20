//
//  ViewController.m
//  practice28111
//
//  Created by aa64mac on 12/20/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = self;
    accelerometer.updateInterval = 1.0/30.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
//    NSString *str = [NSString stringWithFormat:@"x:%g\ty:%g\tz:%g", acceleration.x, acceleration.y, acceleration.z];
//    NSLog(@"%@", str);
//    if (fabsf(acceleration.x) > 1.8 || fabsf(acceleration.y) > 1.8 || fabsf(acceleration.z) > 1.8) {
//        NSLog(@"你要动我了～");
//    }
    
//    NSString *str = [NSString stringWithFormat:@"x:%g", acceleration.x];
//    if (fabs(acceleration.x) > 2) {
//        NSLog(@"%@", str);
//    }

//    NSString *str = [NSString stringWithFormat:@"y:%g", acceleration.y];
//    if (fabs(acceleration.y) > 1) {
//        NSLog(@"%@", str);
//    }

    NSString *str = [NSString stringWithFormat:@"z:%g", acceleration.z];
    //if (fabs(acceleration.z) > 1.5) {
        NSLog(@"%@", str);
    //}
}

@end
