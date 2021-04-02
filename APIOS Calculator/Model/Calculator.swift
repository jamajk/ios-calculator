//
//  Calculator.swift
//  APIOS Calculator
//
//  Created by Jakub Majkowski on 01/04/2021.
//

import Foundation

class Calculator {
    static func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    static func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    static func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    
    static func divide(lhs: Double, rhs: Double) -> Double? {
        if rhs == 0 {
            return nil
        }
        return lhs / rhs
    }
}
