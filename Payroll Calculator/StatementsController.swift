//
//  StatementsController.swift
//  Payroll Calculator
//
//  Created by student19 on 2/16/19.
//  Copyright © 2019 Jose Alvarez. All rights reserved.
//

import UIKit

class StatementsController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button isn the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // execute if there is a row selected
        if let selectionIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectionIndexPath, animated: animated) // clear the selection
        }
        
        print("Statement count:", statementArray.count)
        
    }

    // MARK: - Table view data source

    // method that returns the number of sections for the table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections, which would be 1 in this case
        return 1
    }

    // method that returns the number of rows the table view should display
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // execute if section index is 0 (section exists)
        if (section == 0) {
            return statementArray.count
        // execute if section does not exist
        } else {
            return 0
        }
    }

    // method that inserts cells into the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statementCell", for: indexPath)

        // Configure the cell...
        
        let statement = statementArray[indexPath.row] // initialize and set value to statement object

        cell.textLabel?.text = "Statement #\(indexPath.row + 1)" // set left text label to first name and last name
        
        cell.detailTextLabel?.text = statement.dateCreated + " - $" + String(format: "%.2f", statement.calculateNetEarnings()) // set right text label to date statement was created
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    // method that passes data between table view controller to detals view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "detailsViewController") {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let destinationViewController = segue.destination as! DetailsViewController
                
                destinationViewController.statementIndex = indexPath.row
                
                print("Data to be passed:", destinationViewController.statementIndex)
                
            }
            
        }
        
    }
    

}
