//
//  MyView.swift
//  waterDemo
//
//  Created by aa64mac on 11/23/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class MyView: UIView {
    var x = 0
    var lineSegments:[(CGPoint, CGPoint)] = []

    override func drawRect(rect: CGRect) {
        DrawCollisionObject()
    }
    
    func drawLine() {
        let context: CGContextRef! = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextSetLineWidth(context, 20)
        CGContextSetLineCap(context, CGLineCap.Round)
        
        CGContextSetRGBStrokeColor(context, 1, 0, 0, 1)
        CGContextMoveToPoint(context, 10, 10)
        CGContextAddLineToPoint(context, 100, 100)
        CGContextStrokePath(context)
        CGContextRestoreGState(context)
        
        UIColor.blueColor().set()
        
        CGContextSetLineJoin(context, CGLineJoin.Round)
        CGContextMoveToPoint(context, 100, 120)
        CGContextAddLineToPoint(context, 150, 120)
        CGContextAddLineToPoint(context, 150, 180)
        CGContextStrokePath(context)
    }
    
    func start () {
        NSTimer.scheduledTimerWithTimeInterval(0.033, target: self, selector: "drawIt", userInfo: nil, repeats: true)
    }
    
    func drawIt() {
        //x++
        //print("drawIt\(x)")
        //print(x)
        self.setNeedsDisplay()
    }
    
    func DrawCollisionObject() {
        let context: CGContextRef! = UIGraphicsGetCurrentContext()
        for l in lineSegments {
            CGContextMoveToPoint(context, l.0.x, l.0.y)
            CGContextAddLineToPoint(context, l.1.x, l.1.y)
            CGContextStrokePath(context)
        }
    }
    
    func initData(screenWidth: CGFloat, screenHeight: CGFloat) {
        print("initData")
        InitCollisionLineSegments(screenWidth, screenHeight: screenHeight)
        
        self.start()
    }
    
    func InitCollisionLineSegments(screenWidth: CGFloat, screenHeight: CGFloat) {
        let p1 = CGPointMake(screenWidth / 2, screenHeight / 2)
        let p2 = CGPointMake(screenWidth / 2 + 100, screenHeight / 2 + 100)
        let p3 = CGPointMake(screenWidth / 2 - 50, screenHeight / 2 + 100)
        let l1 = (p1, p2)
        let l2 = (p2, p3)
        let l3 = (p3, p1)
        lineSegments.append(l1);
        lineSegments.append(l2);
        lineSegments.append(l3);
    }

}
