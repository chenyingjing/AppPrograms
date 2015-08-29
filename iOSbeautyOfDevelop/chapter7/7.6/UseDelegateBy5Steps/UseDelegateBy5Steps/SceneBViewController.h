//
//  SceneBViewController.h
//  UseDelegateBy5Steps
//
//  Created by aa64mac on 8/29/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SceneBViewController;

@protocol SceneBViewControllerDelegate <NSObject>

- (void)sceneBViewControllerDidInputed:(NSString *)string;

@end

@interface SceneBViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputInformation;
@property (weak, nonatomic) id <SceneBViewControllerDelegate> delegate;

@end

