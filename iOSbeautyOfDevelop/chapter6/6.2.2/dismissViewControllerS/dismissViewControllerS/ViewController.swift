//
//  ViewController.swift
//  dismissViewControllerS
//
//  Created by aa64mac on 8/26/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dismissButtonTouchUpInside(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            NSLog("OK")
        })
    }

}

