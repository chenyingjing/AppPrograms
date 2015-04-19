//
//  main.m
//  md5test
//
//  Created by aa64mac on 4/11/15.
//  Copyright (c) 2015 aa64mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        //const char *cStr = "123456";
        NSString *rowString = @"123456";
        //NSString *rowString = @"1234";
        const char *cStr = [rowString cStringUsingEncoding: NSUTF8StringEncoding];
        unsigned char result[CC_MD5_DIGEST_LENGTH] = {0};
        
        CC_MD5( cStr, (CC_LONG)[rowString length] , result ); // This is the md5 call
        NSString *strResult = [NSString stringWithFormat:
         @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
         result[0], result[1], result[2], result[3],
         result[4], result[5], result[6], result[7],
         result[8], result[9], result[10], result[11],
         result[12], result[13], result[14], result[15]
         ];
        NSLog(@"%s", result);
        NSLog(@"%@", strResult);
    }
    return 0;
}
