//
//  WQCalendarGridView.h
//  Calendar1
//
//  Created by aa64mac on 5/17/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WQprotocol.h"

@interface WQCalendarGridView : UIView

@property (nonatomic, weak) id<WQCalendarGridViewDataSource> dataSource;
@property (nonatomic, weak) id<WQCalendarGridViewDelegate> delegate;

- (void)reloadData;

@end
