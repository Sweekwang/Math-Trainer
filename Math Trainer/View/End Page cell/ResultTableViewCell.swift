//
//  ResultTableViewCell.swift
//  Math Trainer
//
//  Created by Liang Swee on 16/10/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var circleContainer: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var totalQnLabel: UILabel!
    
    let shapeLayer = CAShapeLayer()
    let shapeLayerBackground = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: (circleContainer.frame.midX/1.7), y: circleContainer.frame.midY - 5), radius: (circleContainer.frame.height/2) - 10, startAngle: -.pi/2, endAngle: .pi*2, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = .none
        shapeLayer.lineCap = .round
        
        shapeLayerBackground.path = circularPath.cgPath
        shapeLayerBackground.strokeColor = UIColor.gray.cgColor
        shapeLayerBackground.lineWidth = 5
        shapeLayerBackground.fillColor = UIColor(named: "Background")?.cgColor
        
        circleContainer.layer.addSublayer(shapeLayerBackground)
        circleContainer.layer.addSublayer(shapeLayer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setLayout(score: Int, totalQn: Int){
        scoreLabel.text = "\(score)"
        totalQnLabel.text = "out of \(totalQn)"
    }
    
    func startAnimation(to: Double){
        let animate = CABasicAnimation(keyPath: "strokeEnd")
        if to > 5 {
            animate.toValue = to - 0.205
        } else {
            animate.toValue = to - 0.1
        }
        animate.duration = 3
        animate.fillMode = .both
        animate.isRemovedOnCompletion = false
        shapeLayer.add(animate, forKey: nil)
        
    }
    
}
