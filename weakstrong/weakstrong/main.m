//
//  main.m
//  weakstrong
//
//  Created by aa64mac on 6/21/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    id __weak obj1 = nil;
    {
        id obj0 = [[NSObject alloc] init];
        obj1 = obj0;
        
        NSLog(@"A: %@", obj0);
        NSLog(@"B: %@", obj1);
    }
    NSLog(@"B: %@", obj1);
    return 0;
}
