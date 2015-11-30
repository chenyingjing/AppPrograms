//
//  MyView.swift
//  waterDemo
//
//  Created by aa64mac on 11/23/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

var SCREEN_WIDTH: CGFloat = 800;
var SCREEN_HEIGHT: CGFloat = 600;

let PARTICLE_TYPE_FLICKER = 0;
let PARTICLE_TYPE_FADE = 1;

// color of particle
let PARTICLE_COLOR_RED = 0;
let PARTICLE_COLOR_GREEN = 1;
let PARTICLE_COLOR_BLUE = 2;
let PARTICLE_COLOR_WHITE = 3;

// defines for particle system
let PARTICLE_STATE_DEAD = 0;
let PARTICLE_STATE_ALIVE = 1;

// color ranges
let COLOR_RED_START = 32;
let COLOR_RED_END = 47;

let COLOR_GREEN_START = 96;
let COLOR_GREEN_END = 111

let COLOR_BLUE_START = 214;
let COLOR_BLUE_END = 217;

let COLOR_WHITE_START = 16;
let COLOR_WHITE_END = 31;

let BALL_RADIUS = 5;

let MAX_PARTICLES = 256

class MyView: UIView {
    
    var particle_wind: CGFloat = 0;    // assume it operates in the X direction
    var particle_gravity: CGFloat = 0.5; // assume it operates in the Y direction
    
    struct PARTICLE {
        var state: Int           // state of the particle
        var type: Int            // type of particle effect
        var x: CGFloat, y: CGFloat           // world position of particle
        var xv: CGFloat, yv: CGFloat         // velocity of particle
        var curr_color: Int      // the current rendering color of particle
        var start_color: Int     // the start color or range effect
        var end_color: Int       // the ending color of range effect
        var counter: Int         // general state transition timer
        var max_count: Int       // max value for counter
    }
    
    var particles = [PARTICLE](count: MAX_PARTICLES, repeatedValue: MyView.PARTICLE(
        state: PARTICLE_STATE_DEAD,
        type: PARTICLE_TYPE_FADE,
        x: 0, y: 0,
        xv: 0, yv: 0,
        curr_color: 0, start_color: 0, end_color: 0,
        counter: 0, max_count: 0)) // the particles for the particle engine
    
    
    
    var lineSegments:[(CGPoint, CGPoint)] = []
    
