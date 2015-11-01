//
//  TestView.m
//  practice2112
//
//  Created by aa64mac on 11/1/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        pointArray = [[NSMutableArray alloc] initWithCapacity:3];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        label.text = @"任意单击屏幕内的3点以确定一个三角形";
        [self addSubview:label];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 1.0);
    CGContextSetLineWidth(context, 2.0);
    CGPoint addLines[] =
    {
        firstPoint, secondPoint, thirdPoint, firstPoint
    };
    CGContextAddLines(context, addLines, sizeof(addLines)/sizeof(addLines[0]));
    CGContextStrokePath(context);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [pointArray addObject:[NSValue valueWithCGPoint:point]];
    if (pointArray.count > 3) {
        [pointArray removeObjectAtIndex:0];
    }
    if (pointArray.count == 3) {
        firstPoint = [[pointArray objectAtIndex:0] CGPointValue];
        secondPoint = [[pointArray objectAtIndex:1] CGPointValue];
        thirdPoint = [[pointArray objectAtIndex:2] CGPointValue];
    }
    NSLog(@"%@", [NSString stringWithFormat:@"1:%f/%f\n2:%f/%f\n3:%f/%f", firstPoint.x, firstPoint.y, secondPoint.x, secondPoint.y, thirdPoint.x, thirdPoint.y]);
    [self setNeedsDisplay];
}

@end
