//
//  ViewController.swift
//  RollBall
//
//  Created by aa64mac on 12/27/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as! RollBallView).initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

