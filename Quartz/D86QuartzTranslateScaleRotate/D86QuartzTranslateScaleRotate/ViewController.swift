//
//  ViewController.swift
//  D86QuartzTranslateScaleRotate
//
//  Created by aa64mac on 11/9/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: MyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leftButtonTouchUpInside(_ sender: UIButton) {
        self.myView.left()
    }

    @IBAction func upButtonTouchUpInside(_ sender: UIButton) {
        self.myView.up()
    }
    
    @IBAction func downButtonTouchUpInside(_ sender: UIButton) {
        self.myView.down()
    }
    
    @IBAction func rightButtonTouchUpInside(_ sender: UIButton) {
        self.myView.right()
    }
    
    @IBAction func clockWiseButtonTouchUpInside(_ sender: UIButton) {
        self.myView.clockWise()
    }
    
    @IBAction func anticlockButtonTouchUpInside(_ sender: UIButton) {
        self.myView.anticlockWise()
    }
    
    @IBAction func zoominButtonTouchUpInside(_ sender: UIButton) {
        self.myView.zoomin()
    }
    
    @IBAction func zoomoutButtonTouchUpInside(_ sender: UIButton) {
        self.myView.zoomout()
    }
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: self.myView)
        //print("point:\(point)")
        self.myView.pan(Double(point.x), dy: Double(point.y))
        sender.setTranslation(CGPoint(x: 0, y: 0), in: self.myView)
    }
    
    @IBAction func rotateAction(_ sender: UIRotationGestureRecognizer) {
        //print("rotation:\(sender.rotation)")
        self.myView.rotate(Double(sender.rotation))
        sender.rotation = 0;
    }
    
    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        print("scale:\(sender.scale)")
        self.myView.scale(Double(sender.scale))
        sender.scale = 1
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

