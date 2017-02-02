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

let BALL_RADIUS: CGFloat = 5;

let MAX_PARTICLES = 256

struct ParticleInitStatus {
    var ang: Int
    var vel: Int
}

let PARTICLEINITCOUNT = 10;

var particleInitStatus:[ParticleInitStatus] = [ParticleInitStatus](repeating: ParticleInitStatus(ang: 0, vel: 0), count: PARTICLEINITCOUNT)


class MyView: UIView {
    
    var KEYDOWN_RIGHT = false;
    var KEYDOWN_LEFT = false;
    var KEYDOWN_DOWN = false;
    var KEYDOWN_UP = false;
    
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
    
    var particles = [PARTICLE](repeating: MyView.PARTICLE(
        state: PARTICLE_STATE_DEAD,
        type: PARTICLE_TYPE_FADE,
        x: 0, y: 0,
        xv: 0, yv: 0,
        curr_color: 0, start_color: 0, end_color: 0,
        counter: 0, max_count: 0), count: MAX_PARTICLES) // the particles for the particle engine
    
    
    
    var lineSegments:[(CGPoint, CGPoint)] = []
    
    override func draw(_ rect: CGRect) {
        
        // test for wind force
        if (KEYDOWN_RIGHT) {
            if particle_wind < 2 {particle_wind += 0.01}
        } // end if
        else if (KEYDOWN_LEFT) {
            if particle_wind > -2 {particle_wind -= 0.01}
        } // end if
        
        // test for gravity force
        if (KEYDOWN_DOWN) {
            if particle_gravity < 5 {particle_gravity += 0.01}
        } // end if
        else if (KEYDOWN_UP) {
            if particle_gravity > -5 {particle_gravity -= 0.01}
        } // end if
        
        DrawCollisionObject()
        Process_Particles()
        Compute_Collisions()
        InitparticleStatus()
        Start_Particle_Water(50,
            x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT / 4,
            xv: 0, yv: 0, num_particles: PARTICLEINITCOUNT);
        
        Draw_Particles();
    }
    
    func drawLine() {
        let context: CGContext! = UIGraphicsGetCurrentContext()
        context.saveGState()
        
        context.setLineWidth(20)
        context.setLineCap(CGLineCap.round)
        
        context.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)
        context.move(to: CGPoint(x: 10, y: 10))
        context.addLine(to: CGPoint(x: 100, y: 100))
        context.strokePath()
        context.restoreGState()
        
        UIColor.blue.set()
        
