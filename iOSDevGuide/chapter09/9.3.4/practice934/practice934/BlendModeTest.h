//
//  BlendModeTest.h
//  practice934
//
//  Created by aa64mac on 10/30/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlendModeTest : UIView
{
    UIImage *backImage_;
    UIImage *frontImage_;
    //CGBlendMode blendMode_;
}
@property CGBlendMode blendMode;

- (void)changeMode;

@end
