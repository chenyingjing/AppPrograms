//
//  MyLoad.h
//  XibProject
//
//  Created by aa64mac on 9/5/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(MyLoad)

+(id)loadFromNibNamed:(NSString*) nibName;
+(id)loadFromNib;

+(id)loadFromNibNoOwner;

@end
