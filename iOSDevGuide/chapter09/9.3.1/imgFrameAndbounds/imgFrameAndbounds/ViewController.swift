//
//  ViewController.swift
//  imgFrameAndbounds
//
//  Created by aa64mac on 10/21/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let image1 = UIImage(named: "img1.png")
        let imageView1 = UIImageView(image: image1)
        let imageView2 = UIImageView(image: image1)
        imageView1.frame = CGRectMake(10, 10, 320, 460)
        imageView2.frame = CGRectMake(60, 10, 160, 320)
        print("frame\(imageView1.frame)")
        print("bounds\(imageView1.bounds)")
        //imageView1.bounds = CGRectMake(100, 100, 160, 320)
        //imageView1.bounds = CGRectMake(0, 0, 160, 320)
        imageView1.bounds = CGRectMake(50, 0, 100, 460)
        print("frame\(imageView1.frame)")
        print("bounds\(imageView1.bounds)")
        
        imageView1.addSubview(imageView2)
        self.view.addSubview(imageView1)
        //imageView1.image =
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

