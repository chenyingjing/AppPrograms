//
//  ViewController.m
//  ByNSOperationQueue
//
//  Created by aa64mac on 9/7/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UITextView *content;


@end

@implementation ViewController

static NSOperationQueue *queue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTouchUpInside:(id)sender {
    //self.indicator.hidden = NO;
    [self.indicator startAnimating];
    queue = [NSOperationQueue new];
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download) object:nil];
    [queue addOperation:op];
    
}

- (void)download {
    NSURL *url = [NSURL URLWithString:@"http://www.youdao.com"];
    NSError *error;
    NSString *data = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (data != nil) {
        [self performSelectorOnMainThread:@selector(download_completed:) withObject:data waitUntilDone:NO];
    } else {
        NSLog(@"error when download:%@", error);
    }
    
}

- (void)download_completed:(NSString *)data {
    NSLog(@"call back");
    [self.indicator stopAnimating];
    self.content.text = data;
}

- (IBAction)GCDbuttonTouchUpInside:(id)sender {
    [self.indicator startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:@"http://www.youdao.com"];
        NSError *error;
        NSString *data = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.indicator stopAnimating];
                self.content.text = data;
            });
        } else {
            NSLog(@"error when download:%@", error);
        }
    });
}

@end
