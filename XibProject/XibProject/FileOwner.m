//
//  FileOwner.m
//  XibProject
//
//  Created by aa64mac on 9/5/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "FileOwner.h"

@implementation FileOwner

+(id)viewFromNibNamed:(NSString*) nibName {
    
    FileOwner *owner = [self new];
    
    [[NSBundle mainBundle] loadNibNamed:nibName owner:owner options:nil];
    
    return owner.view;
    
}


@end
