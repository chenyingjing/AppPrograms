//
//  ViewController.m
//  PromoTest
//
//  Created by aa64mac on 4/16/15.
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
    NSURL *url = [NSURL URLWithString:@"http://www.wildfables.com/promos/"];
    //NSURL *url = [NSURL URLWithString:@"http://www.wildfables.com/"];
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    //NSString *contentType = [NSString stringWithFormat:@"text/xml"];
    //[request addValue:contentType forHTTPHeaderField: @"Content-Type"];
//    NSMutableData *postBody = [NSMutableData data];
//    [postBody appendData:[[NSString stringWithFormat:@"rw_app_id=%@&code=%@&device_id=%@",@"1",@"code",@"uniqueIdentifier"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    /*
    NSMutableData *postBody = [NSMutableData data];
    [postBody appendData:[[NSString stringWithFormat:@"<Request  Action=\"promos\">"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"<Body>"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"<rw_app_id>1</rw_app_id>"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"<code>code</code>"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"<device_id>uniqueIdentifier</device_id>"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"</Body>"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"</Request>"] dataUsingEncoding:NSUTF8StringEncoding]];
     */
    
    NSMutableArray *arrayData = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *dlist = [[NSMutableDictionary alloc] init];
    [dlist setObject:@"1" forKey:@"rw_app_id"];
    [dlist setObject:@"code" forKey:@"code"];
    [dlist setObject:@"uniqueIdentifier" forKey:@"device_id"];

    [arrayData addObject:dlist];
    
    
    //[request setHTTPBody:[httpBodyString dataUsingEncoding:NSUTF8StringEncoding]];
    //
    //post = [[NSString alloc] initWithFormat:@"message=%@",@"hello,world."];
    //[NSJSONSerialization ]
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dlist options:NSJSONWritingPrettyPrinted error:&error];
    //httpBodyString = [arrayData JSONRepresentation];
    //NSData *postData = [httpBodyString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    [request setHTTPBody:jsonData];
    //[request
    //[request setPO]
//    [request setValue:@"1" forKey:@"rw_app_id"];
//    [request setValue:@"code" forKey:@"code"];
//    [request setValue:@"uniqueIdentifier" forKey:@"device_id"];
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
             //NSLog(<#NSString *format, ...#>)
             //self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
             //self.greetingContent.text = [greeting objectForKey:@"content"];
         }
     }];
}

@end
