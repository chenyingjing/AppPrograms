//
//  MyCellTableViewCell.h
//  LearnFresh
//
//  Created by aa64mac on 5/3/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDProgressView.h"

@interface MyCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bigimage1;
@property (weak, nonatomic) IBOutlet UIImageView *bigimage2;
@property (weak, nonatomic) IBOutlet LDProgressView *process1;

@end
