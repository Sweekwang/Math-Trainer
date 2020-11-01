//
//  EndViewController.swift
//  Math Trainer
//
//  Created by Liang Swee on 16/10/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import UIKit
import GoogleMobileAds
import StoreKit

class EndViewController: UIViewController {
    
    var firstNumber = [Int]()
    var operators = [String]()
    var secondNumber = [Int]()
    var solutions = [Double]()
    var myAnswer = [String]()
    var userAnswerCW = [Bool]()
    var lenOfQn: Int?
    var score: Int?
    var totalQn: Int?
    @IBOutlet weak var tv: UITableView!
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var bannerView: GADBannerView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImg.layer.cornerRadius = 10
        backbtn.layer.cornerRadius = 10
        lenOfQn = firstNumber.count
        print(firstNumber)
        print(operators)
        print(secondNumber)
        print(solutions)
        
        tv.register(UINib(nibName: K.myQuestionCellNibStr, bundle: nil), forCellReuseIdentifier: K.myQuestionCell)
        tv.register(UINib(nibName: K.resultCellNibStr, bundle: nil), forCellReuseIdentifier: K.resultCellCell)
        
        
        bannerView.adUnitID = K.googleAppBannerID
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        rating()
    }
    
    private func rating(){
        SKStoreReviewController.requestReview()
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
            resultCell.setLayout(score: score!, totalQn: lenOfQn!)
            resultCell.startAnimation(to: Double(score!)/Double(lenOfQn!))
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
        
        if userAnswerCW[indexPath.row - 1] {
            myQuestionCell.userBG.backgroundColor = UIColor(named: "Correct")
        } else {
            myQuestionCell.userBG.backgroundColor = UIColor(named: "Wrong")
        }
        
        return myQuestionCell
    }
    
    
}
