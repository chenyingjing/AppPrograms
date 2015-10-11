//
//  ViewController.m
//  test722
//
//  Created by aa64mac on 10/11/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextView *textView = [UITextView new];
    textView.frame = self.view.bounds;
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //textView.editable = NO;
    
//    textView.backgroundColor = [UIColor blackColor];
//    textView.textColor = [UIColor whiteColor];
    textView.font = [UIFont systemFontOfSize:32];
    textView.text = @"学习UITextView!\n"
                    "第2行\n"
                    "第3行\n"
                    "第4行\n"
                    "第5行\n"
                    "第6行\n"
                    "第7行\n"
                    "第8行\n"
                    "第9行\n"
                    "第10行\n"
                    "第11行\n"
                    "第12行\n";
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
