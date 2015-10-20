//
//  ViewController.swift
//  Fibonacci
//
//  Created by aa64mac on 10/20/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theSlider: UISlider!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var selectedValueLabel: UILabel!
    
    var fibo: FibonacciModel = FibonacciModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderValueDidChange(sender: UISlider) {
        var returnedArray: [Int] = []
        var formattedOutput: String = ""
        
        self.selectedValueLabel!.text = String(Int(theSlider!.value))
        
        returnedArray = self.fibo.calculateFibonacciNumbers(minimum2: Int(theSlider!.value))
        for number in returnedArray {
            formattedOutput = formattedOutput + String(number) + ", "
        }
        
        self.outputTextView!.text = formattedOutput
    }

}

