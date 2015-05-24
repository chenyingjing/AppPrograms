//
//  WQprotocol.h
//  Calendar1
//
//  Created by aa64mac on 5/17/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#ifndef Calendar1_WQprotocol_h
#define Calendar1_WQprotocol_h

@class WQCalendarGridView;
@class WQCalendarTileView;

@protocol WQCalendarGridViewDataSource <NSObject>

@required

- (NSUInteger)numberOfRowsInGridView:(WQCalendarGridView *)gridView;

- (WQCalendarTileView *)gridView:(WQCalendarGridView *)gridView tileViewForRow:(NSUInteger)row column:(NSUInteger)column;

@optional

- (CGFloat)heightForRowInGridView:(WQCalendarGridView *)gridView;

@end

@protocol WQCalendarGridViewDelegate <NSObject>

- (void)gridView:(WQCalendarGridView *)gridView didSelectAtRow:(NSUInteger)row column:(NSUInteger)column;

@end

#endif