        context.setLineJoin(CGLineJoin.round)
        context.move(to: CGPoint(x: 100, y: 120))
        context.addLine(to: CGPoint(x: 150, y: 120))
        context.addLine(to: CGPoint(x: 150, y: 180))
        context.strokePath()
    }
    
    func start () {
        Timer.scheduledTimer(timeInterval: 0.033, target: self, selector: #selector(MyView.drawIt), userInfo: nil, repeats: true)
    }
    
    func drawIt() {
        //x++
        //print("drawIt\(x)")
        //print(x)
        
        
        self.setNeedsDisplay()
    }
    
    func DrawCollisionObject() {
        let context: CGContext! = UIGraphicsGetCurrentContext()
        for l in lineSegments {
            context.move(to: CGPoint(x: l.0.x, y: l.0.y))
            context.addLine(to: CGPoint(x: l.1.x, y: l.1.y))
            context.strokePath()
        }
    }
    
    func initData(_ screenWidth: CGFloat, screenHeight: CGFloat) {
        print("initData")
        SCREEN_WIDTH = screenWidth
        SCREEN_HEIGHT = screenHeight
        InitCollisionLineSegments(screenWidth, screenHeight: screenHeight)
        
        self.start()
    }
    
    func InitCollisionLineSegments(_ screenWidth: CGFloat, screenHeight: CGFloat) {
        let p1 = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        let p2 = CGPoint(x: screenWidth / 2 + 100, y: screenHeight / 2 + 100)
        let p3 = CGPoint(x: screenWidth / 2 - 50, y: screenHeight / 2 + 100)
        let l1 = (p1, p2)
        let l2 = (p2, p3)
        let l3 = (p3, p1)
        lineSegments.append(l1);
        lineSegments.append(l2);
        lineSegments.append(l3);
    }
    
    func Start_Particle_Water(_ count: Int,
        x: CGFloat, y: CGFloat, xv: CGFloat, yv: CGFloat, num_particles: Int) {
        var num_particles = num_particles
            // this function starts a particle explosion at the given position and velocity
            
            var ang = 0;
            
            // compute random trajectory velocity
            var vel = 0;
        
        num_particles -= 1;
            while (num_particles >= 0) {
                // compute random trajectory angle
                ang = particleInitStatus[num_particles].ang;
                
                // compute random trajectory velocity
                vel = particleInitStatus[num_particles].vel;
                
                Start_Particle(PARTICLE_TYPE_FADE, color: PARTICLE_COLOR_BLUE, count: count,
                    x: (x + CGFloat(RAND_RANGE(-4, y: 4))), y: (y + CGFloat(RAND_RANGE(-4, y: 4))),
                    xv: xv + CGFloat(cos(Double(ang)) * Double(vel)), yv: yv + CGFloat(sin(Double(ang)) * Double(vel)));
                num_particles -= 1;
            } // end while
            
    }
    
    func Process_Particles() {
        // this function moves and animates all particles
        
        for index in 0 ..< MAX_PARTICLES {
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
                    particles[index].counter += 1;
                    if (particles[index].counter >= particles[index].max_count) {
                        // kill the particle
                        particles[index].state = PARTICLE_STATE_DEAD;
                        
                    } // end if
                    
                } // end if
                else {
                    // must be a fade, be careful!
                    // test if it's time to update color
                    particles[index].counter += 1;
                    if (particles[index].counter >= particles[index].max_count) {
                        // reset counter
                        particles[index].counter = 0;
                        
                        // update color
                        particles[index].curr_color += 1;
                        if (particles[index].curr_color > particles[index].end_color) {
                            // transition is complete, terminate particle
                            particles[index].state = PARTICLE_STATE_DEAD;
                            
                        } // end if
                        
                    } // end if
                    
                } // end else
                
            } // end if
            
        } // end for index
        
    } // end Process_Particles
    
    func RAND_RANGE(_ x: Int, y: Int) ->Int {
        let r = random()
        return ((x) + (r % ((y) - (x) + 1)))
    }
    
    func random() -> Int {
        return Int(arc4random());
    }
    
    func Compute_Collisions() {
        // this function computes if any ball has hit one of the edges of the polygon
        // if so the ball is bounced
        
        var length, s, t, s1x, s1y, s2x, s2y, p0x, p0y, p1x, p1y, p2x, p2y, p3x, p3y, npx, npy, Nx, Ny, Fx, Fy: CGFloat;
        
        
        for index in 0 ..< MAX_PARTICLES {
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
            for line in 0 ..< len {
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
    
    func InitparticleStatus() {
        for i in 0 ..< PARTICLEINITCOUNT {
            particleInitStatus[i] = ParticleInitStatus(ang: random() % 360, vel: 2 + random() % 4)//{ ang: Math.random() * 1000 % 360, vel: 2 + Math.random() * 1000 % 4 };
        }
    }
    
    func Start_Particle(_ type: Int, color: Int, count: Int, x: CGFloat, y: CGFloat, xv: CGFloat, yv: CGFloat) {
        // this function starts a single particle
        
        var pindex = -1; // index of particle
        
        // first find open particle
        //var index = 0;
        //for (; index < MAX_PARTICLES; index += 1) {
        for index in 0 ..< MAX_PARTICLES {
            if (particles[index].state == PARTICLE_STATE_DEAD) {
                // set index
                pindex = index;
                break;
            } // end if
        }
        
        // did we find one
        if (pindex == -1) {
            return;
        }
        
        // set general state info
        particles[pindex].state = PARTICLE_STATE_ALIVE;
        particles[pindex].type = type;
        particles[pindex].x = x;
        particles[pindex].y = y;
        particles[pindex].xv = xv;
        particles[pindex].yv = yv;
        particles[pindex].counter = 0;
        particles[pindex].max_count = count;
        
        // set color ranges, always the same
        switch (color) {
        case PARTICLE_COLOR_RED:
            particles[pindex].start_color = COLOR_RED_START;
            particles[pindex].end_color = COLOR_RED_END;
            
        case PARTICLE_COLOR_GREEN:
            particles[pindex].start_color = COLOR_GREEN_START;
            particles[pindex].end_color = COLOR_GREEN_END;
            
        case PARTICLE_COLOR_BLUE:
            particles[pindex].start_color = COLOR_BLUE_START;
            particles[pindex].end_color = COLOR_BLUE_END;
            
        case PARTICLE_COLOR_WHITE:
            particles[pindex].start_color = COLOR_WHITE_START;
            particles[pindex].end_color = COLOR_WHITE_END;
            
        default:
            break;
            
        } // end switch
        
        // what type of particle is being requested
        if (type == PARTICLE_TYPE_FLICKER) {
            // set current color
            particles[pindex].curr_color = RAND_RANGE(particles[pindex].start_color, y: particles[pindex].end_color);
            
        } // end if
        else {
            // particle is fade type
            // set current color
            particles[pindex].curr_color = particles[pindex].start_color;
        } // end if
        
    } // end Start_Particle
    
    func Draw_Particles() {
        // this function draws all the particles
        
        for index in 0 ..< MAX_PARTICLES {
            // test if particle is alive
            if (particles[index].state == PARTICLE_STATE_ALIVE) {
                // render the particle, perform world to screen transform
                let x = particles[index].x;
                let y = particles[index].y;
                
                // test for clip
                if (x >= SCREEN_WIDTH || x < 0 || y >= SCREEN_HEIGHT || y < 0) {
                    continue;
                }
                
                // draw the pixel
                //Draw_Pixel(x, y, particles[index].curr_color, back_buffer, back_lpitch);
                //Draw_Ball_2D(x, y, BALL_RADIUS, particles[index].curr_color, back_buffer, back_lpitch);
                
                
                let context = UIGraphicsGetCurrentContext()
                
                context!.addArc(center: CGPoint(x: x, y: y), radius: BALL_RADIUS, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: false)
                UIColor(red: 0x99/0xff, green: 0xD9/0xff, blue: 0xEA/0xff, alpha: 1).setFill()
                context!.fillPath()
                
            } // end if
            
        } // end for index
        
    } // end Draw_Particles
    
    func windToLeft() {
        if (particle_wind > -2) {
            particle_wind -= 0.01
        }
    }
    
    func windToRight() {
        if (particle_wind < 2) {
            particle_wind += 0.01
        }
    }
    
    func increaseGravity() {
        if (particle_gravity < 5) {
            particle_gravity += 0.01
        }
    }

    func decreaseGravity() {
        if (particle_gravity > -5) {
            particle_gravity -= 0.01
        }
    }
    
    func changeWindAndGravity(_ x: CGFloat, y: CGFloat) {
        if (-2 < particle_wind || particle_wind < 2) {
            particle_wind += x / 100000
        }
        if (-5 < particle_gravity || particle_gravity < 5) {
            particle_gravity += y / 100000
        }
    }
}
