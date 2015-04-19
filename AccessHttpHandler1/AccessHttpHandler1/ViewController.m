//
//  ViewController.m
//  AccessHttpHandler1
//
//  Created by aa64mac on 4/18/15.
//  Copyright (c) 2015 GitaKumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1_onClick:(id)sender {

/*
    NSString *post = [NSString stringWithFormat:@"message=%@&name=%@",@"hello,world.", @"Jack"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%ld", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://192.168.1.8/Handler1.ashx"]];
    [request setHTTPMethod:@"POST"];
    //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    //[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
*/
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setValue:@"xiaominfc" forKey:@"username"];
    [dictionary setValue:@"1991-03-26" forKey:@"birthday"];
    [dictionary setValue:[NSNumber numberWithInteger:23] forKey:@"age"];
    NSArray *arrayOfAnthonysChildren = [[NSArray alloc]initWithObjects:@"Java",@"Objective-C",@"Python",@"C++", nil];
    [dictionary setValue:arrayOfAnthonysChildren forKey:@"program_language"];
    
    if([NSJSONSerialization isValidJSONObject:dictionary]){
        NSLog(@"it is a JSONObject!");
    }
    //use dataWithJSONObject fun
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    if([jsonData length] > 0 && error == nil) {
        NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"data:%@",jsonString);
        
    }
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://192.168.1.8/Handler1.ashx"]];
    [request setHTTPMethod:@"POST"];
    
    [request setHTTPBody:jsonData];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             NSLog(@"%@", responseString);
             NSString *teamName = greeting[@"Name"];
             NSLog(@"%@", teamName);
             NSArray *users =greeting[@"Users"];
             for (NSDictionary *user in users) {
                 NSString *id = user[@"Id"];
                 NSString *userName = user[@"Name"];
                 NSLog(@"%@", id);
                 NSLog(@"%@", userName);
             }
         }
     }];
}

@end
