//
//  SceneAViewController.m
//  UseDelegateBy5Steps
//
//  Created by aa64mac on 8/29/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "SceneAViewController.h"

@interface SceneAViewController ()

@end

@implementation SceneAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sceneBViewControllerDidInputed:(NSString *)string {
    self.showInformation.text = string;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Segue_ID_AB"]) {
        SceneBViewController *sceneBVC = segue.destinationViewController;
        sceneBVC.delegate = self;
    }
}

- (IBAction) unwind:(UIStoryboardSegue *)segue {
    NSLog(@"unwind");
}

@end
