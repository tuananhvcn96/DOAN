//
//  AddSanPhamViewController.swift
//  DOAN
//
//  Created by T.A Savvycom on 9/10/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class AddSanPhamViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var buttonBar: UIBarButtonItem!
    @IBOutlet weak var nameSPLbl: UITextField!
    @IBOutlet weak var noteLbl: UITextField!
    @IBOutlet weak var inputpriceLbl: UITextField!
    @IBOutlet weak var priceLbl: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var describeTextView: UITextView!
    @IBOutlet weak var imageVIew: UIImageView!
    var productType = [loaiSanPham]()
    var image: UIImage? = nil
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonBar.target = revealViewController()
        buttonBar.action = #selector(SWRevealViewController.revealToggle(_:))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        productType = QueryLoaiSpModel.getInstance().getAllData()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func buttonAddImage(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil) // bỏ cái màn hình chọn ảnh đi
        
        if let pickerImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = pickerImage // lưu lại thành model
            imageVIew.image =  image // câp nhật lại giao diện
        }
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        let addProduct: SanPhamm = SanPhamm()
        let products: loaiSanPham
        
        let nameProductlbl = nameSPLbl.text!
        let noteProductlbl = noteLbl.text!
        let inputpriceProductlbl = inputpriceLbl.text!
        let priceProductlbl = priceLbl.text!
        let describeProductTextView = describeTextView.text!
        let selectedProduct = productType[picker.selectedRow(inComponent: 0)]
        
        print(selectedProduct)
        addProduct.id = selectedProduct.id_loaisp 
        addProduct.tensanpham = nameProductlbl
        addProduct.ghichu = noteProductlbl
        addProduct.giaban = priceProductlbl
        addProduct.gianhap = inputpriceProductlbl
        addProduct.motasanpham = describeProductTextView
        
        if image != nil {
            addProduct.hinhanh = UIImagePNGRepresentation(image!) as! Data
        }
        
        let isInserted = QueryLoaiSpModel.getInstance().insertDataProduct(addProduct)
        if isInserted {
            Util.invokeAlertMethod(strTitle: "", strBody: "Thêm thành công", delegate: nil)
        } else {
            Util.invokeAlertMethod(strTitle: "", strBody: "Thêm thất bại", delegate: nil)
        }
       
    }
}

extension AddSanPhamViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return productType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let product = productType[row]
        print(product.id_loaisp)
        return product.tensp
    }
}
