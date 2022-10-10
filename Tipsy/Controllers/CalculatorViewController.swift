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
    @IBOutlet weak var splitNumberLable: UILabel!
    
    var tip = 0.10
    var total = 0.0
    var people = 2
    var final = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let pressedBtnLabel = sender.currentTitle!.dropLast()
        
        let selectedTip = Double(pressedBtnLabel)!
        
        tip = selectedTip/100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLable.text = String(format: "%.0f", sender.value)
        
        people = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let enteredBill = Double(billTextField.text ?? "0") ?? 0.0
        
        total = (enteredBill * (1+tip)) / Double(people)
        final = String(format: "%.2f", total)
        print(final)
        
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tip = Int(tip * 100)
            destinationVC.result = final
            destinationVC.split = people
        }
        
    }
    
}

