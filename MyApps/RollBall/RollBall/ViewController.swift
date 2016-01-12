//
//  ViewController.swift
//  RollBall
//
//  Created by aa64mac on 12/27/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rollBallView = (self.view as! RollBallView)
        rollBallView.initData()
        motionManager.deviceMotionUpdateInterval = 0.05
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { (deviceManager, error) -> Void in
            let attitude = deviceManager?.attitude
            rollBallView.acceleration(attitude!.roll, attitude!.pitch)
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

