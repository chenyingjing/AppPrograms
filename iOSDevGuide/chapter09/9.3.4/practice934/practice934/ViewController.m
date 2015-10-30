//
//  ViewController.m
//  practice934
//
//  Created by aa64mac on 10/30/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"
#import "BlendModeTest.h"

@interface ViewController ()
{
    BlendModeTest *test_;
    UILabel *label_;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    test_ = [BlendModeTest new];
    test_.center = self.view.center;
    test_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:test_];
    label_ = [UILabel new];
    label_.frame = CGRectMake(0, self.view.bounds.size.height - 100, self.view.bounds.size.width, 20);
    label_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    label_.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label_];
    [self changeLabel];
    UIImage *imageBack = [UIImage imageNamed:@"back.png"];
    UIImageView *imageViewBack = [[UIImageView alloc] initWithImage:imageBack];
    imageViewBack.frame = CGRectMake(0, 0, 90, 83);
    imageViewBack.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:imageViewBack];
    UIImage *imageFront = [UIImage imageNamed:@"dog.jpg"];
    UIImageView *imageViewFront = [[UIImageView alloc] initWithImage:imageFront];
    imageViewFront.frame = CGRectMake(320 - 90, 0, 90, 83);
    imageViewFront.autoresizingMask = imageViewBack.autoresizingMask;
    [self.view addSubview:imageViewFront];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeLabel {
    switch (test_.blendMode) {
        case kCGBlendModeMultiply:
            label_.text = @"kCGBlendModeMultiply";
            break;
        case kCGBlendModeScreen:
            label_.text = @"kCGBlendModeScreen";
            break;
        case kCGBlendModeOverlay:
            label_.text = @"kCGBlendModeOverlay";
            break;
        case kCGBlendModeDarken:
            label_.text = @"kCGBlendModeDarken";
            break;
        case kCGBlendModeLighten:
            label_.text = @"kCGBlendModeLighten";
            break;
        case kCGBlendModeColorDodge:
            label_.text = @"kCGBlendModeColorDodge";
            break;
        case kCGBlendModeColorBurn:
            label_.text = @"kCGBlendModeColorBurn";
            break;
        case kCGBlendModeSoftLight:
            label_.text = @"kCGBlendModeSoftLight";
            break;
        case kCGBlendModeHardLight:
            label_.text = @"kCGBlendModeHardLight";
            break;
        case kCGBlendModeDifference:
            label_.text = @"kCGBlendModeDifference";
            break;
        case kCGBlendModeExclusion:
            label_.text = @"kCGBlendModeExclusion";
            break;
        case kCGBlendModeHue:
            label_.text = @"kCGBlendModeHue";
            break;
        case kCGBlendModeSaturation:
            label_.text = @"kCGBlendModeSaturation";
            break;
        case kCGBlendModeColor:
            label_.text = @"kCGBlendModeColor";
            break;
        case kCGBlendModeLuminosity:
            label_.text = @"kCGBlendModeLuminosity";
            break;
        case kCGBlendModeClear:
            label_.text = @"kCGBlendModeClear";
            break;
        case kCGBlendModeCopy:
            label_.text = @"kCGBlendModeCopy";
            break;
        case kCGBlendModeSourceIn:
            label_.text = @"kCGBlendModeSourceIn";
            break;
        case kCGBlendModeSourceOut:
            label_.text = @"kCGBlendModeSourceOut";
            break;
        case kCGBlendModeSourceAtop:
            label_.text = @"kCGBlendModeSourceAtop";
            break;
        case kCGBlendModeDestinationIn:
            label_.text = @"kCGBlendModeDestinationIn";
            break;
        case kCGBlendModeDestinationOver:
            label_.text = @"kCGBlendModeDestinationOver";
            break;
        case kCGBlendModeDestinationOut:
            label_.text = @"kCGBlendModeDestinationOut";
            break;
        case kCGBlendModeDestinationAtop:
            label_.text = @"kCGBlendModeDestinationAtop";
            break;
        case kCGBlendModeXOR:
            label_.text = @"kCGBlendModeXOR";
            break;
        case kCGBlendModePlusDarker:
            label_.text = @"kCGBlendModePlusDarker";
            break;
        case kCGBlendModePlusLighter:
            label_.text = @"kCGBlendModePlusLighter";
            break;
        default:
            label_.text = @"kCGBlendModeNormal";
            break;
    }
    
}

- (IBAction)touchUpInside:(id)sender {
    [test_ changeMode];
    [self changeLabel];
    [test_ setNeedsDisplay];
}

@end
