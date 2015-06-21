//
//  main.m
//  invokeAmethodOnnil
//
//  Created by aa64mac on 6/21/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Class1 : NSObject

- (void)foo;

@end

@implementation Class1

- (void)foo {
    NSLog(@"foo called");
}

@end

int main(int argc, const char * argv[]) {
    Class1 *class1 = nil;
    [class1 foo];
    NSLog(@"hello");

    return 0;
}
