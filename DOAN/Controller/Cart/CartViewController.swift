//
//  CartViewController.swift
//  DOAN
//
//  Created by T.A Savvycom on 10/4/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var totalItems: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    static let identifier = "CartViewController"
    
    var listCartItem = [Cart]()
    var totalQuantity = 0
    
    override func viewDidLoad() {
        title = "Giỏ Hàng"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupToQuery()
        self.setupNavigationBar()
        self.setupHoverQuantity()
        self.tableView.reloadData()
        
        
    }
    
    func setupHoverQuantity(){
        var itemQuantity = 0
        for (Qty) in listCartItem {
            let itemQty = Qty.soluong 
            itemQuantity = itemQuantity + itemQty
        }
        
        totalQuantity = itemQuantity
        totalItems.text = String("Quantity: \(totalQuantity)")
    }
    
    func setupToQuery(){
        listCartItem = QueryLoaiSpModel.getInstance().getAllCart()
    }
    
    func setupNavigationBar() {
        let cartButton = UIBarButtonItem(image: UIImage(named: "home30"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(homeScreen))
        self.navigationItem.leftBarButtonItem = cartButton
    }
    
    @objc func homeScreen(){
        let homeScreen = storyboard?.instantiateViewController(withIdentifier: MainController.identifier) as! MainController
        navigationController?.show(homeScreen, sender: self)
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCartItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartViewCell", for: indexPath) as! CartViewCell
        
        let item = listCartItem[indexPath.row]
        cell.setupData(item)
        
        return cell
    }
}
