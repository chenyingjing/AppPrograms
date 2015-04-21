//
//  ViewController.m
//  LocalizationTest
//
//  Created by aa64mac on 4/21/15.
//  Copyright (c) 2015 GitaKumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *str1 = NSLocalizedString(@"RunningDistance", @"distance for a marathon");
    NSLog(@"%@", str1);
    NSString *languageID = [[NSBundle mainBundle] preferredLocalizations].firstObject;
    NSLog(@"%@", languageID);
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:languageID];
    NSString *localizedString = [locale displayNameForKey:NSLocaleIdentifier value:languageID];
    NSLog(@"%@", localizedString);
    id bQuote = [locale objectForKey:NSLocaleQuotationBeginDelimiterKey];
    id eQuote = [locale objectForKey:NSLocaleQuotationEndDelimiterKey];
    NSString *quotedString = [NSString stringWithFormat:@"%@%@%@", bQuote, @"xxx", eQuote];
    NSLog(@"%@", quotedString);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
