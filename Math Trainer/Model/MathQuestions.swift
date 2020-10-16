//
//  CheckSolution.swift
//  Math Trainer
//
//  Created by Liang Swee on 19/9/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import Foundation

struct MathQuestions {
    let firstNumbers : [Int]
    let secNumbers : [Int]
    let mathOperator : String
    
    var currentQuestionNo = 0
    var firstNumber: Int {
        return firstNumbers[currentQuestionNo]
        
    }
    var secNumber: Int {
        return secNumbers[currentQuestionNo]
    }

    var solutions : [Double] {
        var answers = [Double]()
        for i in 0...(firstNumbers.count - 1){
            switch mathOperator {
            case "Addition":
                answers.append(Double(firstNumbers[i] + secNumbers[i]))
                break
            case "Subtraction":
                answers.append(Double(firstNumbers[i] - secNumbers[i]))
                break
            case "Multiplication":
                answers.append(Double(firstNumbers[i] * secNumbers[i]))
                break
            case "Division":
                let value1 = Double(firstNumbers[i])
                let value2 = Double(secNumbers[i])
                let answer: Double = (value1 / value2 * 100).rounded() / 100
                answers.append(answer)
                break
            default:
                answers.append(Double(firstNumbers[i] / secNumbers[i]))
            }
 
        }
        return answers
    }
    
    mutating func nextQuestion(){
        currentQuestionNo += 1
    }
    
    
    func checkAnswer(_ userAnswer: String) -> Bool{
        print(solutions)
        print(Double(firstNumbers[0]) / Double(secNumbers[0]))
        print(solutions[currentQuestionNo])
        let userAnswer = Double(userAnswer)
        if Double(solutions[currentQuestionNo]) == userAnswer! {
            return true
        }
        
        return false
    }
}

