//
//  NumberTableViewCell.swift
//  Math Trainer
//
//  Created by Liang Swee on 7/9/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import UIKit

class NumberTableViewCell: UITableViewCell, UITextFieldDelegate {


    @IBOutlet weak var infoTextLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    var numberEntered = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        numberTextField.delegate = self
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let numberInString = numberTextField.text
        
        if (numberInString != "") {
            numberEntered = Int(numberInString!)!
        }
        print(numberEntered)
    }
    
    

}
