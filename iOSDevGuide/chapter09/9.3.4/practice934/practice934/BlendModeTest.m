//
//  BlendModeTest.m
//  practice934
//
//  Created by aa64mac on 10/30/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "BlendModeTest.h"

@interface BlendModeTest()

@end

@implementation BlendModeTest

@synthesize blendMode = blendMode_;

- (id)init {
    if (self = [super init]) {
        backImage_ = [UIImage imageNamed:@"back.png"];
        frontImage_ = [UIImage imageNamed:@"dog.jpg"];
        CGRect newFrame = self.frame;
        newFrame.size = frontImage_.size;
        self.frame = newFrame;
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [backImage_ drawInRect:rect];
    [frontImage_ drawInRect:rect blendMode:blendMode_ alpha:1.0];
}

- (void)changeMode {
    if (kCGBlendModeLuminosity < ++blendMode_) {
        blendMode_ = kCGBlendModeNormal;
    }
}

@end
