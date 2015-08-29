//
//  SceneAViewController.swift
//  UseDelegateBy5StepsS
//
//  Created by aa64mac on 8/29/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

import UIKit

class SceneAViewController: UIViewController, SceneBViewControllerDelegate {

    
    @IBOutlet weak var showInformation: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sceneBViewControllerDidInputed(string: String) {
        self.showInformation.text = string
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "Segue_ID_AB") {
            var sceneBVC = segue.destinationViewController as! SceneBViewController
            sceneBVC.delegate = self
            
        }
    }


}
