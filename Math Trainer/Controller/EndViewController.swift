//
//  EndViewController.swift
//  Math Trainer
//
//  Created by Liang Swee on 16/10/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    
    var firstNumber = [Int]()
    var operators = [String]()
    var secondNumber = [Int]()
    var solutions = [Double]()
    var myAnswer = [String]()
    var lenOfQn: Int?
    var score: Int?
    var totalQn: Int?
    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lenOfQn = firstNumber.count
        print(firstNumber)
        print(operators)
        print(secondNumber)
        print(solutions)
        
        tv.register(UINib(nibName: K.myQuestionCellNibStr, bundle: nil), forCellReuseIdentifier: K.myQuestionCell)
        tv.register(UINib(nibName: K.resultCellNibStr, bundle: nil), forCellReuseIdentifier: K.resultCellCell)
    }
    
}

extension EndViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return firstNumber.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = tableView.dequeueReusableCell(withIdentifier: K.resultCellCell, for: indexPath) as! ResultTableViewCell
        let myQuestionCell = tableView.dequeueReusableCell(withIdentifier: K.myQuestionCell, for: indexPath) as! MyQuestionTableViewCell
        if indexPath.row == 0 {
            return resultCell
        }
        
        var currentOperator = ""
        switch operators[indexPath.row-1] {
        case "Addition":
            currentOperator = "+"
            break
        case "Subtraction":
            currentOperator = "-"
            break
        case "Multiplication":
            currentOperator = "×"
            break
        case "Division":
            currentOperator = "÷"
            break
        default:
            currentOperator = "+"
        }
        
       myQuestionCell.qnNoLabel.text = "\(indexPath.row)"
        myQuestionCell.equationLabel.text = "\(firstNumber[indexPath.row-1]) \(currentOperator) \(secondNumber[indexPath.row-1]) = \(solutions[indexPath.row-1])"
        myQuestionCell.userAnswerLabel.text = "\(myAnswer[indexPath.row-1])"
        
        return myQuestionCell
    }
    
    
}
