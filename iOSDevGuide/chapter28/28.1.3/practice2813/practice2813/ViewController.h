//
//  ViewController.h
//  practice2813
//
//  Created by aa64mac on 12/21/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UISwitch *toggleAccelerometer;
@property (weak, nonatomic) IBOutlet UISwitch *toggleGyroscope;

@property (strong, nonatomic) CMMotionManager *motionManager;

@end

