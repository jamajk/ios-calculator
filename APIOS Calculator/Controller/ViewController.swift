//
//  ViewController.swift
//  APIOS Calculator
//
//  Created by Jakub Majkowski on 01/04/2021.
//

import UIKit

enum Action {
    case Add
    case Subtract
    case Multiply
    case Divide
}

class ViewController: UIViewController {
    
    var calcAction: Action?
    
    @IBOutlet private weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.layer.cornerRadius = 10
    }
    
    private func addDigit(digit: Int) {
        if resultLabel.text != "0" {
            resultLabel.text? += String(digit)
        } else {
            resultLabel.text = String(digit)
        }
    }
    
    private func setAction(symbol: Character) {
        if resultLabel.text != "0" {
            switch symbol {
            case "+":
                calcAction = .Add
            case "−":
                calcAction = .Subtract
            case "×":
                calcAction = .Multiply
            case "/":
                calcAction = .Divide
            default:
                return
            }
            resultLabel.text? += String(symbol)
        }
    }

    @IBAction func clearPressed(_ sender: Any) {
        resultLabel.text = "0"
    }
    
    @IBAction func btn0(_ sender: Any) {
        addDigit(digit: 0)
    }
    
    @IBAction func btn1(_ sender: Any) {
        addDigit(digit: 1)
    }
    
    @IBAction func btn2(_ sender: Any) {
        addDigit(digit: 2)
    }
    
    @IBAction func btn3(_ sender: Any) {
        addDigit(digit: 3)
    }
    
    @IBAction func btn4(_ sender: Any) {
        addDigit(digit: 4)
    }
    
    @IBAction func btn5(_ sender: Any) {
        addDigit(digit: 5)
    }
    
    @IBAction func btn6(_ sender: Any) {
        addDigit(digit: 6)
    }
    
    @IBAction func btn7(_ sender: Any) {
        addDigit(digit: 7)
    }
    
    @IBAction func btn8(_ sender: Any) {
        addDigit(digit: 8)
    }
    
    @IBAction func btn9(_ sender: Any) {
        addDigit(digit: 9)
    }
    
    @IBAction func btnPlus(_ sender: Any) {
        setAction(symbol: "+")
    }
    
    @IBAction func btnMinus(_ sender: Any) {
        setAction(symbol: "−")
    }
    
    @IBAction func btnTimes(_ sender: Any) {
        setAction(symbol: "×")
    }
    
    @IBAction func btnSlash(_ sender: Any) {
        setAction(symbol: "/")
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        guard let nums = resultLabel.text?.components(separatedBy: CharacterSet.symbols) else { return }
        
        let left = nums[0]
        let right = nums[1]
        switch calcAction {
        case .Add:
            resultLabel.text = String(Calculator.add(lhs: Float(left)!, rhs: Float(right)!))
        case .Subtract:
            resultLabel.text = String(Calculator.subtract(lhs: Float(left)!, rhs: Float(right)!))
        case .Multiply:
            resultLabel.text = String(Calculator.multiply(lhs: Float(left)!, rhs: Float(right)!))
        case .Divide:
            resultLabel.text = String(Calculator.divide(lhs: Float(left)!, rhs: Float(right)!)!)
        default:
            return
        }
        
        
    }
}

