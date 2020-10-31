//
//  SettingViewController.swift
//  Math Trainer
//
//  Created by Liang Swee on 7/9/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SettingViewController: UIViewController {
    
    var selectedTopic = ""
    // =============== Setting to be pass over to next segue =================
    var minimumNumberTextField: UITextField?
    var maximumNumberTextField: UITextField?
    var numberOfQuestionsTextField: UITextField? // addition for mixed
    var numberOfSubQuestionsTextField: UITextField?
    var numberOfMultiQuestionsTextField: UITextField?
    var numberOfDivQuestionsTextField: UITextField?
    // =======================================================================
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startBgView: UIImageView!
    
    @IBOutlet weak var settingTableView: UITableView!
    @IBOutlet var tabGesture: UITapGestureRecognizer!
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("[SettingViewController] Topic Selected: " + selectedTopic)
        startButton.layer.cornerRadius = 10
        startBgView.layer.cornerRadius = 10
        settingTableView.register(UINib(nibName: K.numberSettingNibStr, bundle: nil), forCellReuseIdentifier: K.numberSettingCell)
        tabGesture.addTarget(self, action: #selector(tapped))
        
        // ========================================================
           bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
           bannerView.rootViewController = self
           bannerView.load(GADRequest())
    }
    
    @objc func tapped(){
        view.endEditing(true)
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.segueQuestionIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == K.segueQuestionIdentifier){
            let vc = segue.destination as! QuestionViewController
            vc.typeOfQns = selectedTopic
            vc.minNumber = Int((minimumNumberTextField!.text != "" ? minimumNumberTextField!.text : "2")!)
            vc.maxNumber = Int((maximumNumberTextField!.text != "" ? maximumNumberTextField!.text : "12")!)
            if numberOfQuestionsTextField!.text != "" {
                vc.numberOfQuestions = Int(numberOfQuestionsTextField!.text!)
            } else {
                if selectedTopic == "Mixed"{
                    vc.numberOfQuestions = 5
                } else {
                    vc.numberOfQuestions = 10
                }
            }
            
            if(numberOfSubQuestionsTextField != nil){
                vc.numberOfSubQuestions = Int((numberOfSubQuestionsTextField!.text != "" ? numberOfSubQuestionsTextField!.text : "5")!)
                vc.numberOfMultiQuestions = Int((numberOfMultiQuestionsTextField!.text != "" ? numberOfMultiQuestionsTextField!.text : "5")!)
                vc.numberOfDivQuestions = Int((numberOfDivQuestionsTextField!.text != "" ? numberOfDivQuestionsTextField!.text : "5")!)
            }
        }
    }
    

}

extension SettingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (selectedTopic == "Mixed"){
            return 6
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.numberSettingCell, for: indexPath) as! NumberTableViewCell
        tableView.rowHeight = 80
        
        if (indexPath.row == 0){
            cell.infoTextLabel?.text = "Minimum Number :"
            minimumNumberTextField = cell.numberTextField
        } else if (indexPath.row == 1) {
            cell.infoTextLabel?.text = "Maximum Number :"
            maximumNumberTextField = cell.numberTextField
        } else if (indexPath.row == 2) {
            if (selectedTopic != "Mixed"){
                cell.infoTextLabel?.text = "Number of Questions :"
            } else {
                cell.infoTextLabel?.text = "Number of Questions for Addition :"
            }
            numberOfQuestionsTextField = cell.numberTextField
        } else if (indexPath.row == 3) {
            cell.infoTextLabel?.text = "Number of Questions for Subtraction :"
            numberOfSubQuestionsTextField = cell.numberTextField
        } else if (indexPath.row == 4) {
            cell.infoTextLabel?.text = "Number of Questions for Multiplication :"
            numberOfMultiQuestionsTextField = cell.numberTextField
        } else if (indexPath.row == 5) {
            cell.infoTextLabel?.text = "Number of Questions for Division :"
            numberOfDivQuestionsTextField = cell.numberTextField
        }
    
        return cell
    }
    
    
}
