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

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //[self.view addSubview:self.imageview];
    [self.scrollView addSubview:self.imageview];
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

- (void)setScrollView:(UIScrollView *)scrollView {
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.delegate = self;
    self.scrollView.contentSize = self.image.size;
}

- (UIImage *)image {
    return self.imageview.image;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageview;
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
