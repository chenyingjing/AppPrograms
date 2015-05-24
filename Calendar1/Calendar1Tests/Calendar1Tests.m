//
//  Calendar1Tests.m
//  Calendar1Tests
//
//  Created by aa64mac on 5/17/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface Calendar1Tests : XCTestCase

@end

@implementation Calendar1Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}

- (void)testNSCalendarRangeOfUnit1 {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *date1 = [dateFormatter dateFromString:@"2000-02-02 00:00:00"];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range1 = [calendar rangeOfUnit:NSCalendarUnitDay
                                    inUnit:NSCalendarUnitMonth forDate:date1];
    NSLog(@"-------------------------------");
    NSLog(@"This day is %@", [dateFormatter stringFromDate:date1]);
    NSLog(@"The index of first day of this month is %ld", range1.location);
    NSLog(@"There are %ld days in this month.", range1.length);
    NSLog(@"-------------------------------");
    XCTAssert(range1.length == 29);
}

- (void)testNSCalendarRangeOfUnit2 {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *date1 = [dateFormatter dateFromString:@"2015-05-17 00:00:00"];
    NSDate *startDate = nil;
    NSTimeInterval tip;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth
                                              startDate:&startDate interval:&tip forDate:date1];
    NSRange range1 = [calendar rangeOfUnit:NSCalendarUnitDay
                                    inUnit:NSCalendarUnitMonth forDate:date1];
    NSLog(@"-------------------------------");
    NSLog(@"This day is %@", [dateFormatter stringFromDate:date1]);
    NSLog(@"The first day of this month is %@", [dateFormatter stringFromDate:startDate]);
    NSLog(@"There are %d days in this month.", (int)tip/3600/24);
    NSLog(@"-------------------------------");
    XCTAssert(ok);
    XCTAssert(range1.length == tip/3600/24);
}

- (void)testOrdinalityOfUnit {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *date1 = [dateFormatter dateFromString:@"2015-05-01 00:00:00"];
    
    //NSDate *date1 = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger ordinality = [calendar ordinalityOfUnit:NSCalendarUnitWeekday
                                                                    inUnit:NSCalendarUnitWeekOfMonth
                                                                   forDate:date1];
    NSLog(@"-------------------------------");
    NSLog(@"This day is %@", [dateFormatter stringFromDate:date1]);//1: Sunday
    NSLog(@"Index %lu is the firstWeekday.", calendar.firstWeekday);
    NSLog(@"The index of this day in week is %lu", ordinality);
    NSLog(@"-------------------------------");
}





- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
