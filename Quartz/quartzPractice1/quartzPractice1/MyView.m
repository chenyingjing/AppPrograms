//
//  MyView.m
//  quartzPractice1
//
//  Created by aa64mac on 11/2/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "MyView.h"

@implementation MyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    [self drawLine];
//    [self drawR];
//    [self drawTriangle];
//    [self drawCircle];
//    [self drawArc];
//    [self drawText];
//    [self drawImg];
    [self drawBezier];
}

- (void)drawLine {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGContextSetLineWidth(context, 20);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    [[UIColor magentaColor] set];
    //CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 100, 100);
    
    CGContextStrokePath(context);
    
    
    [[UIColor blueColor] set];
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGContextSetLineWidth(context, 1);
    
    CGContextMoveToPoint(context, 100, 120);
    
    CGContextAddLineToPoint(context, 150, 120);
    CGContextAddLineToPoint(context, 150, 180);
    
    CGContextStrokePath(context);
}

- (void) drawR {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, CGRectMake(20, 20, 100, 100));
    [[UIColor purpleColor] setFill];
    CGContextFillPath(context);
    
}

- (void) drawTriangle {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 50, 0);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 0, 100);
    CGContextSetLineWidth(context, 2);
    CGContextClosePath(context);
    [[UIColor orangeColor] set];
    
    CGContextStrokePath(context);
}

- (void) drawCircle {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(50, 50, 100, 100));
    CGContextSetLineWidth(context, 2);
    
    CGContextStrokePath(context);
}

- (void) drawArc {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, 100, 100, 50, M_PI/2, M_PI/6, 0);
    CGContextStrokePath(context);
}

- (void) drawText {
    NSString *str = @"测试文本";
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    attributes[NSForegroundColorAttributeName] = [UIColor purpleColor];
    [str drawInRect:CGRectMake(100, 100, 100, 30) withAttributes:attributes];
}

- (void) drawImg {
    UIImage *img = [UIImage imageNamed:@"dog.jpg"];
    //[img drawAtPoint:CGPointMake(20, 20)];
    //[img drawInRect:CGRectMake(0, 0, 100, 100)];
    [img drawAsPatternInRect:CGRectMake(0, 0, 200, 200)];
    
    NSString *str = @"测试文本";
    [str drawInRect:CGRectMake(0, 0, 100, 30) withAttributes:nil];
}

- (void) drawBezier {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 10, 10);
    //CGContextAddCurveToPoint(context, 120, 100, 180, 50, 10, 190);
    CGContextAddQuadCurveToPoint(context, 150, 200, 200, 100);
    
    CGContextStrokePath(context);
}

@end







