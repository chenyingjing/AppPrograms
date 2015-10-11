//
//  ViewController.m
//  test724
//
//  Created by aa64mac on 10/11/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

static const CGFloat kKeyboardHeight = 216.0;

@implementation ViewController

UITextView *textView_;

- (void)viewDidLoad {
    [super viewDidLoad];
    textView_ = [UITextView new];
    textView_.frame = self.view.bounds;
    textView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    textView_.text = @"此文本可编辑。";
    [self.view addSubview:textView_];
    
    UIBarButtonItem *hasTextButton = [[UIBarButtonItem alloc] initWithTitle:@"hasText" style:UIBarButtonItemStylePlain target:self action:@selector(hasTextDidPush)];
    UIBarButtonItem *selectionButton = [[UIBarButtonItem alloc] initWithTitle:@"selection" style:UIBarButtonItemStylePlain target:self action:@selector(selectionDidPush)];
    UIBarButtonItem *alignmentButton = [[UIBarButtonItem alloc] initWithTitle:@"alignment" style:UIBarButtonItemStylePlain target:self action:@selector(alignmentDidPush)];
    UIBarButtonItem *scrollButton = [[UIBarButtonItem alloc] initWithTitle:@"top" style:UIBarButtonItemStylePlain target:self action:@selector(scrollDidPush)];
    NSArray *buttons = @[hasTextButton, selectionButton, alignmentButton, scrollButton];
    [self setToolbarItems:buttons animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    textView_.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kKeyboardHeight);
    CGRect toolbarFrame = self.navigationController.toolbar.frame;
    toolbarFrame.origin.y = self.view.window.bounds.size.height - toolbarFrame.size.height - kKeyboardHeight;
    [UIView commitAnimations];
    [textView_ becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    textView_.frame = self.view.bounds;
    CGRect toolbarFrame = self.navigationController.toolbar.frame;
    toolbarFrame.origin.y = self.view.window.bounds.size.height - toolbarFrame.size.height;
    self.navigationController.toolbar.frame = toolbarFrame;
    [UIView commitAnimations];
    [textView_ resignFirstResponder];
}

- (void)hasTextDidPush {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"" preferredStyle:UIAlertControllerStyleAlert];
    if (textView_.hasText) {
        alert.message = @"textView_.hasText = YES";
    } else {
        alert.message = @"textView_.hasText = NO";
    }
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)selectionDidPush {
    UIAlertView *alert = [UIAlertView new];
    alert.message = [NSString stringWithFormat:@"location = %lu, length = %lu", textView_.selectedRange.location, textView_.selectedRange.length];
    [alert addButtonWithTitle:@"OK"];
    [alert show];
}

- (void)alignmentDidPush {
    textView_.editable = NO;
    if (UITextAlignmentRight < ++textView_.textAlignment) {
        textView_.textAlignment = UITextAlignmentLeft;
    }
    textView_.editable = YES;
}

- (void)scrollDidPush {
    [textView_ scrollRangeToVisible:NSMakeRange(0, 1)];
}

@end
