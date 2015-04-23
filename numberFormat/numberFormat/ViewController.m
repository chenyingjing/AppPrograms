//
//  ViewController.m
//  numberFormat
//
//  Created by aa64mac on 4/23/15.
//  Copyright (c) 2015 GitaKumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSNumber *x = @10000000.221;
    NSNumberFormatter *numberFormat = [[NSNumberFormatter alloc] init];
    numberFormat.usesGroupingSeparator = YES;
    numberFormat.groupingSeparator = @",";
    numberFormat.groupingSize = 3;
    numberFormat.maximumFractionDigits = 2;
    numberFormat.minimumFractionDigits = 2;
    //numberFormat.
    self.label1.text = [numberFormat stringFromNumber:x];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
