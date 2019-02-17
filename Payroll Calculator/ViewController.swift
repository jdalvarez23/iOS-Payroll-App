//
//  ViewController.swift
//  Payroll Calculator
//
//  Created by student19 on 2/7/19.
//  Copyright © 2019 Jose Alvarez. All rights reserved.
//

import UIKit

var statementArray: [Employee] = [] // initialize statement array

class ViewController: UIViewController {
    
    // var statementList = ["Milk", "Honey", "Bread", "Tacos", "Tomatoes"]
    
    // initialize storyboard components
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var hourlyWageLabel: UITextField!
    @IBOutlet weak var hoursWorkedLabel: UITextField!
    @IBOutlet weak var periodSegment: UISegmentedControl!
    @IBOutlet weak var federalTaxRateLabel: UITextField!
    @IBOutlet weak var stateTaxRateLabel: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Statement Count When Entering Form:", statementArray.count)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // method that retrieves the current date and time
    func getCurrentDate() -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: date)
        
    }
    
    @IBAction func submitFormButtonPressed(_ sender: Any) {
        
        // retrieve values from form components
        let firstName: String = firstNameLabel.text ?? ""
        let lastName: String = lastNameLabel.text ?? ""
        let hourlyWageValue: String = hourlyWageLabel.text ?? ""
        let hourlyWage = Double(hourlyWageValue) ?? 0
        let hoursWorkedValue: String = hoursWorkedLabel.text ?? ""
        let hoursWorked = Double(hoursWorkedValue) ?? 0
        let period = periodSegment.titleForSegment(at: periodSegment.selectedSegmentIndex) ?? ""
        let federalTaxRateValue: String = federalTaxRateLabel.text ?? ""
        let federalTaxRate = Double(federalTaxRateValue) ?? 0
        let stateTaxRateValue: String = stateTaxRateLabel.text ?? ""
        let stateTaxRate = Double(stateTaxRateValue) ?? 0
        
        // retrieve the current date
        let dateCreated = getCurrentDate()
        
        
        print(firstName, lastName, hourlyWage, hoursWorked, period, federalTaxRate, stateTaxRate, dateCreated)
        
        let employeeInstance = Employee(firstName: firstName, lastName: lastName, payPeriod: period, hourlyWage: hourlyWage, hoursWorked: hoursWorked, federalTaxRate: federalTaxRate, stateTaxRate: stateTaxRate, dateCreated: dateCreated)
        
        // print(employeeInstance.calculateGrossEarnings())
        
        // print(employeeInstance.getFederalDeduction())
        
        // print(employeeInstance.getStateDeduction())
        
        statementArray.append(employeeInstance) // append employee instance to array
        
        print("STATEMENT OBJECTS:", statementArray.count)
        
        self.navigationController?.popToRootViewController(animated: true) // method that returns to initial view controller
    }
    
}

