//
//  ViewController.swift
//  Calculator Swift
//
//  Created by Yedige Ashirbek on 30.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    private var isFinishedTyping: Bool = true
    private var numberOfDots: Int = 0
    private var answer: Double = 0.0
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Error converting string to the double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private var calculatorSymbols = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTyping = true
        numberOfDots = 0
        calculatorSymbols.setNumber(num: Double(displayValue), ans: answer)
        
        if let calcMethod = sender.currentTitle {
            
            if calculatorSymbols.calculate(symbol: calcMethod) != (nil, nil, nil) {
                let result = calculatorSymbols.calculate(symbol: calcMethod)
                displayLabel.text = String(result.displayNumber!)
                clearButton.setTitle(result.clearButtonText, for: .normal)
                answer = result.displayAnswer!
            }
            
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        clearButton.setTitle("C", for: .normal)
        if let number = sender.currentTitle {
            if number == "." {
                if numberOfDots == 0 {
                    numberOfDots += 1
                    if let currentNumber = displayLabel.text {
                        displayLabel.text? = currentNumber + number
                        isFinishedTyping = false
                    }
                }
            }
            else {
                if isFinishedTyping == true {
                    displayLabel.text = number
                    isFinishedTyping = false
                } else {
                    if let currentNumber = displayLabel.text {
                        if currentNumber == "0" {
                            displayLabel.text = number
                        } else {
                            displayLabel.text? = currentNumber + number
                        }
                    }
                }
            }
        }
    }
}

