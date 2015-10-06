//
//  ViewController.swift
//  CrashApp
//
//  Created by aa64mac on 10/6/15.
//  Copyright © 2015 cyj. All rights reserved.
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

    @IBAction func crashTouchUpInside(sender: AnyObject) {
        print("It will crash.")
        let z = 0
        let x = devideFunc(z)
        print(x)
    }
    
    func devideFunc(z: Int)->Int {
        return 1/z
    }

}

