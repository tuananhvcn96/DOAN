//
//  CartViewCell.swift
//  DOAN
//
//  Created by T.A Savvycom on 10/4/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

protocol CartViewCellDelegate {
    func cartViewCellDelegate(_ cell: CartViewCell, quantity: Int, itemUpdate: Cart)
    func deleteButton(sender: CartViewCell)
}

class CartViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productStepper: UIStepper!
    
    var delegate: CartViewCellDelegate?
    var itemCart: Cart?
    var purchaseMax = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func buttonDelete(_ sender: Any) {
        self.delegate?.deleteButton(sender: self)
    }
    

    func setupData(_ item: Cart) {
        productName?.text = item.tensp
        productPrice?.text = String(item.giatien)
    
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
        let value = Int(productStepper.value)
        productStepper.maximumValue = value >= purchaseMax ? productStepper.value: Double(purchaseMax)
        
        self.setupItemQuantity(value)
        print(value)
    }
    
    func setupItemQuantity(_ quantity: Int){
        let itemQuantityText = "Qty.\(quantity)"
        productQuantity?.text = itemQuantityText
        
        productStepper.value = Double(quantity)
        
        if (delegate != nil) {
            delegate?.cartViewCellDelegate(self, quantity: quantity, itemUpdate: itemCart!)
        }
    }
    
}
