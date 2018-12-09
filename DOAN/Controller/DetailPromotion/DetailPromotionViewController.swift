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
    @IBOutlet weak var pickerView: UIPickerView!
    var categoryName: SanPhamm!
    var product = [SanPhamm]()
    var listCart = [Cart]()
    var pickerData: [Int] = [Int]()
    var getId: Int = Int()
    
    static let identifier = "DetailPromotionViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickerData = [1,2,3,4,5,6,7,8,9,10]
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
        priceLbl.text = "\(categoryName.giaban)"
    }
    
    @IBAction func buttonClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapCartButton(_ sender: Any) {
        let addCart: Cart = Cart()
        var indexPath = 0

        if listCart.isEmpty {
        
            let nameCartLbl = titleNameLbl.text!
            let describeCartLbl = dersiLbl.text!
            let priceCartLbl = priceLbl.text!
            let imageCart = iamgeView.image
            let selectedCart = pickerData[pickerView.selectedRow(inComponent: 0)]
        
            print(selectedCart)
        
            addCart.tensp = nameCartLbl
            addCart.motasp = describeCartLbl
            addCart.giatien = Int(priceCartLbl)!
            addCart.soluong = selectedCart
        
            if iamgeView != nil {
                addCart.hinhanh = (UIImagePNGRepresentation(imageCart!))!
            }
        
            let isInserted = QueryDatabaseModel.getInstance().insertCart(addCart)
            listCart.append(addCart)
            
            if isInserted {
                Util.invokeAlertMethod(strTitle: "", strBody: "Đã thêm vào giỏ hàng", delegate: nil)
            } else {
                Util.invokeAlertMethod(strTitle: "", strBody: "Thêm thất bại", delegate: nil)
            }
            print("\(listCart)")
        } else {
            let itemUpdate = listCart[indexPath]
            let selectedCart = pickerData[pickerView.selectedRow(inComponent: 0)]
            itemUpdate.soluong = (Int(itemUpdate.soluong) + selectedCart)
            //let isInserted = QueryLoaiSpModel.getInstance().insertCart(itemUpdate)
//            let isInserted = QueryLoaiSpModel.getInstance().updateCart(RecoreId: categoryName.id, soluong: itemUpdate.soluong)
            
//            if isInserted {
//                Util.invokeAlertMethod(strTitle: "", strBody: "Đã cập nhật giỏ hàng", delegate: nil)
//            } else {
//                Util.invokeAlertMethod(strTitle: "", strBody: "cập nhật thất bại", delegate: nil)
//            }
            
            _ = QueryDatabaseModel.getInstance().updateCart(RecoreId: categoryName.id, soluong: itemUpdate.soluong)

            Util.invokeAlertMethod(strTitle: "", strBody: "recode updated !!", delegate: nil)
            print("\(listCart)")
        }
    }
}

extension DetailPromotionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let product = pickerData[row]
        return String(product)
    }
}
