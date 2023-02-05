//
//  CalculatorLogic.swift
//  Calculator Swift
//
//  Created by Yedige Ashirbek on 01.02.2023.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var answer: Double?
    private var lastSymbol: String?
    
    mutating func setNumber(num number: Double, ans answer: Double){
        self.number = number
        self.answer = answer
    }
    
    mutating func calculate(symbol: String) -> (displayNumber: Double?, displayAnswer: Double?, clearButtonText: String?) {
        
        if let n = number, let a = answer {
//            print(symbol, answer, n)
            if symbol == "+/-" {
                return (n * -1, a, "C")
            }
            else if symbol == "%" {
                return (n / 100, a, "C")
            }
            else if symbol == "C" {
                return (0, a, "AC")
            }
            else if symbol == "AC" {
                return (0, 0, "AC")
            }
            else if symbol == "=" {
                return performTwoNumCalculation(n, a)
            }
            else {
                lastSymbol = symbol
                return (n, n, "C")
            }
        }
        return (nil, nil, nil)
    }
    
    private func performTwoNumCalculation(_ n: Double, _ a: Double) -> (displayNumber: Double?, displayAnswer: Double?, clearButtonText: String?) {
        if lastSymbol == "/" {
            return (a / n, a / n, "C")
        }
        if lastSymbol == "x" {
            return (a * n, a * n, "C")
        }
        if lastSymbol == "-" {
            return (a - n, a - n, "C")
        }
        if lastSymbol == "+" {
            return (a + n, a + n, "C")
        }
        return (nil, nil, nil)
    }
    
}
