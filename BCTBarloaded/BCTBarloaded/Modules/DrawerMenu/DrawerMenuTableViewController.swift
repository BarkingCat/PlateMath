//
//  DrawerMenuTableViewController.swift
//  BCTBarloaded
//
//  Created by Rakesh B SablePatil on 12/05/16.
//  Copyright © 2016 CSNS. All rights reserved.
//

import UIKit

class DrawerMenuTableViewController: UITableViewController {
    var TableArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        TableArray = ["Calculator","Settings","Reference","About"]
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        if self.tableView.respondsToSelector(Selector("setSeparatorInset:")) {
            
            self.tableView.separatorInset = UIEdgeInsetsZero;
        }
        if self.tableView.respondsToSelector(Selector("layoutMargins")) {
            
            self.tableView.layoutMargins = UIEdgeInsetsZero;
        }
        self.tableView.tableFooterView = UIView();
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "Menu"
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TableArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...
        let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell", forIndexPath: indexPath)
                
        cell.textLabel?.text = TableArray[indexPath.row]
        
        //cell.backgroundColor = UIColor(red: 1.0/255.0, green: 69.0/255.0, blue: 149.0/255.0, alpha: 1.0)
        cell.backgroundColor = UIColor.darkGrayColor();
        cell.tintColor = UIColor.whiteColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont.systemFontOfSize(12.0)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        //selectedCell.contentView.backgroundColor = UIColor(red: 1.0/255.0, green: 16.0/255.0, blue: 149.0/255.0, alpha: 1.0)
        selectedCell.contentView.backgroundColor = UIColor.darkGrayColor();
        
        switch( indexPath.row ) {
        case 0:
            let pushToViewController = CalculatorViewController(nibName: "CalculatorViewController", bundle: nil);
            Utility.loadDrawerScreen(self, pushToViewController: pushToViewController)
            break;
        case 1:
            let pushToViewController = SettingsViewController(nibName: "SettingsViewController", bundle: nil);
            Utility.loadDrawerScreen(self, pushToViewController: pushToViewController)
            break;
        case 2:
            let pushToViewController = DashboardViewController(nibName: "DashboardViewController", bundle: nil);
            Utility.loadDrawerScreen(self, pushToViewController: pushToViewController)
            break;
        case 3:
            let pushToViewController = DisclaimerViewController(nibName: "DisclaimerViewController", bundle: nil);
            Utility.loadDrawerScreen(self, pushToViewController: pushToViewController)
            break;
        default: break;
        }
    }
    
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cellToDeSelect:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        //cellToDeSelect.contentView.backgroundColor = UIColor(red: 1.0/255.0, green: 69.0/255.0, blue: 149.0/255.0, alpha: 1.0)
        cellToDeSelect.contentView.backgroundColor = UIColor.darkGrayColor()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
