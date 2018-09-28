//
//  DetailPromotionViewController.swift
//  DOAN
//
//  Created by T.A Savvycom on 9/28/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class DetailPromotionViewController: UIViewController {

    @IBOutlet weak var titleNameLbl: UILabel!
    @IBOutlet weak var iamgeView: UIImageView!
    @IBOutlet weak var dersiLbl: UILabel!
    @IBOutlet weak var pickerQuantity: UIPickerView!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setup() {
        
    }
    
    @IBAction func buttonClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapCartButton(_ sender: Any) {
        
    }
}
