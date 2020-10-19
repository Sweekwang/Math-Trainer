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
    var lenOfQn: Int?
    var score: Int?
    var totalQn: Int?
    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lenOfQn = firstNumber.count
        print(lenOfQn)
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = tableView.dequeueReusableCell(withIdentifier: K.resultCellCell, for: indexPath) as! ResultTableViewCell
        let myQuestionCell = tableView.dequeueReusableCell(withIdentifier: K.myQuestionCell, for: indexPath) as! MyQuestionTableViewCell
        if indexPath.row == 0 {
            return resultCell
        }
        
        return myQuestionCell
    }
    
    
}
