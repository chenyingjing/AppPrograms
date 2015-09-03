//
//  RadioTableViewController.swift
//  TableView1S
//
//  Created by aa64mac on 8/30/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

import UIKit

class RadioTableViewController: UITableViewController {

    var radioListArray: [String]?
    var radioImages: [String]?
    var radioEnglishArray: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var path = NSBundle.mainBundle().pathForResource("radioData", ofType: "plist")

        var dict = NSDictionary(contentsOfFile: path!)
        
        self.radioListArray = dict?["mainTitle"] as? [String]
        self.radioEnglishArray = dict?["subTitle"] as? [String]
        self.radioImages = dict?["logoImage"] as? [String]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.radioListArray?.count ?? 0
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RADIO_LIST_CELL", forIndexPath: indexPath) as! RadioTableViewCell
        
        cell.logoImageView.image = UIImage(named: self.radioImages![indexPath.row])
        cell.mainTitleLabel.text = self.radioListArray![indexPath.row]
        cell.subTitleLabel.text = self.radioEnglishArray![indexPath.row]
        
        return cell
    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath)
        if (cell?.accessoryType == UITableViewCellAccessoryType.Checkmark) {
            cell?.accessoryType = UITableViewCellAccessoryType.None
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var radioName = self.radioListArray?[indexPath.row]
        var alertMsg = String(format: "你选择了：%@", radioName!)
        var messageAlert = UIAlertView(title: "选择某行后的提示框",
            message: alertMsg, delegate: nil, cancelButtonTitle: "确定")
        messageAlert.show()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
        self.radioListArray?.removeAtIndex(indexPath.row)
        self.radioEnglishArray?.removeAtIndex(indexPath.row)
        self.radioImages?.removeAtIndex(indexPath.row)
        
        var dict: NSMutableDictionary = NSMutableDictionary()
        dict.setObject(self.radioListArray!, forKey: "mainTitle")
        dict.setObject(self.radioEnglishArray!, forKey: "subTitle")
        dict.setObject(self.radioImages!, forKey: "logoImage")
        
        //var path = NSBundle.mainBundle().pathForResource("radioData", ofType: "plist")
        
        var docDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
        var path = String(format: "%@/radioData.plist", docDir)
        dict.writeToFile(path, atomically: true)
        tableView.reloadData()
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
