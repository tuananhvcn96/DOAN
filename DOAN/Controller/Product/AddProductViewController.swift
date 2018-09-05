//
//  AddProductViewController.swift
//  DOAN
//
//  Created by Tuan Anh on 9/3/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddProductViewController : UIViewController {
    @IBOutlet weak var lblAddProduct: UITextField!
    @IBOutlet weak var buttonAddProduct: UIButton!
    @IBOutlet weak var buttonAddImage: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "AddProductViewController"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupData()
        navigationItem.rightBarButtonItem = navigationBarItem()
    }
    
    func navigationBarItem() -> UIBarButtonItem {
        let addProductButton = UIButton(type: .system)
        addProductButton.setTitle("Add", for: .normal)
        addProductButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        addProductButton.addTarget(self, action: #selector(self.onTapMenu), for: .touchUpInside)
        return UIBarButtonItem(customView: addProductButton)
    }
    
    func setupData() {
        lblAddProduct.placeholder = "Xin mời nhập tên sản phẩm"
    }
    
    @objc func onTapMenu() {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: DetailCurrently.identifier) as? DetailCurrently
//        vc?.delegate = self
//        let navigationController = UINavigationController(rootViewController: vc!)
//        self.navigationController?.present(navigationController, animated: true, completion: {
//
//        })
        self.dismiss(animated: true, completion: nil)
    }
    
}
