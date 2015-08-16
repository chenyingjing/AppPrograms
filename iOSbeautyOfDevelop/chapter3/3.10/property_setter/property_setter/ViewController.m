//
//  ViewController.m
//  property_setter
//
//  Created by aa64mac on 8/16/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation ViewController

@synthesize iBtnCounter = _iBtnCounter;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.iBtnCounter = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTouchUpInside:(id)sender {
    self.iBtnCounter++;
    
    //self.countLabel.text = [NSString stringWithFormat:@"Button clicked counter is:%d", self.iBtnCounter];
}

- (int)iBtnCounter {
    return _iBtnCounter;
}

- (void)setIBtnCounter:(int)inputData {
    _iBtnCounter = inputData;
    self.countLabel.text = [NSString stringWithFormat:@"Button clicked counter is:%d", self.iBtnCounter];
}

@end
