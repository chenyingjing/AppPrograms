//
//  AViewController.swift
//  showTheDataInOhterViewControllerS
//
//  Created by aa64mac on 8/29/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    @IBOutlet weak var labelA: UILabel!
    
    @IBOutlet weak var textFieldA: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var bViewController: BViewController? = segue.destinationViewController as? BViewController
        if (bViewController != nil) {
            bViewController?.dataFromA = self.textFieldA.text
        }
    }
    


    @IBAction func unwind(segue: UIStoryboardSegue) {
        NSLog("unwind");
        var bViewController: BViewController? = segue.sourceViewController as? BViewController
        if (bViewController != nil) {
            self.labelA.text = bViewController?.textFieldB.text
        }
    }
    
}
