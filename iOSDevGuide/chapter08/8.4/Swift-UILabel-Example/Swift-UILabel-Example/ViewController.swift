//
//  ViewController.swift
//  Swift-UILabel-Example
//
//  Created by aa64mac on 10/18/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myLabel: UILabel = UILabel()
        myLabel.frame = CGRectMake(0, 0, 300, 100)
        myLabel.layer.position = CGPoint(x: self.view.bounds.width / 2, y: 200)
        print("position:\(myLabel.layer.position)")
        myLabel.backgroundColor = UIColor.redColor()
        myLabel.text = "Hello!"
        myLabel.font = UIFont.systemFontOfSize(40)
        myLabel.textColor = UIColor.whiteColor()
        myLabel.shadowColor = UIColor.blueColor()
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        self.view.addSubview(myLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

