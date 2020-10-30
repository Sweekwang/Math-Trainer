//
//  ViewController.swift
//  Math Trainer
//
//  Created by Liang Swee on 7/9/20.
//  Copyright © 2020 Ares Chua. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var subtractionView: UIView!
    @IBOutlet weak var mutiplyView: UIView!
    @IBOutlet weak var divisionView: UIView!
    @IBOutlet weak var mixedView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewSub: UIImageView!
    @IBOutlet weak var imageViewMutiple: UIImageView!
    @IBOutlet weak var imageViewDivide: UIImageView!
    @IBOutlet weak var imagewVieMixed: UIImageView!
    @IBOutlet weak var ImageViewPurchase: UIImageView!
    let gradientLayer = CAGradientLayer()
    
    @IBOutlet weak var bannerView: GADBannerView!
    
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
        purchaseSupportButton.layer.cornerRadius = view.frame.height / 120
        let cornerRatio = view.frame.height / 100
        addView.layer.cornerRadius = cornerRatio
        subtractionView.layer.cornerRadius = cornerRatio
        mutiplyView.layer.cornerRadius = cornerRatio
        divisionView.layer.cornerRadius = cornerRatio
        mixedView.layer.cornerRadius = cornerRatio
        imageView.layer.cornerRadius = cornerRatio
        imageViewSub.layer.cornerRadius = cornerRatio
        imageViewMutiple.layer.cornerRadius = cornerRatio
        imageViewDivide.layer.cornerRadius = cornerRatio
        imagewVieMixed.layer.cornerRadius = cornerRatio
        ImageViewPurchase.layer.cornerRadius = cornerRatio
        
     // ========================================================
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
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
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
    


}

