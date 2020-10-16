//
//  QuestionViewController.swift
//  Math Trainer
//
//  Created by Liang Swee on 10/9/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var typeOfQns: String?
    var minNumber: Int?
    var maxNumber: Int?
    var numberOfQuestions: Int? // For mix, it will be Number of addition questions
    var numberOfSubQuestions: Int?
    var numberOfMultiQuestions: Int?
    var numberOfDivQuestions: Int?
    var score = 0
    var totalQuestion = 0
    var currentOperator = ""
    
    var mathQuestions : MathQuestions?
    
    var firstNumber: [Int] {
        return NumberGenerator(highestNumber: maxNumber!, lowestNumber: minNumber!, numberOfQuestions: numberOfQuestions! ).generateNumbers()
    }
    var secNumber: [Int]{
        return NumberGenerator(highestNumber: maxNumber!, lowestNumber: minNumber!, numberOfQuestions: numberOfQuestions! ).generateNumbers()
    }
    
    let correctWrongView = CorrectWrongView(frame: UIScreen.main.bounds)
    
    
    
    @IBOutlet weak var fullView: UIStackView!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var previousQnLabel: UILabel!
    @IBOutlet weak var warningText: UILabel!
    @IBOutlet weak var AnswerEnteredLabel: UILabel!
    @IBOutlet weak var answerEnterView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        correctWrongView.alpha = 0
        previousQnLabel.text = ""
        warningText.alpha = 0
        print(typeOfQns as Any)
        print("[QuestionViewController] \(minNumber!)")
        print("[QuestionViewController] \(maxNumber!)")
        print("[QuestionViewController] \(numberOfQuestions!)")
        print("[QuestionViewController] \(numberOfSubQuestions ?? 1)")
        print("[QuestionViewController] \(numberOfMultiQuestions ?? 1)")
        print("[QuestionViewController] \(numberOfDivQuestions ?? 1)")
        
        mathQuestions = MathQuestions(firstNumbers: firstNumber, secNumbers: secNumber, mathOperator: typeOfQns!)
        print(mathQuestions!.firstNumber)
        self.answerView.layer.borderColor = UIColor.red.cgColor
        
        updateUI()

        
    }
    
    func updateUI(){
        questionNumberLabel.text = "Questions: \(mathQuestions!.currentQuestionNo + 1) / \(numberOfQuestions!)"
        scoreLabel.text = "Score: \(score)"
        switch typeOfQns {
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
        
        questionLabel.text = "\(mathQuestions!.firstNumber) \(currentOperator) \(mathQuestions!.secNumber) = ?"
    }

    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if (mathQuestions!.currentQuestionNo + 1 < numberOfQuestions!){
            let answer = AnswerEnteredLabel.text!
            var imageName = ""
            if(answer == ""){
                UIView.animate(withDuration: 0.5, delay: 0, options: []) {
                    self.warningText.alpha = 1
                    self.answerView.layer.borderWidth = 5
                    self.warningText.textColor = UIColor.red
                } completion: {_ in
                
                }
                
                return
            }
            
            if mathQuestions!.checkAnswer(answer) == true {
                score += 1
                fullView.layer.borderColor = UIColor.green.cgColor
                imageName = "correct"
            } else {
                fullView.layer.borderColor = UIColor.red.cgColor
                imageName = "wrong"
            }
            
            UIView.animate(withDuration: 0.2, delay: 0, options: []) {
                self.view.addSubview(self.correctWrongView)
                self.correctWrongView.alpha = 1
                self.correctWrongView.showImage(name: imageName)
                self.fullView.layer.borderWidth = 4
            } completion: {_ in
                UIView.animate(withDuration: 0.2, delay: 10, options: []) {
                    self.correctWrongView.alpha = 0
                    self.fullView.layer.borderWidth = 0
                    self.correctWrongView.removeFromSuperview()
                    self.correctWrongView.removeImage()
                }
            }
            
            AnswerEnteredLabel.text = ""
            previousQnLabel.text = "Previous Question : \(mathQuestions!.firstNumber) \(currentOperator) \(mathQuestions!.secNumber) = \(mathQuestions!.solutions[mathQuestions!.currentQuestionNo])"
            mathQuestions!.nextQuestion()
            updateUI()
        } else {
            print("End of Questions")
            print(firstNumber)
            print(secNumber)
            print(mathQuestions!.solutions)
        }
    }
    
    @IBAction func numberEntered(_ sender: UIButton) {
        self.warningText.alpha = 0
        self.answerView.layer.borderWidth = 0
        if sender.tag != 10 {
            AnswerEnteredLabel.text = AnswerEnteredLabel.text! + "\(sender.tag)"
        } else {
            if !AnswerEnteredLabel.text!.contains(".") {
                AnswerEnteredLabel.text = AnswerEnteredLabel.text! + "."
            }
        }
    }
    
    @IBAction func removeNum(_ sender: UIButton) {
        if AnswerEnteredLabel.text!.count != 0 {
            AnswerEnteredLabel.text = String(AnswerEnteredLabel.text!.prefix(AnswerEnteredLabel.text!.count - 1))
        }
    }
    
}
