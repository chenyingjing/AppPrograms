//
//  MyView.swift
//  quartzPractice1S
//
//  Created by aa64mac on 11/7/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit


class MyView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
//        drawLine()
//        drawR()
//        drawTriangle()
//        drawCircle()
//        drawArc()
//            drawText()
//        drawImg()
        drawBezier()
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

    func drawR() {
        let context = UIGraphicsGetCurrentContext()
        CGContextAddRect(context, CGRectMake(20, 20, 100, 100))
        UIColor.purpleColor().setFill()
        CGContextFillPath(context)
    }
    
    func drawTriangle() {
        let context = UIGraphicsGetCurrentContext()
        CGContextMoveToPoint(context, 50, 0)
        CGContextAddLineToPoint(context, 100, 100)
        CGContextAddLineToPoint(context, 0, 100)
        CGContextSetLineWidth(context, 2)
        CGContextClosePath(context)
        UIColor.purpleColor().set()
        CGContextStrokePath(context)
    }
    
    func drawCircle() {
        let context = UIGraphicsGetCurrentContext()
        CGContextAddEllipseInRect(context, CGRectMake(50, 50, 100, 100))
        CGContextSetLineWidth(context, 2)
        CGContextStrokePath(context)
    }
    
    func drawArc() {
        let context = UIGraphicsGetCurrentContext()
        CGContextAddArc(context, 100, 100, 50, CGFloat(M_PI_2), CGFloat(M_PI_2)/3, 0)
        CGContextStrokePath(context)
    }
    
    func drawText() {
        let str: NSString = "测试文本"
        var attributes: Dictionary<String, AnyObject> = [NSFontAttributeName: UIFont.systemFontOfSize(20)]
        attributes[NSForegroundColorAttributeName] = UIColor.purpleColor()
        str.drawInRect(CGRectMake(100, 100, 100, 30), withAttributes: attributes)
    }
    
    func drawImg() {
        let img = UIImage(named: "dog.jpg")
//        img?.drawAtPoint(CGPointMake(20, 20))
//        img?.drawInRect(CGRectMake(20, 20, 100, 100))
        img?.drawAsPatternInRect(CGRectMake(0, 0, 190, 190))
        
        let str: NSString = "测试文本"
        str.drawInRect(CGRectMake(0, 0, 100, 30), withAttributes: nil)
    }

    func drawBezier() {
        let context = UIGraphicsGetCurrentContext()
        CGContextMoveToPoint(context, 10, 10)
        
        CGContextAddCurveToPoint(context, 120, 100, 180, 50, 10, 190)
        
        //CGContextAddQuadCurveToPoint(context, 150, 200, 200, 100)
        CGContextStrokePath(context)
    }
    
    
}
