//
//  DrawImageTest.m
//  practice933
//
//  Created by aa64mac on 10/27/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "DrawImageTest.h"

@implementation DrawImageTest
{
    UIImage *image_;
}

- (void)drawRect:(CGRect)rect {
    //[image_ drawAtPoint:rect.origin];
    [image_ drawInRect:rect];
}


- (id)initWithImage:(UIImage *)image {
    if (self = [super init]) {
        image_ = image;
    }
    return self;
}

@end
