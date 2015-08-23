//
//  ImageViewController.m
//  3scene
//
//  Created by aa64mac on 8/23/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()


@property (nonatomic) UIImageView *imageview;
@property (nonatomic) UIImage *image;


@end

@implementation ImageViewController

//@synthesize imageURL _imageURL;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if (!_imageview) {
//        _imageview = [UIImageView new];
//    }
//    self.imageview.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
//    [self.imageview sizeToFit];
    [self.view addSubview:self.imageview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setImageURL:(NSURL *)imgURL {
    _imageURL = imgURL;
    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
}

- (void)setImage:(UIImage *)image {
    self.imageview.image = image;
    [self.imageview sizeToFit];
}

- (UIImageView *)imageview {
    if (!_imageview) {
        _imageview = [UIImageView new];
    }
    return _imageview;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
