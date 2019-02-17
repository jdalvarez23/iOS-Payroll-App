//
//  DetailsViewController.swift
//  Payroll Calculator
//
//  Created by student19 on 2/9/19.
//  Copyright © 2019 Jose Alvarez. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var statementIndex: Int = 0 // statement index
    
    // initialize storyboard components
    @IBOutlet weak var statementFullName: UILabel!
    @IBOutlet weak var statementDate: UILabel!
    @IBOutlet weak var statementGrossAmount: UILabel!
    @IBOutlet weak var statementPayRateAmount: UILabel!
    @IBOutlet weak var statementHoursAmount: UILabel!
    @IBOutlet weak var statementPayPeriod: UILabel!
    @IBOutlet weak var statementFederalDeductions: UILabel!
    @IBOutlet weak var statementStateDeductions: UILabel!
    @IBOutlet weak var statementNetAmount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("Statement Index is: ", statementIndex)
        
        updateViewDetails(index: statementIndex) // call method that updates labels in view controller
    }
    
    // method that updates labels in view controller
    func updateViewDetails(index: Int) {
        
        let statement = statementArray[index]
        
        let payPeriod: String // initialize pay period
        
        // exexute if period integer value is 2
        if (statement.payPeriod == 2) {
            payPeriod = "Weekly"
        } else {
            payPeriod = "Bi-Weekly"
        }
        
        // set text label values
        statementFullName?.text = "\(statement.firstName) \(statement.lastName)"
        statementDate?.text = statement.dateCreated
        statementGrossAmount?.text = "$" + String(format: "%.2f", statement.calculateGrossEarnings())
        statementPayRateAmount?.text = "$" + String(format: "%.2f", statement.hourlyWage)
        statementHoursAmount?.text = String(format: "%.2f", statement.hoursWorked)
        statementPayPeriod?.text = payPeriod
        statementFederalDeductions?.text = "-$" + String(format: "%.2f", statement.getFederalDeduction())
        statementStateDeductions?.text = "-$" + String(format: "%.2f", statement.getStateDeduction())
        statementNetAmount?.text = "$" + String(format: "%.2f", statement.calculateNetEarnings())
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
