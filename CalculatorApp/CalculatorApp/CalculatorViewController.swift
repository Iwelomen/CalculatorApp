//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Decagon on 3/6/22.
//

import UIKit

 // Mark: Create enum for the operation (1)

enum Operation: String {
    case Add = "+"
    case Subtract = "-"
    case Multiply = "*"
    case Divide = "/"
    case Percent = "%"
    case NULL = "Null"
}

class CalculatorViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
     // Declear some variable (2)
    
    var runnungNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        outputLabel.text = "0"
    }

    @IBAction func numberPressed(_ sender: RoundButton) {
        if runnungNumber.count <= 8 {
            runnungNumber += "\(sender.tag)"
        outputLabel.text = runnungNumber
        }
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runnungNumber.count <= 7 {
            runnungNumber += "."
            outputLabel.text = runnungNumber
        }
    }
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    @IBAction func plusminusPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    @IBAction func percentPressed(_ sender: RoundButton) {
        operation(operation: .Percent)
    }
    @IBAction func allclearPressed(_ sender: RoundButton) {
        
        runnungNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLabel.text = "0"
    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL {
            if runnungNumber != "" {
                rightValue = runnungNumber
                runnungNumber = ""
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                    
                } else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                    
                }else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                    
                } else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                    
                } else if currentOperation == .Percent {
                    result = "\(Double(leftValue)! / 100)"
                }
                    
                leftValue = result
                outputLabel.text = result
                            
            }
            currentOperation = operation
            
        } else {
            leftValue = runnungNumber
            runnungNumber = ""
            currentOperation = operation
        }
    }
    
}

