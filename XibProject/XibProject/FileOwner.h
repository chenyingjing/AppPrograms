//
//  FileOwner.h
//  XibProject
//
//  Created by aa64mac on 9/5/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FileOwner : NSObject

@property (nonatomic, weak) IBOutlet UIView *view;

+(id)viewFromNibNamed:(NSString*) nibName;

@end
