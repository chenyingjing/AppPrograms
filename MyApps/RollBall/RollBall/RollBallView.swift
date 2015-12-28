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
    
    func initData() {
        initData(self.frame.size.width, screenHeight: self.frame.size.height)
    }
    
    func initData(screenWidth: CGFloat, screenHeight: CGFloat) {
        print("initData")
        SCREEN_WIDTH = screenWidth
        SCREEN_HEIGHT = screenHeight
        //InitCollisionLineSegments(screenWidth, screenHeight: screenHeight)
        particle.x = SCREEN_WIDTH / 2
        particle.y = SCREEN_HEIGHT / 2
        particle.state = PARTICLE_STATE_ALIVE
        self.start()
    }
    
    func start () {
        NSTimer.scheduledTimerWithTimeInterval(0.033, target: self, selector: "drawIt", userInfo: nil, repeats: true)
    }
    
    func drawIt() {
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        Draw_Particles();
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
}
