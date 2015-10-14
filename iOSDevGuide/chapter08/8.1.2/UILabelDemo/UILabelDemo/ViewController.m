//
//  ViewController.m
//  UILabelDemo
//
//  Created by aa64mac on 10/12/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"
#import "UILabelEx.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/*
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"This is a UILabel Demo";
    label.font = [UIFont fontWithName:@"Arial" size:35];
    label.textColor = [UIColor yellowColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blueColor];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
//    CGSize size = [label.text sizeWithFont:label.font constrainedToSize:self.view.bounds.size lineBreakMode:label.lineBreakMode];
    
    CGRect size = [label.text boundingRectWithSize:self.view.bounds.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil];
    CGRect rect = label.frame;
    rect.size.height = size.size.height;
    label.frame = rect;
    [self.view addSubview:label];
*/
    UILabelEx *label = [[UILabelEx alloc] initWithFrame:self.view.bounds];
    label.text = @"This is a UILabel Demo";
    label.font = [UIFont fontWithName:@"Arial" size:35];
    label.textColor = [UIColor yellowColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blueColor];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    label.verticalAlignment = VerticalAlignmentMiddle;
    [self.view addSubview:label];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
