//
//  SubView.m
//  XibProject
//
//  Created by aa64mac on 9/5/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "SubView.h"
#import "MyLoad+MyLoad.h"

@implementation SubView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id) awakeAfterUsingCoder:(NSCoder*)aDecoder {
    BOOL theThingThatGotLoadedWasJustAPlaceholder = ([[self subviews] count] == 0);
    if (theThingThatGotLoadedWasJustAPlaceholder) {
        SubView* theRealThing = [[self class] loadFromNibNoOwner];
        
        // pass properties through
        [self copyUIPropertiesTo:theRealThing];
        
        //auto layout
        self.translatesAutoresizingMaskIntoConstraints = NO;
        theRealThing.translatesAutoresizingMaskIntoConstraints = NO;
        
        return theRealThing;
    }
    return self;
}

-(void) copyUIPropertiesTo:(UIView *)view
{
    // reflection did not work to get those lists, so I hardcoded them
    // any suggestions are welcome here
    
    NSArray *properties =
    [NSArray arrayWithObjects: @"frame",@"bounds", @"center", @"transform", @"contentScaleFactor", @"multipleTouchEnabled", @"exclusiveTouch", @"autoresizesSubviews", @"autoresizingMask", @"clipsToBounds", @"backgroundColor", @"alpha", @"opaque", @"clearsContextBeforeDrawing", @"hidden", @"contentMode", @"contentStretch", nil];
    
    // some getters have 'is' prefix
    NSArray *getters =
    [NSArray arrayWithObjects: @"frame", @"bounds", @"center", @"transform", @"contentScaleFactor", @"isMultipleTouchEnabled", @"isExclusiveTouch", @"autoresizesSubviews", @"autoresizingMask", @"clipsToBounds", @"backgroundColor", @"alpha", @"isOpaque", @"clearsContextBeforeDrawing", @"isHidden", @"contentMode", @"contentStretch", nil];
    
    for (int i=0; i<[properties count]; i++)
    {
        NSString * propertyName = [properties objectAtIndex:i];
        NSString * getter = [getters objectAtIndex:i];
        
        SEL getPropertySelector = NSSelectorFromString(getter);
        
        NSString *setterSelectorName =
        [propertyName stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[propertyName substringToIndex:1] capitalizedString]];
        
        setterSelectorName = [NSString stringWithFormat:@"set%@:", setterSelectorName];
        
        SEL setPropertySelector = NSSelectorFromString(setterSelectorName);
        
        if ([self respondsToSelector:getPropertySelector] && [view respondsToSelector:setPropertySelector])
        {
            NSObject * propertyValue = [self valueForKey:propertyName];
            
            [view setValue:propertyValue forKey:propertyName];
        }
    }
}

@end
