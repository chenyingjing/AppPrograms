//
//  ViewController.swift
//  LTBouncyPlaceholder
//
//  Created by aa64mac on 10/11/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        if (textView.text == "") {
            textViewDidEndEditing(textView)
        }
        let tapDismiss = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(tapDismiss)
    }

    func dismissKeyboard() {
        textView.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textViewDidEndEditing(textView: UITextView) {
        if (textView.text == "") {
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGrayColor()
        }
        textView.resignFirstResponder()
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if (textView.text == "Placeholder") {
            textView.text = ""
            textView.textColor = UIColor.blackColor()
        }
        textView.becomeFirstResponder()
    }

}

