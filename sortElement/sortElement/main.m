//
//  main.m
//  sortElement
//
//  Created by aa64mac on 4/27/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSLog(@"%d", PATH_MAX);
        
        //NSMutableArray *mArray = [[NSMutableArray alloc] init];
        NSDictionary *d1 = @{
                                    @"anObject" : @"abc",
                                    @"helloString" : @"Hello, World!",
                                    @"magicNumber" : @"abc",
                                    @"aValue" : @"abc1",
                                    @"ab99" : @"iiwo",
                                    @"abc9" : @"iiwo"

                                    };
        
        NSArray *a1 = d1.allKeys;
        a1 = [a1 sortedArrayUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
            return [str1 compare:str2];
        }];
        
        NSMutableString *s1 = [[NSMutableString alloc] init];
        for (id key in a1) {
            [s1 appendFormat:@"&%@=%@", key, d1[key]];
        }
        NSLog(@"%@", s1);
    }
    return 0;
}
