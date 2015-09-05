//
//  MyLoad.m
//  XibProject
//
//  Created by aa64mac on 9/5/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "MyLoad+MyLoad.h"
#import "FileOwner.h"

@implementation UIView(MyLoad)

+(id)loadFromNibNamed:(NSString*) nibName {
    
    return [FileOwner viewFromNibNamed:nibName];
    
}

+(id)loadFromNib {
    
    return [self loadFromNibNamed:NSStringFromClass(self)];
    
}

+(id)loadFromNibNoOwner {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]; //&1
    UIView *v = [views lastObject];
    return v;
}


@end
