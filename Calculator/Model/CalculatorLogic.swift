//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Anthony Campbell on 1/11/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (number1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(number2: n)
            default:
                intermediateCalculation = (number1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(number2: Double) -> Double? {
        
        if let number1 = intermediateCalculation?.number1,
            let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return number1 + number2
            case "-":
                return number1 - number2
            case "×":
                return number1 * number2
            case "÷":
                return number1 / number2
            default:
                fatalError("The operation passed in does not match any of thew cases")
            }
        }
        return nil
    }
}
