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
    @IBOutlet weak var container: UIView!
    
    var numberEntered = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        numberTextField.delegate = self
        container.layer.cornerRadius = 5
        
    
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let numberInString = numberTextField.text
        
        if (numberInString != "") {
            numberEntered = Int(numberInString!)!
        }
        print(numberEntered)
    }
    
    func placeholderText(_ text: String){
        numberTextField.attributedPlaceholder = NSAttributedString(string: "\(text) (Default)",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        
    }
    
    

}
