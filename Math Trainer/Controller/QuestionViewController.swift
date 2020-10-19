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
    
    var firstNumber: [Int]?
    var secNumber: [Int]?
    var operators: [String]?
    
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
        DispatchQueue.global(qos: .background).async { [self] in
            numberOfQuestions = self.setUpNumberofQn()
            firstNumber = self.setupNumbers()
            secNumber = self.setupNumbers()
            operators = self.setupOperators()

            DispatchQueue.main.async {
                mathQuestions = MathQuestions(firstNumbers: firstNumber!, secNumbers: secNumber!, mathOperator: operators!)
                updateUI()
            }
        }
        
    
        correctWrongView.alpha = 0
        previousQnLabel.text = ""
        warningText.alpha = 0
        self.answerView.layer.borderColor = UIColor.red.cgColor
        
    }
    
    func setupOperators() -> [String]{
        var operators = [String]()
        if (typeOfQns == "Addition"){
            for _ in 0..<numberOfQuestions! {
                operators.append("Addition")
            }
        } else if (typeOfQns == "Subtraction"){
            for _ in 0..<numberOfQuestions! {
                operators.append("Subtraction")
            }
        } else if (typeOfQns == "Multiplication") {
            for _ in 0..<numberOfQuestions! {
                operators.append("Multiplication")
            }
        } else if (typeOfQns == "Division") {
            for _ in 0..<numberOfQuestions! {
                operators.append("Division")
            }
        } else {
            for _ in 0..<numberOfQuestions! {
                operators.append("Addition")
            }
            for _ in 0..<numberOfSubQuestions! {
                operators.append("Subtraction")
            }
            for _ in 0..<numberOfMultiQuestions! {
                operators.append("Multiplication")
            }
            for _ in 0..<numberOfDivQuestions! {
                operators.append("Division")
            }
        }
        
        return operators.shuffled()
    }
    
    func setUpNumberofQn() -> Int{
        var numberOfQns = numberOfQuestions!
        
        if typeOfQns == "Mixed" {
            numberOfQns = numberOfQuestions! + numberOfSubQuestions! + numberOfMultiQuestions! + numberOfDivQuestions!
        }
        
        return numberOfQns
        
    }
    
    func setupNumbers() -> [Int]{
        
        let number = NumberGenerator(highestNumber: maxNumber!, lowestNumber: minNumber!, numberOfQuestions: numberOfQuestions!)
        
        return number.generateNumbers()
    }
    
    func updateUI(){
        questionNumberLabel.text = "Questions: \(mathQuestions!.currentQuestionNo + 1) / \(numberOfQuestions!)"
        scoreLabel.text = "Score: \(score)"
        
        switch operators![mathQuestions!.currentQuestionNo] {
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
            performSegue(withIdentifier: K.segueEndIdentifier, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == K.segueEndIdentifier) {
            let vc = segue.destination as! EndViewController
            vc.firstNumber = firstNumber!
            vc.secondNumber = secNumber!
            vc.operators = operators!
            vc.solutions = mathQuestions!.solutions
            vc.score = score
            vc.lenOfQn = numberOfQuestions
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
