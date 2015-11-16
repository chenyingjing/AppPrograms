//
//  MyView.swift
//  D86QuartzTranslateScaleRotate
//
//  Created by aa64mac on 11/9/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

struct VERTEX2DF_TYP {
    var x: Double, y: Double
}

struct POLYGON2D {
    var x0: Double,y0: Double;        // position of center of polygon
    var vlist: [VERTEX2DF_TYP]; // pointer to vertex list
    
}

//var ship = {
//    x0: 0, y0: 0,        // position of center of polygon
//    vlist: ship_vertices
//};

var ship_vertices: [VERTEX2DF_TYP] = [
    VERTEX2DF_TYP(x: 1, y: 11),
    VERTEX2DF_TYP(x: 2, y: 8),
    VERTEX2DF_TYP(x: 1, y: 7),
    VERTEX2DF_TYP(x: 1, y: -1),
    VERTEX2DF_TYP(x: 3, y: -1),
    VERTEX2DF_TYP(x: 3, y: -2),
    VERTEX2DF_TYP(x: 11, y: -3),
    VERTEX2DF_TYP(x: 11, y: -6),
    VERTEX2DF_TYP(x: 3, y: -7),
    VERTEX2DF_TYP(x: 2, y: -8),
    VERTEX2DF_TYP(x: 1, y: -8),
    VERTEX2DF_TYP(x: 1, y: -7),
    VERTEX2DF_TYP(x: -1, y: -7),
    VERTEX2DF_TYP(x: -1, y: -8),
    VERTEX2DF_TYP(x: -2, y: -8),
    VERTEX2DF_TYP(x: -3, y: -7),
    VERTEX2DF_TYP(x: -11, y: -6),
    VERTEX2DF_TYP(x: -11, y: -3),
    VERTEX2DF_TYP(x: -3, y: -2),
    VERTEX2DF_TYP(x: -3, y: -1),
    VERTEX2DF_TYP(x: -1, y: -1),
    VERTEX2DF_TYP(x: -1, y: 7),
    VERTEX2DF_TYP(x: -2, y: 8),
    VERTEX2DF_TYP(x: -1, y: 11)
]
var ship = POLYGON2D(x0: 0, y0: 0, vlist: ship_vertices)



class MyView: UIView {
    
    override func awakeFromNib() {
        Translate_Polygon2D_Mat(&ship, dx: 100, dy: 100);
    }

    override func drawRect(rect: CGRect) {
        //drawLine()
        Draw_Polygon2D(ship);
    }
    
    // these are the matrix versions, note they are more inefficient for
    // single transforms, but their power comes into play when you concatenate
    // multiple transformations, not to mention that all transforms are accomplished
    // with the same code, just the matrix differs
    func Translate_Polygon2D_Mat(inout poly: POLYGON2D, dx: Double, dy: Double)->Int {
        // this function translates the center of a polygon by using a matrix multiply
        // on the the center point, this is incredibly inefficient, but for educational purposes
        // if we had an object that wasn't in local coordinates then it would make more sense to
        // use a matrix, but since the origin of the object is at x0,y0 then 2 lines of code can
        // translate, but lets do it the hard way just to see :)


        var mt = [
            [0.0, 0.0],
            [0.0, 0.0],
            [0.0, 0.0]
        ] // used to hold translation transform matrix
        //var mt = [[Double]]();
        
        // initialize the matrix with translation values dx dy
        Mat_Init_3X2(&mt, m00: 1, m01: 0, m10: 0, m11: 1, m20: dx, m21: dy)
        
        // create a 1x2 matrix to do the transform
//        var p0 = new Array(poly.x0, poly.y0);
//        var p1 = new Array(0, 0); // this will hold result
        let p0 = [poly.x0, poly.y0]
        var p1 = [0.0, 0.0] // this will hold result
        
        // now translate via a matrix multiply
        Mat_Mul1X2_3X2(p0, mb: mt, mprod: &p1);
        
        // now copy the result back into polygon
        poly.x0 = p1[0];
        poly.y0 = p1[1];
        
        // return success
        return (1);
        
    } // end Translate_Polygon2D_Mat
    
    func Draw_Polygon2D(poly: POLYGON2D) {
//        cxt.beginPath();
//        cxt.moveTo(poly.x0 + poly.vlist[0].x, poly.y0 + poly.vlist[0].y);
//        for (var i = 1; i < poly.vlist.length; i++) {
//        cxt.lineTo(poly.x0 + poly.vlist[i].x, poly.y0 + poly.vlist[i].y);
//        }
//        cxt.lineTo(poly.x0 + poly.vlist[0].x, poly.y0 + poly.vlist[0].y);
//        cxt.stroke();
        let context: CGContextRef! = UIGraphicsGetCurrentContext()
        //CGContextSaveGState(context)
        //cxt.moveTo(poly.x0 + poly.vlist[0].x, poly.y0 + poly.vlist[0].y);
        CGContextMoveToPoint(context, CGFloat(poly.x0 + poly.vlist[0].x), CGFloat(poly.y0 + poly.vlist[0].y))
        
        for (var i = 1; i < poly.vlist.count; i++) {
            CGContextAddLineToPoint(context, CGFloat(poly.x0 + poly.vlist[i].x), CGFloat(poly.y0 + poly.vlist[i].y))
        }
        CGContextAddLineToPoint(context, CGFloat(poly.x0 + poly.vlist[0].x), CGFloat(poly.y0 + poly.vlist[0].y))

        CGContextStrokePath(context)
        //CGContextRestoreGState(context)
    }
    
