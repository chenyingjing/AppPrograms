//
//  ViewController.swift
//  stepper
//
//  Created by aa64mac on 10/21/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let stepper = UIStepper()
        stepper.minimumValue = 2
        stepper.maximumValue = 5
        stepper.stepValue = 2
        stepper.value = 3
        stepper.center = CGPointMake(160, 240)
        stepper.addTarget(self, action: "valueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(stepper)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func valueChanged(sender: UIStepper) {
        print(sender.value)
    }
}

