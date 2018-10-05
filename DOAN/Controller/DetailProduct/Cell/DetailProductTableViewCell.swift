//
//  DetailProductTableViewCell.swift
//  DOAN
//
//  Created by T.A Savvycom on 9/20/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class DetailProductTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var noteProduct: UILabel!
    @IBOutlet weak var priceProductlbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupData(_ product: SanPhamm) {
        nameProduct.text = product.tensanpham
        noteProduct.text = product.motasanpham
        priceProductlbl.text = String(product.giaban)
        imageViewProduct.image = UIImage(data: (product.hinhanh))
    }
}
