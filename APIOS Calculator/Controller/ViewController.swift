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
        resultLabel.layer.masksToBounds = true
    }
    
    private func addDigit(digit: Int) {
        if resultLabel.text != "0" {
            if resultLabel.text?.last == ")" {
                resultLabel.text = (resultLabel.text?.dropLast())! + String(digit) + ")"
            } else {
                resultLabel.text? += String(digit)
            }
        } else {
            resultLabel.text = String(digit)
        }
    }
    
    private func setAction(symbol: Character) {
        if resultLabel.text != "0", calcAction == nil, resultLabel.text?.last != "." {
            switch symbol {
            case "+":
                calcAction = .Add
            case "−":
                calcAction = .Subtract
            case "×":
                calcAction = .Multiply
            case "÷":
                calcAction = .Divide
            default:
                return
            }
            resultLabel.text? += String(symbol)
        }
    }
    
    private func getAction() -> String? {
        if calcAction != nil {
            var symbol: String!
            switch calcAction {
            case .Add:
                symbol = "+"
            case .Subtract:
                symbol = "−"
            case .Multiply:
                symbol = "×"
            case .Divide:
                symbol = "÷"
            default:
                return nil
            }
            return symbol
        }
        return nil
    }

    @IBAction func clearPressed(_ sender: Any) {
        resultLabel.text = "0"
        calcAction = nil
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
        setAction(symbol: "÷")
    }
    
    @IBAction func btnNegative(_ sender: Any) {
        if calcAction == nil {
            if let num = resultLabel.text, num != "0" {
                if num.first == "-" {
                    resultLabel.text = String(num.dropFirst())
                } else {
                    resultLabel.text = "-" + num
                }
            }
            
        } else {
            
            if let nums = resultLabel.text?.components(separatedBy: CharacterSet.symbols), let action = getAction() {
                resultLabel.text = nums[0] + action + "(-\(nums[1])"
                if nums[1].first == "(" {
                    resultLabel.text = nums[0] + action + String(nums[1].dropFirst(2).dropLast())
                } else {
                    resultLabel.text = nums[0] + action + "(-\(nums[1]))"
                }
                
            }
            
        }
    }
    
    @IBAction func btnPercent(_ sender: Any) {
        if calcAction == nil {
            if let num = resultLabel.text {
                resultLabel.text = String(Calculator.getPercentage(num: Double(num)!))
            }
        }
    }
    
    
    @IBAction func addDecimalPoint(_ sender: Any) {
        if calcAction == nil {
            if resultLabel.text!.contains(".") {
                return
            } else {
                resultLabel.text? += String(".")
            }
        } else {
            let num = resultLabel.text?.components(separatedBy: CharacterSet.symbols)[1]
            if num!.contains(".") {
                return
            } else {
                resultLabel.text? += String(".")
            }
        }
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        guard let nums = resultLabel.text?.components(separatedBy: CharacterSet.symbols) else { return }
        guard nums.count == 2, nums[0] != "", nums[1] != "" else { return }
        
        let left = nums[0]
        var right = nums[1]
        if right.first == "(" {
            right = String(right.dropFirst())
            right = String(right.dropLast())
        }
        switch calcAction {
        case .Add:
            let result = Calculator.add(lhs: Double(left)!, rhs: Double(right)!)
            if result.truncatingRemainder(dividingBy: 1.0).isZero {
                resultLabel.text = String(Int(result))
            } else {
                resultLabel.text = String(result)
            }
        case .Subtract:
            let result = Calculator.subtract(lhs: Double(left)!, rhs: Double(right)!)
            if result.truncatingRemainder(dividingBy: 1.0).isZero {
                resultLabel.text = String(Int(result))
            } else {
                resultLabel.text = String(result)
            }
        case .Multiply:
            let result = Calculator.multiply(lhs: Double(left)!, rhs: Double(right)!)
            if result.truncatingRemainder(dividingBy: 1.0).isZero {
                resultLabel.text = String(Int(result))
            } else {
                resultLabel.text = String(result)
            }
        case .Divide:
            guard let result = Calculator.divide(lhs: Double(left)!, rhs: Double(right)!) else { return }
            if result.truncatingRemainder(dividingBy: 1.0).isZero {
                resultLabel.text = String(Int(result))
            } else {
                resultLabel.text = String(result)
            }
        default:
            return
        }
        calcAction = nil
        
    }
}

