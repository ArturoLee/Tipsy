//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var split = 2
    var perPersonAmount = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsDouble = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsDouble / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        split = Int(sender.value)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let billAmount = Double(billTextField.text!) {
            let totalAmount = billAmount * (1.0+tip)
            let result = totalAmount / Double(split)
            perPersonAmount = String(format: "%.2f", result)
        }
        performSegue(withIdentifier: "toResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResults" {
            let destination = segue.destination as! ResultsViewController
            destination.numberOfPeople = split
            destination.totalPerPerson = perPersonAmount
            destination.tipPercentage = "\(Int(tip*100.0))%"
        }
    }
    
}

