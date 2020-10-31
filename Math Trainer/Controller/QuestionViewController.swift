//
//  QuestionViewController.swift
//  Math Trainer
//
//  Created by Liang Swee on 10/9/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import UIKit
import GoogleMobileAds

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
    var myAnswer = [String]()
    var solution = [Bool]()
    
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
    @IBOutlet weak var bannerView: GADBannerView!
    
    
    
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var fourBtn: UIButton!
    @IBOutlet weak var fiveBtn: UIButton!
    @IBOutlet weak var sixBtn: UIButton!
    @IBOutlet weak var sevenBtn: UIButton!
    @IBOutlet weak var eightBtn: UIButton!
    @IBOutlet weak var nineBtn: UIButton!
    @IBOutlet weak var zerobtn: UIButton!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var chnageBtn: UIButton!
    @IBOutlet weak var dotBtn: UIButton!
    
    
    
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
        
        
        setUpRoundBtn()
        
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }
    
    func setUpRoundBtn() {
        let btnViews = [oneBtn, twoBtn, threeBtn, fourBtn, fiveBtn, sixBtn, sevenBtn, eightBtn, nineBtn, zerobtn, submit]
        for btnView in btnViews{
            
            if (view.frame.height) <= 736.0 {
                btnView?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            }
            btnView!.layer.cornerRadius = (view.frame.height / 25)
            btnView!.layer.shadowColor = UIColor.black.cgColor
            btnView!.layer.shadowOpacity = 0.5
            btnView!.layer.shadowRadius = 2
            btnView!.layer.shadowOffset = CGSize(width: 0.2, height: 3)
        }
        if (view.frame.height) <= 736.0 {
            submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        }
        
        let smallBtns = [dotBtn, chnageBtn]
        for btnView in smallBtns{
            
            if (view.frame.height) <= 736.0 {
                btnView?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            }
            
            btnView!.layer.cornerRadius = (view.frame.height / 35)
            btnView!.layer.shadowColor = UIColor.black.cgColor
            btnView!.layer.shadowOpacity = 0.5
            btnView!.layer.shadowRadius = 2
            btnView!.layer.shadowOffset = CGSize(width: 0, height: 3)
        }
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
        if (mathQuestions!.currentQuestionNo + 1 <= numberOfQuestions!){
            let answer = AnswerEnteredLabel.text!
            var imageName = ""
            
            if mathQuestions!.checkAnswer(answer) == true {
                score += 1
                fullView.layer.borderColor = UIColor.green.cgColor
                imageName = "correct"
                solution.append(true)
            } else {
                fullView.layer.borderColor = UIColor.red.cgColor
                imageName = "wrong"
                solution.append(false)
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
            
            myAnswer.append(AnswerEnteredLabel.text!)
            AnswerEnteredLabel.text = ""
            previousQnLabel.text = "Previous Question : \(mathQuestions!.firstNumber) \(currentOperator) \(mathQuestions!.secNumber) = \(mathQuestions!.solutions[mathQuestions!.currentQuestionNo])"
            mathQuestions!.nextQuestion()
            if (mathQuestions!.currentQuestionNo != numberOfQuestions!){
                updateUI()
            }
        }
        
        if (mathQuestions!.currentQuestionNo == numberOfQuestions!){
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
            vc.myAnswer = myAnswer
            vc.userAnswerCW = solution
        }
    }
    
    @IBAction func numberEntered(_ sender: UIButton) {
        self.warningText.alpha = 0
        self.answerView.layer.borderWidth = 0
        if sender.tag == 13 {
            if (AnswerEnteredLabel.text! == "") {
                return
            }
            
            if Double(AnswerEnteredLabel.text!)! > 0 {
                AnswerEnteredLabel.text = "-\(AnswerEnteredLabel.text!)"
            } else if Double(AnswerEnteredLabel.text!)! == 0 {
                
            } else {
                AnswerEnteredLabel.text = String(AnswerEnteredLabel.text!.dropFirst())
            }
            
        } else if sender.tag != 10 {
            AnswerEnteredLabel.text = AnswerEnteredLabel.text! + "\(sender.tag)"
        } else {
            if !AnswerEnteredLabel.text!.contains(".") {
                AnswerEnteredLabel.text = AnswerEnteredLabel.text! + "."
            }
        }
    }
    
    @IBAction func btnDown(_ sender: UIButton) {
        sender.backgroundColor = UIColor(named: "btnColor:Hover")
        
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.1, options: []) {
            sender.backgroundColor = UIColor(named: "btnColor")
        } completion: { _ in}
        
    }
    
    @IBAction func btnOutSide(_ sender: UIButton) {
        
    }
    
    @IBAction func removeNum(_ sender: UIButton) {
        if AnswerEnteredLabel.text!.count != 0 {
            AnswerEnteredLabel.text = String(AnswerEnteredLabel.text!.prefix(AnswerEnteredLabel.text!.count - 1))
        }
    }
    
}
