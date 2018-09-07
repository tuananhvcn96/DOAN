//
//  MainCollectionViewCell.swift
//  DOAN
//
//  Created by Tuan Anh on 8/29/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var desriLabel: UILabel!
    
    var nameLabelText: String? = ""
    var desritLabelText: String? = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(cell: Product) {
        //self.nameLabelText = cell.tensp
        
        //guard let cellName = cell.tensp as? String else { return }
        nameLabel.text = cell.tensp
        desriLabel.text = cell.mota
        imageView.image = UIImage(data: (cell.hinhanh as! Data))
    }

}
