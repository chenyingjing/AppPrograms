//
//  ViewController.m
//  scrollView
//
//  Created by aa64mac on 8/16/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *images = @[@"image0.png", @"image1.png", @"image2.png"];
    for (int i = 0; i < [images count]; i++) {
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(320 * i, 0, 320, 480)];
        
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        
        NSString *filename = [NSString stringWithFormat:@"image%d.png", i];
        UIImage *image = [UIImage imageNamed:filename];
        
        imageV.image = image;
        
        [self.mainScrollView addSubview:imageV];
    }
    self.mainScrollView.contentSize = CGSizeMake(320 * 3, 80);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
