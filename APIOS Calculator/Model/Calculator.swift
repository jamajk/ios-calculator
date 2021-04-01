//
//  Calculator.swift
//  APIOS Calculator
//
//  Created by Jakub Majkowski on 01/04/2021.
//

import Foundation

class Calculator {
    static func add(lhs: Float, rhs: Float) -> Float {
        return lhs + rhs
    }
    
    static func subtract(lhs: Float, rhs: Float) -> Float {
        return lhs - rhs
    }
    
    static func multiply(lhs: Float, rhs: Float) -> Float {
        return lhs * rhs
    }
    
    static func divide(lhs: Float, rhs: Float) -> Float? {
        if rhs == 0 {
            return nil
        }
        return lhs / rhs
    }
}
