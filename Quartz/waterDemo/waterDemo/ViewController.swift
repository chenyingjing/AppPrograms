//
//  ViewController.swift
//  waterDemo
//
//  Created by aa64mac on 11/23/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: MyView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        myView.initData(width, screenHeight: height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leftAction(sender: UIButton) {
        myView.windToLeft();
    }

    @IBAction func upAction(sender: UIButton) {
        myView.decreaseGravity();
    }
    
    @IBAction func downAction(sender: UIButton) {
        myView.increaseGravity()
    }
    
    @IBAction func rightAction(sender: UIButton) {
        myView.windToRight();
    }
    
    @IBAction func panAction(sender: UIPanGestureRecognizer) {
        //let point = sender.translationInView(self.myView)
        let point = sender.velocityInView(self.myView)
        print("point:\(point)")
        //self.myView.pan(Double(point.x), dy: Double(point.y))
        myView.changeWindAndGravity(point.x, y: point.y)
        sender.setTranslation(CGPointMake(0, 0), inView: self.myView)
    }
}

