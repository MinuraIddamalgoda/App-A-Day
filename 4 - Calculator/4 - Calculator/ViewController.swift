//
//  ViewController.swift
//  4 - Calculator
//
//  Created by Minura Iddamalgoda on 14/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    var runningNumber = ""
    var currentOperation = Operation.Empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    // MARK: - Outlets
    @IBOutlet weak var answerLabel: UILabel!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    enum Operation: String {
        case Divide = "/"
        case Add = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Empty = "Empty"
    }
    
    func processOperation(operation: Operation) {
        if currentOperation != Operation.Empty  {
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                switch currentOperation {
                case .Multiply:
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                    break
                case .Divide:
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                    break
                case .Add:
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                    break
                case .Subtract:
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                    break
                default:
                    print("default")
                    break
                }
                
                leftValStr = result
                answerLabel.text = result
            }
            
            currentOperation = operation
        } else {
            // The first time an operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    // MARK: - Actions
    @IBAction func numberPressed(_ sender: UIButton) {
        runningNumber += "\(sender.tag)"
        answerLabel.text = runningNumber
    }
    
    @IBAction func onDivide(sender: AnyObject) {
        processOperation(operation: Operation.Divide)
    }
    
    @IBAction func onAdd(sender: AnyObject) {
        processOperation(operation: Operation.Add)
    }
    
    @IBAction func onMultiply(sender: AnyObject) {
        processOperation(operation: Operation.Multiply)
    }
    
    @IBAction func onSubtract(sender: AnyObject) {
        processOperation(operation: Operation.Subtract)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(operation: currentOperation)
    }
    
}

