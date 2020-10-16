//
//  NumberGenerator.swift
//  Math Trainer
//
//  Created by Liang Swee on 19/9/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import Foundation

struct NumberGenerator {
    let highestNumber: Int
    let lowestNumber: Int
    let numberOfQuestions: Int
    
    func generateNumbers() -> [Int]{
        var arrayOfNumbers = [Int]()

        for _ in 1...numberOfQuestions{

            let randomNumber = Int.random(in: lowestNumber ..< highestNumber)

            arrayOfNumbers.append(randomNumber)
            
        }
        return arrayOfNumbers
    }
    

}
