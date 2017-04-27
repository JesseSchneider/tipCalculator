//
//  ViewController.swift
//  TipCalculator01
//
//  Created by Jesse S on 4/26/17.
//  Copyright © 2017 Jesse Schneider. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        subtotalTextfield.becomeFirstResponder()
        createToolBar()
        tipPercentSlider.isEnabled = false
    }

    // MARK: - Outlets
    @IBOutlet weak var subtotalTextfield: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    // MARK: - Properties
    let model = Model()
    
    // MARK: - Interactions
    @IBAction func dragSlider(_ sender: UISlider) {
        tipPercentLabel.text = "Tip (\(Int(sender.value))%):"
        print("\(Int(sender.value))")
        
        model.tipPercentFromSlide = Int(sender.value)
        updateLabels()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tipPercentSlider.isEnabled = false
    }
    
    
    // MARK: - Functions
    
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        
        // create barButtonItems
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        
        // Done button defaults to left side. Adding this to the array put the done button on the right side where we want it.
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: self,
                                            action: nil)
        
        // add items to toolBar
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        
        // add toolbar to keyboard
        subtotalTextfield.inputAccessoryView = toolBar
    }
    
    func dismissKeyboard() {
        subtotalTextfield.resignFirstResponder()
        tipPercentSlider.isEnabled = true
        
        if subtotalTextfield.text?.characters.count == 0 {
            subtotalTextfield.text = "$0.00"
            model.subtotalFromTextField = "0.00"
            updateLabels()
        } else {
            model.subtotalFromTextField = subtotalTextfield.text!
            model.tipPercentFromSlide = Int(tipPercentSlider.value)
            
            //update labels
            updateLabels()
        }
    }
    
    func updateLabels() {
        subtotalTextfield.text = model.subtotalAsCurrency
        tipAmountLabel.text = model.tipAmountAsCurrency
        totalAmountLabel.text = model.totalAmountAsCurrency
    }
}


















































