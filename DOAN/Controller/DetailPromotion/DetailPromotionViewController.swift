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
    var categoryName: SanPhamm!
    var product = [SanPhamm]()
    
    static let identifier = "DetailPromotionViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setup()
    }
    
    class func newVC(categoryName: SanPhamm) -> DetailPromotionViewController {
        let stroryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = stroryboard.instantiateViewController(withIdentifier: DetailPromotionViewController.identifier) as! DetailPromotionViewController
        vc.categoryName = categoryName
        return vc
    }
    
    func setup() {
        titleNameLbl.text = categoryName.tensanpham
        iamgeView.image = UIImage(data: (categoryName.hinhanh))
        dersiLbl.text = categoryName.ghichu
        priceLbl.text = "$\(categoryName.giaban)"
    }
    
    @IBAction func buttonClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapCartButton(_ sender: Any) {
        
    }
}
