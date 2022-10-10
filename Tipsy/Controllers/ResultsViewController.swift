//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Temirlan Bekkozha on 09.10.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String = "0.0"
    var tip: Int = 0
    var split: Int = 2
    
    var finalText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result
        finalText = "Split between \(split) people, with \(tip)% tip."
        
        settingsLabel.text = finalText
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
