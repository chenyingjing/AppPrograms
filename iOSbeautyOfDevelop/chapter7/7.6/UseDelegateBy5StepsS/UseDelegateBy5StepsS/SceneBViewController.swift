//
//  SceneBViewController.swift
//  UseDelegateBy5StepsS
//
//  Created by aa64mac on 8/29/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

import UIKit

protocol SceneBViewControllerDelegate : NSObjectProtocol {
    func sceneBViewControllerDidInputed(string: String)
}

class SceneBViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputInformation: UITextField!
    
    weak var delegate: SceneBViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (self.delegate != nil) {
            self.delegate?.sceneBViewControllerDidInputed(self.inputInformation.text)
            self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        }
        textField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
