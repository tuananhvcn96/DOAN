//
//  AddPromotionProductViewController.swift
//  DOAN
//
//  Created by T.A Savvycom on 10/17/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class AddPromotionProductViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var dersicTF: UITextField!
    @IBOutlet weak var priceInput: UITextField!
    @IBOutlet weak var priceOutput: UITextField!
    let imagePicker = UIImagePickerController()
    var image: UIImage? = nil

    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil) // bỏ cái màn hình chọn ảnh đi
        
        if let pickerImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = pickerImage // lưu lại thành model
            imageView.image =  image // câp nhật lại giao diện
        }
    }
    
    @IBAction func tapImageView(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func tapSave(_ sender: Any) {
        
    }
    
    
}
