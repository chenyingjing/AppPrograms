//
//  ViewController.m
//  3scene
//
//  Created by aa64mac on 8/23/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ImageViewController.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
        ImageViewController *ivc = (ImageViewController *)segue.destinationViewController;
        //ivc.imageName = [NSString stringWithFormat:@"%@.jpg", segue.identifier];
        [ivc setValue:[NSString stringWithFormat:@"%@.jpg", segue.identifier] forKey:@"imageName"];
        ivc.title = segue.identifier;
    }
}

@end
