//
//  Model.swift
//  TipCalculator01
//
//  Created by Jesse S on 4/26/17.
//  Copyright © 2017 Jesse Schneider. All rights reserved.
//

import Foundation


class Model  {

    // Basic Logic
    // 1. take input
    // 2. calculate new values
    // 3. return as strings for labels
    
    // Logic
    // accept subtotal as string
    // accept tipPercent as Int
    
    // convert subtotal to NSDecimal for calculation
    // convert tipPercent to NSDecimal for calculation
    
    // calculate tipAmount
    // calculate totalAmount
    
    // convert subtotal to Currency
    // convert tipAmount to Currency
    // convert totalAmount to Currency
    
    var subtotalFromTextField = "0.00"
    var tipPercentFromSlide = 20
    
    // MARK: - Decimals for calculations
    var subtotalAsDecimal: NSDecimalNumber {
        return NSDecimalNumber(string: subtotalFromTextField)
    }
    var tipPercent: NSDecimalNumber {
        return NSDecimalNumber(value: Double(tipPercentFromSlide)/100)
    }

    // subtotal * tipPercent = tipAmount
    var tipAmount: NSDecimalNumber {
        return subtotalAsDecimal.multiplying(by: tipPercent)
    }
    
    // subtotal + tipAmount = totalAmount
    var totalAmount: NSDecimalNumber {
        return subtotalAsDecimal.adding(tipAmount)
    }
    
    // MARK: - Convert to Currency
    let formatter = NumberFormatter()
    var subtotalAsCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: subtotalAsDecimal as NSNumber)!
    }
    
    var tipAmountAsCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: tipAmount as NSNumber)!
    }
    
    var totalAmountAsCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: totalAmount as NSNumber)!
    }
}
