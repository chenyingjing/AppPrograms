//
//  ViewController.m
//  test723
//
//  Created by aa64mac on 10/11/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UITextView *textView_;

@end

@implementation ViewController

@synthesize textView_;

- (void)viewDidLoad {
    [super viewDidLoad];
    textView_ = [UITextView new];
    textView_.frame = self.view.bounds;
    textView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    textView_.delegate = self;
    textView_.text = @"可以编辑这一段文本";
    textView_.font = [UIFont systemFontOfSize:32];
    [self.view addSubview:textView_];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self textViewDidEndEditing:textView_];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [textView_ resignFirstResponder];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    static const CGFloat kKeyboardHeight = 280.0;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneDidPush)];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
    CGRect textViewFrame = textView.frame;
    textViewFrame.size.height = self.view.bounds.size.height - kKeyboardHeight;
    textView.frame = textViewFrame;
    
    CGRect toolbarFrame = self.navigationController.toolbar.frame;
    toolbarFrame.origin.y = self.view.window.bounds.size.height - toolbarFrame.size.height - kKeyboardHeight;
    self.navigationController.toolbar.frame = toolbarFrame;
    [UIView commitAnimations];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editDidPush)];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    textView.frame = self.view.bounds;
    CGRect toolbarFrame = self.navigationController.toolbar.frame;
    toolbarFrame.origin.y = self.view.window.bounds.size.height - toolbarFrame.size.height;
    self.navigationController.toolbar.frame = toolbarFrame;
    [UIView commitAnimations];
}

- (void)editDidPush {
    [textView_ becomeFirstResponder];
}

- (void)doneDidPush {
    [textView_ resignFirstResponder];
}

@end
