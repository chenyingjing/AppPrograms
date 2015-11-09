//
//  MyView.swift
//  D86QuartzTranslateScaleRotate
//
//  Created by aa64mac on 11/9/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class MyView: UIView {

    override func drawRect(rect: CGRect) {
        drawLine()
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


}
