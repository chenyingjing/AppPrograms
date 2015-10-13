//
//  UILabelEx.h
//  UILabelDemo
//
//  Created by aa64mac on 10/13/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface UILabelEx : UILabel
{
    VerticalAlignment _verticalAlignment;
}
@property (nonatomic, assign) VerticalAlignment verticalAlignment;
@end
