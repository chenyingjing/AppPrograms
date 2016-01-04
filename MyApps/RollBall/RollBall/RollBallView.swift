//
//  RollBallView.swift
//  RollBall
//
//  Created by aa64mac on 12/28/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

var SCREEN_WIDTH: CGFloat = 800;
var SCREEN_HEIGHT: CGFloat = 600;

let PARTICLE_TYPE_FLICKER = 0;
let PARTICLE_TYPE_FADE = 1;

// defines for particle system
let PARTICLE_STATE_DEAD = 0;
let PARTICLE_STATE_ALIVE = 1;

let BALL_RADIUS: CGFloat = 15;

class RollBallView: UIView {

    var particle_wind: CGFloat = 0;    // assume it operates in the X direction
    var particle_gravity: CGFloat = 0.1; // assume it operates in the Y direction
    
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
    
    var particle = RollBallView.PARTICLE(
        state: PARTICLE_STATE_DEAD,
        type: PARTICLE_TYPE_FADE,
        x: 0, y: 0,
        xv: 0, yv: 0,
        curr_color: 0, start_color: 0, end_color: 0,
        counter: 0, max_count: 0)
    
    var lineSegments:[(CGPoint, CGPoint)] = []
    
    func initData() {
        initData(self.frame.size.width, screenHeight: self.frame.size.height)
    }
    
    func initData(screenWidth: CGFloat, screenHeight: CGFloat) {
        print("initData")
        SCREEN_WIDTH = screenWidth
        SCREEN_HEIGHT = screenHeight
        InitCollisionLineSegments(screenWidth, screenHeight: screenHeight)
        particle.x = SCREEN_WIDTH / 2
        particle.y = SCREEN_HEIGHT / 2
        particle.state = PARTICLE_STATE_ALIVE
        self.start()
    }
    
    func InitCollisionLineSegments(screenWidth: CGFloat, screenHeight: CGFloat) {
//        let p1 = CGPointMake(screenWidth / 2, screenHeight / 2)
//        let p2 = CGPointMake(screenWidth / 2 + 100, screenHeight / 2 + 100)
//        let p3 = CGPointMake(screenWidth / 2 - 50, screenHeight / 2 + 100)
//        let l1 = (p1, p2)
//        let l2 = (p2, p3)
//        let l3 = (p3, p1)
//        lineSegments.append(l1);
//        lineSegments.append(l2);
//        lineSegments.append(l3);
        
        let p0 = CGPointMake(0, 0)
        let p1 = CGPointMake(screenWidth, 0)
        let p2 = CGPointMake(screenWidth, screenHeight)
        let p3 = CGPointMake(0, screenHeight)
        let l0 = (p0, p1)
        let l1 = (p1, p2)
        let l2 = (p2, p3)
        let l3 = (p3, p0)
        lineSegments.append(l0);
        lineSegments.append(l1);
        lineSegments.append(l2);
        lineSegments.append(l3);
    }
    
    func start () {
        NSTimer.scheduledTimerWithTimeInterval(0.033, target: self, selector: "drawIt", userInfo: nil, repeats: true)
    }
    
    func drawIt() {
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        Process_Particles()
        Compute_Collisions()
        Draw_Particles()
    }
    
    func Draw_Particles() {
        // render the particle, perform world to screen transform
        let x = particle.x;
        let y = particle.y;
        
        // test for clip
        if (x >= SCREEN_WIDTH || x < 0 || y >= SCREEN_HEIGHT || y < 0) {
            return;
        }
        
        DrawMainBall(x, y)
    }
    
    func DrawMainBall(x: CGFloat, _ y: CGFloat) {
        Draw_Ball_2D(x, y, BALL_RADIUS, UIColor(red: 0x99/0xff, green: 0xD9/0xff, blue: 0xEA/0xff, alpha: 1))
    }
    
    func Draw_Ball_2D(x: CGFloat, _ y: CGFloat, _ radius: CGFloat, _ ballColor: UIColor) {
        let context = UIGraphicsGetCurrentContext()
        CGContextAddArc(context, x , y, radius, 0, CGFloat(M_PI * 2.0), 0)
        ballColor.setFill()
        CGContextFillPath(context)
    }
    
    func Process_Particles() {
        // this function moves and animates all particles
        
        // test if this particle is alive
        // translate particle
        //particles[index].x += particles[index].xv;
        //particles[index].y += particles[index].yv;
        
        //                if (particle.y >= SCREEN_HEIGHT) {
        //                    particle.state = PARTICLE_STATE_DEAD;
        //                }
        
        // update velocity based on gravity and wind
        particle.xv += particle_wind;
        particle.yv += particle_gravity;
    }
    
    func Compute_Collisions() {
        // this function computes if any ball has hit one of the edges of the polygon
        // if so the ball is bounced
        
        var length, s, t, s1x, s1y, s2x, s2y, p0x, p0y, p1x, p1y, p2x, p2y, p3x, p3y, npx, npy, Nx, Ny, Fx, Fy: CGFloat;
        
        
//            if (particles[index].state == PARTICLE_STATE_DEAD) {
//                continue;
//            }
        
            
            // first move particle
            //particles[index].varsF[INDEX_X] += balls[index].varsF[INDEX_XV];
            //particles[index].varsF[INDEX_Y] += balls[index].varsF[INDEX_YV];
            //particles[index].x += particles[index].xv;
            //particles[index].y += particles[index].yv;
            
            
            // now project velocity vector forward and test for intersection with all lines of polygon shape
            
            // build up vector in direction of trajectory
            //p0x = balls[index].varsF[INDEX_X];
            //p0y = balls[index].varsF[INDEX_Y];
            p0x = particle.x;
            p0y = particle.y;
            
            //p1x = balls[index].varsF[INDEX_X] + balls[index].varsF[INDEX_XV];
            //p1y = balls[index].varsF[INDEX_Y] + balls[index].varsF[INDEX_YV];
            p1x = particle.x + particle.xv;
            p1y = particle.y + particle.yv;
            
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
                    Nx = -(particle.xv * npx + particle.yv * npy) * npx;
                    Ny = -(particle.xv * npx + particle.yv * npy) * npy;
                    
                    // compute F = 2*N + I
                    //Fx = 2 * Nx + balls[index].varsF[INDEX_XV];
                    //Fy = 2 * Ny + balls[index].varsF[INDEX_YV];
                    Fx = 2 * Nx + particle.xv;
                    Fy = 2 * Ny + particle.yv;
                    
                    // update velocity with results
                    //balls[index].varsF[INDEX_XV] = Fx;
                    //balls[index].varsF[INDEX_YV] = Fy;
                    particle.xv = Fx * 2 / 5;
                    particle.yv = Fy * 2 / 5;
                    
                    //balls[index].varsF[INDEX_X] += balls[index].varsF[INDEX_XV];
                    //balls[index].varsF[INDEX_Y] += balls[index].varsF[INDEX_YV];
                    particle.x += particle.xv;
                    particle.y += particle.yv;
                    
                    // break out of for line
                    break;
                    
                } // end if
                
            } // end for line
            if (!collisionHappen) {
                particle.x += particle.xv;
                particle.y += particle.yv;
            }
            
        
    }

}