    func Rotate_Polygon2D_Mat(inout poly: POLYGON2D, var theta: Double) {
        // this function rotates the local coordinates of the polygon
        
        // test for negative rotation angle
        if (theta < 0) {
             theta += 360
        }
   
        var mr = [
            [0.0, 0.0],
            [0.0, 0.0],
            [0.0, 0.0]
        ] // used to hold translation transform matrix

        theta = theta * (M_PI / 180);
        
        // initialize the matrix with translation values dx dy
        Mat_Init_3X2(&mr,
            m00: cos(theta), m01: sin(theta),
            m10: -sin(theta), m11: cos(theta),
            m20: 0, m21: 0);
        
        // loop and rotate each point, very crude, no lookup!!!
        for (var curr_vert = 0; curr_vert < poly.vlist.count; curr_vert++) {
            // create a 1x2 matrix to do the transform
            let p0 = [poly.vlist[curr_vert].x, poly.vlist[curr_vert].y]
            var p1 = [0.0, 0.0] // this will hold result
        
            // now rotate via a matrix multiply
            Mat_Mul1X2_3X2(p0, mb: mr, mprod: &p1);
        
            // now copy the result back into vertex
            poly.vlist[curr_vert].x = p1[0];
            poly.vlist[curr_vert].y = p1[1];
        
        } // end for curr_vert
    
    
    } // end Rotate_Polygon2D_Mat
    
    func Scale_Polygon2D_Mat(inout poly: POLYGON2D, sx: Double, sy: Double) {
        // this function scalesthe local coordinates of the polygon

        var ms = [
            [0.0, 0.0],
            [0.0, 0.0],
            [0.0, 0.0]
        ] // used to hold translation transform matrix
        
//        var ms = new Array(
//        new Array(0, 0),
//        new Array(0, 0),
//        new Array(0, 0)
//        ); // used to hold translation transform matrix
        
        
        // initialize the matrix with translation values dx dy
        Mat_Init_3X2(&ms,
            m00: sx, m01: 0,
            m10: 0, m11: sy,
            m20: 0, m21: 0);
        
        
        // loop and scale each point
        for (var curr_vert = 0; curr_vert < poly.vlist.count; curr_vert++) {
            // scale and store result back
            
            // create a 1x2 matrix to do the transform
            let p0 = [poly.vlist[curr_vert].x, poly.vlist[curr_vert].y]
            var p1 = [0.0, 0.0] // this will hold result
            
            // now scale via a matrix multiply
            Mat_Mul1X2_3X2(p0, mb: ms, mprod: &p1);
            
            // now copy the result back into vertex
            poly.vlist[curr_vert].x = p1[0];
            poly.vlist[curr_vert].y = p1[1];
        
        } // end for curr_vert
        
    } // end Scale_Polygon2D_Mat
    
    func Mat_Mul1X2_3X2(ma: [Double], mb: [[Double]], inout mprod: [Double]) {
        // this function multiplies a 1x2 matrix against a
        // 3x2 matrix - ma*mb and stores the result
        // using a dummy element for the 3rd element of the 1x2
        // to make the matrix multiply valid i.e. 1x3 X 3x2
        
        for (var col = 0; col < 2; col++) {
            // compute dot product from row of ma
            // and column of mb
            
            var sum = 0.0; // used to hold result
            var index = 0;
            for (; index < 2; index++) {
            // add in next product pair
            sum += (ma[index] * mb[index][col]);
            } // end for index
            
            // add in last element * 1
            sum += mb[index][col];
            
            // insert resulting col element
            mprod[col] = sum;
        
        } // end for col
    }
    
    func Mat_Init_3X2(inout ma:[[Double]],
        m00: Double, m01: Double,
        m10: Double, m11: Double,
        m20: Double, m21: Double) {
        // this function fills a 3x2 matrix with the sent data in row major form
        ma[0][0] = m00; ma[0][1] = m01;
        ma[1][0] = m10; ma[1][1] = m11;
        ma[2][0] = m20; ma[2][1] = m21;
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

    func left() {
        Translate_Polygon2D_Mat(&ship, dx: -5, dy: 0);
        self.setNeedsDisplay()
    }

    func right() {
        Translate_Polygon2D_Mat(&ship, dx: 5, dy: 0);
        self.setNeedsDisplay()
    }

    func up() {
        Translate_Polygon2D_Mat(&ship, dx: 0, dy: -5);
        self.setNeedsDisplay()
    }

    func down() {
        Translate_Polygon2D_Mat(&ship, dx: 0, dy: 5);
        self.setNeedsDisplay()
    }
    
    func clockWise() {
        Rotate_Polygon2D_Mat(&ship, theta: 5)
        self.setNeedsDisplay()
    }
    
    func anticlockWise() {
        Rotate_Polygon2D_Mat(&ship, theta: -5)
        self.setNeedsDisplay()
    }
    
    func zoomin() {
        Scale_Polygon2D_Mat(&ship, sx: 1.1, sy: 1.1);
        self.setNeedsDisplay()
    }

    func zoomout() {
        Scale_Polygon2D_Mat(&ship, sx: 0.9, sy: 0.9);
        self.setNeedsDisplay()
    }
}
