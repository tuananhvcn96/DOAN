//
//  CheckoutViewCell.swift
//  DOAN
//
//  Created by Tuan Anh on 11/5/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

protocol DelegateSwitchCell: class {
    func valueChangeSwitch(_ cell: CheckoutViewCell, itemUpdate: Cart)
}

class CheckoutViewCell: UITableViewCell {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!

    var productAllTotal: Int!
    var itemCart: Cart?
    weak var delegate: DelegateSwitchCell?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         DispatchQueue.main.async {
            self.delegate?.valueChangeSwitch(self, itemUpdate: self.itemCart!)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupDataCart(_ item: Cart) {
        productName.text = item.tensp
        
        let itemPrice = item.giatien 
        let itemQuantity = item.soluong 
        
        productAllTotal = itemPrice * itemQuantity
        productPrice.text = "\(String(productAllTotal))"
        productQuantity.text = String(describing: item.soluong)
        
        itemCart = item
    }

}
