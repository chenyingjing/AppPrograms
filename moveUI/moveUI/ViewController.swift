//
//  ViewController.swift
//  moveUI
//
//  Created by aa64mac on 12/14/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")

        UIView.animateWithDuration(0.5) { () -> Void in
            self.view.bounds.origin.y += 100
        }
        
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        UIView.animateWithDuration(0.5) { () -> Void in
            self.view.bounds.origin.y = 0
        }
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func tapTheView(sender: UITapGestureRecognizer) {
        print("tapTheView")
        textField1.resignFirstResponder()
    }
    
}

