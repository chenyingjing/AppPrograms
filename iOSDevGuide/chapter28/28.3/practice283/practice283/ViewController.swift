//
//  ViewController.swift
//  practice283
//
//  Created by aa64mac on 12/22/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var acc_x: UILabel!
    @IBOutlet weak var acc_y: UILabel!
    @IBOutlet weak var acc_z: UILabel!
    
    @IBOutlet weak var gyro_x: UILabel!
    @IBOutlet weak var gyro_y: UILabel!
    @IBOutlet weak var gyro_z: UILabel!
    
    @IBOutlet weak var attitude_roll: UILabel!
    @IBOutlet weak var attitude_pitch: UILabel!
    @IBOutlet weak var attitude_yaw: UILabel!
    
    @IBOutlet weak var attitude_x: UILabel!
    @IBOutlet weak var attitude_y: UILabel!
    @IBOutlet weak var attitude_z: UILabel!
    @IBOutlet weak var attitude_w: UILabel!
    
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager.deviceMotionUpdateInterval = 0.05
        //motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue()) { (deviceManager, error) -> Void in
            
        //}
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { (deviceManager, error) -> Void in
            let accel = deviceManager?.userAcceleration
            self.acc_x.text = String(format: "%.2f", accel!.x)
            self.acc_y.text = String(format: "%.2f", accel!.y)
            self.acc_z.text = String(format: "%.2f", accel!.z)
            
            let gyro = deviceManager?.rotationRate
            self.gyro_x.text = String(format: "%.2f", gyro!.x)
            self.gyro_y.text = String(format: "%.2f", gyro!.y)
            self.gyro_z.text = String(format: "%.2f", gyro!.z)

            let attitude = deviceManager?.attitude
            self.attitude_roll.text = String(format: "%.2f", attitude!.roll)
            self.attitude_pitch.text = String(format: "%.2f", attitude!.pitch)
            self.attitude_yaw.text = String(format: "%.2f", attitude!.yaw)
            
            let quaternion = attitude?.quaternion
            self.attitude_x.text = String(format: "%.2f", quaternion!.x)
            self.attitude_y.text = String(format: "%.2f", quaternion!.y)
            self.attitude_z.text = String(format: "%.2f", quaternion!.z)
            self.attitude_w.text = String(format: "%.2f", quaternion!.w)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func shouldAutorotate() -> Bool {
        return false
    }
}

