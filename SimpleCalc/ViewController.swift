//
//  ViewController.swift
//  SimpleCalc
//
//  Created by harikanth on 12/8/16.
//  Copyright © 2016 Code Bramha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
   private var userInMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton){
        let digit = sender.currentTitle!
        if userInMiddleOfTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userInMiddleOfTyping = true
    }
    
    //calculated property for display field
    private var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
        
    }
   
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userInMiddleOfTyping{
            brain.setOperand(operand: displayValue)
            userInMiddleOfTyping = false
        }
   
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
                    }
        displayValue = brain.result
    }
}

