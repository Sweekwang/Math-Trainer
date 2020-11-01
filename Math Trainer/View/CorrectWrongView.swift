//
//  CorrectWrongView.swift
//  Math Trainer
//
//  Created by Liang Swee on 27/9/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import UIKit

class CorrectWrongView: UIView {
        
    let correctImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showImage(name: String){
        switch name {
        case "correct":
            correctImage.image = UIImage(systemName: "checkmark.circle.fill")
            correctImage.tintColor = UIColor.green
            break
        case "wrong":
            correctImage.image = UIImage(systemName: "multiply.circle.fill")
            correctImage.tintColor = UIColor.red
            break
        default:
            correctImage.image = UIImage(systemName: "")
            break
        }
        self.addSubview(correctImage)
        correctImage.translatesAutoresizingMaskIntoConstraints = false
        correctImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        correctImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        correctImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        correctImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    func removeImage() {
        correctImage.removeFromSuperview()
    }
    
}
