//
//  ViewController.swift
//  Math Trainer
//
//  Created by Liang Swee on 7/9/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var purchaseSupportButton: UIButton!
    var options = ["Addition", "Subtraction", "Multiplication", "Division", "Mixed"]
    var topicSelected = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     // =============== Styling Adjustment =====================
        purchaseSupportButton.layer.cornerRadius = 10
     // ========================================================
        
    }
    
    @IBAction func selectionButtonPressed(_ sender: UIButton) {
        // Tag 0 - Addition, 1 - Subtraction, 2 - Multiplication, 3 - Division, 4 - Mixed
        topicSelected = options[sender.tag]
        
        self.performSegue(withIdentifier: K.segueSettingIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == K.segueSettingIdentifier){
            let vc = segue.destination as! SettingViewController
            vc.selectedTopic = topicSelected
            
        }
    }
    
    


}

