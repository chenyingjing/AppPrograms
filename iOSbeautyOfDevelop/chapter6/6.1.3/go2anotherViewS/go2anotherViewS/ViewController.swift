//
//  ViewController.swift
//  go2anotherViewS
//
//  Created by aa64mac on 8/25/15.
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

    @IBAction func buttonTouchUpInside(sender: AnyObject) {
        var dest = (self.storyboard!.instantiateViewControllerWithIdentifier("SceneB")) as! SceneBViewController
        dest.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        dest.modalPresentationStyle = UIModalPresentationStyle.FormSheet
        self.presentViewController(dest, animated: true, completion: nil)
    }

}

