//
//  main.m
//  KVCpractice
//
//  Created by aa64mac on 12/8/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People: NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;

-(id) initWithDictionary:(NSDictionary *) dict;

@end

@implementation People

-(id) initWithDictionary:(NSDictionary *) dict
{
    if((self = [super init]))
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        
        People *people = [People new];
        people.name = @"Jack";
        people.age = @10;
        NSLog(@"%@", people.name);
        NSLog(@"%@", people.age);
        NSLog(@"%@", [people valueForKey:@"name"]);
        NSLog(@"%@", [people valueForKey:@"age"]);
        [people setValue:@"Tom" forKey:@"name"];
        [people setValue:@100 forKey:@"age"];
        NSLog(@"%@", people.name);
        NSLog(@"%@", people.age);
        
        NSDictionary *dict = @{@"name":@"Jim", @"age":@31};
        People *tim = [People new];
        tim = [tim initWithDictionary:dict];
        NSLog(@"%@", tim.name);
        NSLog(@"%@", tim.age);
        
    }
    return 0;
}
