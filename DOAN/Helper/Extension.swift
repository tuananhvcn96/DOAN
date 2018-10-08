//
//  Extension.swift
//  DOAN
//
//  Created by T.A Savvycom on 10/8/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import Foundation

extension UIView{
    
    func setBorder(radius:CGFloat, color:UIColor = UIColor.clear) -> UIView{
        let roundView:UIView = self
        roundView.layer.cornerRadius = CGFloat(radius)
        roundView.layer.borderWidth = 1
        roundView.layer.borderColor = color.cgColor
        roundView.clipsToBounds = true
        return roundView
    }
}
