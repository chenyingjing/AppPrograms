//
//  ViewController.m
//  test716
//
//  Created by aa64mac on 9/23/15.
//  Copyright © 2015 ccxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *imageWhitePaper = [UIImage imageNamed:@"paper.png"];
    UIImage *stretchableWhitePaper = [imageWhitePaper stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    UIImage *imageGrayPaper = [UIImage imageNamed:@"paperGray.png"];
    UIImage *stretchableGrayPaper = [imageGrayPaper stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    UITextField *textField = [UITextField new];
    textField.delegate = self;
    textField.frame = CGRectMake(20, 100, 280, 50);
    textField.background = stretchableWhitePaper;
    textField.disabledBackground = stretchableGrayPaper;
    textField.text = @"有图片";
    textField.textAlignment = NSTextAlignmentCenter;
    textField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.view addSubview:textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    textField.enabled = NO;
    return YES;
}

@end
