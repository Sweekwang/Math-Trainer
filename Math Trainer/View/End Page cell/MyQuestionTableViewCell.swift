//
//  MyQuestionTableViewCell.swift
//  Math Trainer
//
//  Created by Liang Swee on 16/10/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import UIKit

class MyQuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var qnNoLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var userAnswerLabel: UILabel!
    @IBOutlet weak var userBG: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

