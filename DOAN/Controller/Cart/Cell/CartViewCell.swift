//
//  CartViewCell.swift
//  DOAN
//
//  Created by T.A Savvycom on 10/4/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

protocol CartViewCellDelegate {
    func CartViewCellDelegate(_ cell: CartViewCell, quantity: Int, itemUpdate: Cart)
}

class CartViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productStepper: UIStepper!
    
    var delegate: CartViewCellDelegate?
    
    var itemCart: Cart?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupData(_ item: Cart) {
        productName?.text = item.tensp
        productPrice?.text = item.giatien
    
        if let qty: Int = item.soluong {
            _ = "Qty. \(qty)"
            self.productStepper.value = Double(qty)
            self.productQuantity.text = "Qty: \(qty)"
        }
        
        let images = item.hinhanh
        productImageView.image = UIImage(data: images as Data)
        
        itemCart = item
        
    }

    @IBAction func stepperValueChanged(_ sender: AnyObject) {
        let value = Int(productStepper!.value)
        self.setupItemQuantity(value)
        
    }
    
    func setupItemQuantity(_ quantity: Int){
        let itemQuantityText = "Qty.\(quantity)"
        productQuantity?.text = itemQuantityText
        
        productStepper.value = Double(quantity)
        
        if (delegate != nil) {
            delegate?.CartViewCellDelegate(self, quantity: quantity, itemUpdate: itemCart!)
        }
    }
    
}
