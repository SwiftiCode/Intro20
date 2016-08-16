//
//  SalesRecordTableViewController.swift
//  Intro20
//
//  Created by SwiftiCode on 16/8/16.
//  Copyright © 2016 SwiftiCode. All rights reserved.
//

import UIKit

class SalesRecordTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        loadSampleSales()
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
        
        return teamSalesData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SalesRecordCell", forIndexPath: indexPath)

        // Configure the cell...
        let mySales = teamSalesData[indexPath.row]
        
        cell.textLabel?.text = mySales.name

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            teamSalesData.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Edit" {
            // Get the new view controller using segue.destinationViewController.
            let editSalesDetailViewController = segue.destinationViewController as! EditSalesViewController
            
            // Pass the selected object to the new view controller.
            if let selectedCell = sender as? UITableViewCell {
                
                let selectedIndexPath = tableView.indexPathForCell(selectedCell)!
                let selectedSalesRecord = teamSalesData[selectedIndexPath.row]
                editSalesDetailViewController.currentSalesToEdit = selectedSalesRecord
                
            }
            
        }
    }
    
    
    @IBAction func editSalesViewControllerUnwindToSalesTable(segue: UIStoryboardSegue) {
        
        if let editSalesSourceViewController = segue.sourceViewController as? EditSalesViewController {
            
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            teamSalesData[selectedIndexPath.row] = editSalesSourceViewController.currentSalesToEdit!
            tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
        }
        
    }
    
    @IBAction func addSalesViewControllerUnwindToSalesTable(segue: UIStoryboardSegue) {
        
        if let addSalesSourceViewController = segue.sourceViewController as? AddSalesViewController {
            
            let newIndexPath = NSIndexPath(forRow: teamSalesData.count, inSection: 0)
            teamSalesData.append(addSalesSourceViewController.currentAddSalesRecord!)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            
        }
        
    }


}
