//
//  ViewController.swift
//  TableViewInViewControllerS
//
//  Created by aa64mac on 9/3/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var radioListArray = ["CRI怀旧金曲", "CRI轻松调频", "CRI新闻广播", "CRI劲歌FM88.7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return radioListArray.count;
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = radioListArray[indexPath.row]
        return cell
    }

}

