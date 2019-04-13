//
//  GradationView.swift
//  hyoi_MOC
//
//  Created by Sota Saito on 2019/04/04.
//  Copyright © 2019 unwithdrawal. All rights reserved.
//

import UIKit

class GradationView: UIView {
    
    var gradientLayer: CAGradientLayer?
    
    @IBInspectable var topColor: UIColor = UIColor.white {
        didSet {
            setGradation()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = UIColor.black {
        didSet {
            setGradation()
        }
    }
    
    private func setGradation() {
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = CAGradientLayer()
        gradientLayer!.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer!.frame.size = frame.size
        layer.addSublayer(gradientLayer!)
        layer.masksToBounds = true
    }
}
//グラデーションの開始色
let topColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00)
//グラデーションの開始色
let bottomColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00)
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


