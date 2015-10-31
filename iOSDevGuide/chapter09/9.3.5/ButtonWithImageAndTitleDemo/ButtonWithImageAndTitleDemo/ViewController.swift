//
//  ViewController.swift
//  ButtonWithImageAndTitleDemo
//
//  Created by aa64mac on 10/31/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.set(image: UIImage(named: "shout"), title: "Shout", titlePosition: .Top, additionalSpacing: 30.0, state: .Normal)
        thirdButton.set(image: UIImage(named: "shout"), title: "This is an XIB button", titlePosition: .Bottom, additionalSpacing: 6.0, state: .Normal)
        
        let secondButton = UIButton(type: .System)
        secondButton.frame = CGRectMake(0, 50, 100, 400)
        secondButton.center = CGPointMake(view.frame.size.width/2, 50)
        secondButton.set(image: UIImage(named: "settings"), title: "Settings", titlePosition: .Left, additionalSpacing: 0.0, state: .Normal)
        view.addSubview(secondButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

