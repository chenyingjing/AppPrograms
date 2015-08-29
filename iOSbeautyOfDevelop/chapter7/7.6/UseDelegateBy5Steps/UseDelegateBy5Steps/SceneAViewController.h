//
//  SceneAViewController.h
//  UseDelegateBy5Steps
//
//  Created by aa64mac on 8/29/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SceneBViewController.h"

@interface SceneAViewController : UIViewController<SceneBViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *showInformation;
- (IBAction) unwind:(UIStoryboardSegue *)segue;


@end
