//
//  ShadowableView.swift
//  DOAN
//
//  Created by T.A Savvycom on 10/15/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

@IBDesignable class ShadowableView: UIView {
    
    var shadowLayer: CAShapeLayer!
    // Configurable from xib
    @IBInspectable var viewCornerRadius: CGFloat = 12.0
    @IBInspectable var shadowOffsetWidth: CGFloat = 2.0
    @IBInspectable var shadowOffsetHeight: CGFloat = 2.0
    @IBInspectable var shadowOpacityValue: Float = 0.8
    @IBInspectable var shadowRadiusValue: CGFloat = 2.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: viewCornerRadius).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            
            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
            shadowLayer.shadowOpacity = shadowOpacityValue
            shadowLayer.shadowRadius = shadowRadiusValue
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