    override func drawRect(rect: CGRect) {
        DrawCollisionObject()
        Process_Particles()
        Compute_Collisions()
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
        SCREEN_WIDTH = screenWidth
        SCREEN_HEIGHT = screenHeight
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
    
    func Process_Particles() {
        // this function moves and animates all particles
        
        for (var index = 0; index < MAX_PARTICLES; index++) {
            // test if this particle is alive
            if (particles[index].state == PARTICLE_STATE_ALIVE) {
                // translate particle
                //particles[index].x += particles[index].xv;
                //particles[index].y += particles[index].yv;
                
                if (particles[index].y >= SCREEN_HEIGHT) {
                    particles[index].state = PARTICLE_STATE_DEAD;
                }
                
                // update velocity based on gravity and wind
                particles[index].xv += particle_wind;
                particles[index].yv += particle_gravity;
                
                // now based on type of particle perform proper animation
                if (particles[index].type == PARTICLE_TYPE_FLICKER) {
                    // simply choose a color in the color range and assign it to the current color
                    particles[index].curr_color = RAND_RANGE(particles[index].start_color, y: particles[index].end_color);
                    
                    // now update counter
                    if (++particles[index].counter >= particles[index].max_count) {
                        // kill the particle
                        particles[index].state = PARTICLE_STATE_DEAD;
                        
                    } // end if
                    
                } // end if
                else {
                    // must be a fade, be careful!
                    // test if it's time to update color
                    if (++particles[index].counter >= particles[index].max_count) {
                        // reset counter
                        particles[index].counter = 0;
                        
                        // update color
                        if (++particles[index].curr_color > particles[index].end_color) {
                            // transition is complete, terminate particle
                            particles[index].state = PARTICLE_STATE_DEAD;
                            
                        } // end if
                        
                    } // end if
                    
                } // end else
                
            } // end if
            
        } // end for index
        
    } // end Process_Particles
    
    func RAND_RANGE(x: Int, y: Int) ->Int {
        let td:UnsafeMutablePointer<time_t> = UnsafeMutablePointer<time_t>(bitPattern: 0)
        let t = time(td)
        srand(UInt32(t))
        let r = Int(rand())
        return ((x) + (r % ((y) - (x) + 1)))
    }
    
    func Compute_Collisions() {
        // this function computes if any ball has hit one of the edges of the polygon
        // if so the ball is bounced
        
        var length, s, t, s1x, s1y, s2x, s2y, p0x, p0y, p1x, p1y, p2x, p2y, p3x, p3y, npx, npy, Nx, Ny, Fx, Fy: CGFloat;
        
        
        for (var index = 0; index < MAX_PARTICLES; index++) {
            if (particles[index].state == PARTICLE_STATE_DEAD) {
                continue;
            }
            
            
            // first move particle
            //particles[index].varsF[INDEX_X] += balls[index].varsF[INDEX_XV];
            //particles[index].varsF[INDEX_Y] += balls[index].varsF[INDEX_YV];
            //particles[index].x += particles[index].xv;
            //particles[index].y += particles[index].yv;
            
            
            // now project velocity vector forward and test for intersection with all lines of polygon shape
            
            // build up vector in direction of trajectory
            //p0x = balls[index].varsF[INDEX_X];
            //p0y = balls[index].varsF[INDEX_Y];
            p0x = particles[index].x;
            p0y = particles[index].y;
            
            //p1x = balls[index].varsF[INDEX_X] + balls[index].varsF[INDEX_XV];
            //p1y = balls[index].varsF[INDEX_Y] + balls[index].varsF[INDEX_YV];
            p1x = particles[index].x + particles[index].xv;
            p1y = particles[index].y + particles[index].yv;
            
            s1x = p1x - p0x;
            s1y = p1y - p0y;
            
            
            var collisionHappen = false;
            let len = lineSegments.count;
            // for each line try and intersect
            //for (int line = 0; line < shape.num_verts; line++)
            for (var line = 0; line < len; line++) {
                // now build up vector based on line
                //p2x = shape.vlist[line].x + shape.x0;
                //p2y = shape.vlist[line].y + shape.y0;
                p2x = lineSegments[line].0.x;
                p2y = lineSegments[line].0.y;
                
                //p3x = shape.vlist[(line + 1) % (shape.num_verts)].x + shape.x0;
                //p3y = shape.vlist[(line + 1) % (shape.num_verts)].y + shape.y0;
                p3x = lineSegments[line].1.x;
                p3y = lineSegments[line].1.y;
                
                s2x = p3x - p2x;
                s2y = p3y - p2y;
                
                // compute s and t, the parameters
                s = (-s1y * (p0x - p2x) + s1x * (p0y - p2y)) / (-s2x * s1y + s1x * s2y);
                t = (s2x * (p0y - p2y) - s2y * (p0x - p2x)) / (-s2x * s1y + s1x * s2y);
                
                // test for valid range (0..1)
                if (s >= 0 && s <= 1 && t >= 0 && t <= 1) {
                    collisionHappen = true;
                    
                    // find collision point based on s
//                    xi = p0x + s * s1x;
//                    yi = p0y + s * s1y;
                    
                    // now we know point of intersection, reflect ball at current location
                    
                    // N = (-I . N')*N'
                    // F = 2*N + I
                    npx = -s2y;
                    npy = s2x;
                    
                    // normalize p
                    length = sqrt(npx * npx + npy * npy);
                    npx /= length;
                    npy /= length;
                    
                    // compute N = (-I . N')*N'
                    //Nx = -(balls[index].varsF[INDEX_XV] * npx + balls[index].varsF[INDEX_YV] * npy)*npx;
                    //Ny = -(balls[index].varsF[INDEX_XV] * npx + balls[index].varsF[INDEX_YV] * npy)*npy;
                    Nx = -(particles[index].xv * npx + particles[index].yv * npy) * npx;
                    Ny = -(particles[index].xv * npx + particles[index].yv * npy) * npy;
                    
                    // compute F = 2*N + I
                    //Fx = 2 * Nx + balls[index].varsF[INDEX_XV];
                    //Fy = 2 * Ny + balls[index].varsF[INDEX_YV];
                    Fx = 2 * Nx + particles[index].xv;
                    Fy = 2 * Ny + particles[index].yv;
                    
                    // update velocity with results
                    //balls[index].varsF[INDEX_XV] = Fx;
                    //balls[index].varsF[INDEX_YV] = Fy;
                    particles[index].xv = Fx * 2 / 5;
                    particles[index].yv = Fy * 2 / 5;
                    
                    //balls[index].varsF[INDEX_X] += balls[index].varsF[INDEX_XV];
                    //balls[index].varsF[INDEX_Y] += balls[index].varsF[INDEX_YV];
                    particles[index].x += particles[index].xv;
                    particles[index].y += particles[index].yv;
                    
                    // break out of for line
                    break;
                    
                } // end if
                
            } // end for line
            if (!collisionHappen) {
                particles[index].x += particles[index].xv;
                particles[index].y += particles[index].yv;
            }
            
        } // end for ball index
        
    } // end Collision_Collisions
    
}
