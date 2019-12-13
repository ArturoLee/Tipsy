//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Arturo Lee on 12/12/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var numberOfPeople = 2
    var tipPercentage = "10%"
    var totalPerPerson = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalPerPerson
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
