//
//  AddTypeProductViewController.swift
//  DOAN
//
//  Created by Tuan Anh on 9/3/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddTypeProductViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var lblAddProduct: UITextField!
    @IBOutlet weak var lblDersip: UITextField!
    @IBOutlet weak var buttonAddProduct: UIButton!
    @IBOutlet weak var buttonAddImage: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "AddTypeProductViewController"
    var image: UIImage? = nil
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupData()
        navigationItem.rightBarButtonItem = navigationRightBarItem()
        navigationItem.leftBarButtonItem = navigationLefBarItem()
    }
    
    func navigationRightBarItem() -> UIBarButtonItem {
        let addProductButton = UIButton(type: .system)
        addProductButton.setTitle("Add", for: .normal)
        addProductButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        addProductButton.addTarget(self, action: #selector(self.onTapMenu), for: .touchUpInside)
        return UIBarButtonItem(customView: addProductButton)
    }
    
    func navigationLefBarItem() -> UIBarButtonItem {
        let addProductButton = UIButton(type: .system)
        addProductButton.setTitle("Back", for: .normal)
        addProductButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        addProductButton.addTarget(self, action: #selector(self.onTapMenuBack), for: .touchUpInside)
        return UIBarButtonItem(customView: addProductButton)
    }
    
    func setupData() {
        lblAddProduct.placeholder = "Xin mời nhập tên sản phẩm"
        lblDersip.placeholder = "Xin mời nhập mô tả sản phẩm"
    }
    
    @objc func onTapMenuBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func onTapMenu() {
        //self.dismiss(animated: true, completion: nil)

//        let result = checkCantAdd()
//
//        if result.succcues {
//            let name = lblAddProduct.text!
//            let describe = lblDersip.text!
//
//            let product = LoaiSanPham.createNew() as! LoaiSanPham
//            product.tensp = name
//            product.mota = describe
//
//            if image != nil {
//                product.hinhanh = UIImageJPEGRepresentation(image!, 1) as NSData?
//            }
//
//            DB.save()
//
//            UI.aLert(ui: self, title: "Success", message: "New product") {
//                _ in
//                _ = self.navigationController?.popViewController(animated: true)
//                self.dismiss(animated: true, completion: nil)
//            }
//        } else {
//            // hiện thông báo lỗi
//            UI.ALert(ui: self, title: "Error", message: result.error)
//        }
        
        let result = checkCantAdd()
        
        if result.succcues {
        
            let productInfo: loaiSanPham = loaiSanPham()
            productInfo.tensp = lblAddProduct.text!
            productInfo.motasp = lblDersip.text!
        
            if image != nil {
                productInfo.hinhanh = UIImagePNGRepresentation(image!) as! Data
            }
            
            let isInserted = QueryLoaiSpModel.getInstance().insertData(productInfo)
            if isInserted {
                Util.invokeAlertMethod(strTitle: "", strBody: "Thêm thành công", delegate: nil)
                self.dismiss(animated: true, completion: nil)
            } else {
                Util.invokeAlertMethod(strTitle: "", strBody: "Thêm thất bại", delegate: nil)
            }
        } else {
            UI.ALert(ui: self, title: "Error", message: result.error)
        }
    }
    
    func checkCantAdd() -> (succcues: Bool, error: String) {
        var succcues = false
        var error = ""
        
        if lblAddProduct.text?.count == 0 {
            error += "Xin mời nhập tên sản phẩm \n"
        }
        
        if lblDersip.text?.count == 0 {
            error += "Xin mời nhập mô tả sản phẩm \n"
        }
        
        succcues = error.count == 0
        
        return(succcues,error)
    }
    @IBAction func addImageButton_tapped(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickerImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = pickerImage
            imageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
