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
    @IBOutlet weak var lbltotalQuantity: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    static let identifier = "CartViewController"
    
    var listCartItem = [Cart]()
    var totalQuantity = 0
    var totalAmontPrice = 0
    var getAllListCartItem = NSMutableArray()
    var quantityStepper: Int = 0
    
    override func viewDidLoad() {
        title = "Cart"
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupNavigationBar()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupToQuery()
        self.setupHoverQuantity()
        self.setupTotalPrice()
        tableView.reloadData()
    }
    
    func setupHoverQuantity(){
        var itemQuantity = 0
        for (Qty) in listCartItem {
            let itemQty = Qty.soluong
            itemQuantity = itemQuantity + itemQty
        }
        
        totalQuantity = itemQuantity
        lbltotalQuantity.text = String("Quantity: \(totalQuantity)")
        
        self.orderButton.isEnabled = (itemQuantity != 0 && self.listCartItem.count > 0)
    }
    
    func setupTotalPrice(){
        var totalPricee = 0
        var itemAmount = 0
        for (Qty) in listCartItem {
            let itemPrice = Qty.giatien
            let itemQuantity = Qty.soluong
            itemAmount = itemPrice * itemQuantity
            totalPricee  = totalPricee + itemAmount
        }
        
        totalAmontPrice = totalPricee
        totalPrice.text = String("Tiền: \(totalAmontPrice) VNĐ")
    }
    
    func setupToQuery(){
        listCartItem = QueryDatabaseModel.getInstance().getAllCart()
    }
    
    func setupNavigationBar() {
        let cartButton = UIBarButtonItem(image: UIImage(named: "home30"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(actionGoToHome))
        self.navigationItem.leftBarButtonItem = cartButton
    }
    
    @objc func actionGoToHome(){
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
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        cell.delegate = self
        
        return cell
    }
}

extension CartViewController: CartViewCellDelegate {
    func deleteButton(sender: CartViewCell) {
        let indexPath = sender.itemCart?.id
        //let itemUpdate = listCartItem[indexPath]
        print("hover")
        
        _ = QueryDatabaseModel.getInstance().deleteCart(RecoreId: indexPath!)
        listCartItem = QueryDatabaseModel.getInstance().getAllCart()
        
        setupTotalPrice()
        setupHoverQuantity()
        
        tableView.reloadData()
    }
    
    func cartViewCellDelegate(_ cell: CartViewCell, quantity: Int, itemUpdate: Cart) {
        
        // update item quantity
        itemUpdate.soluong = quantity
        
        var itemUpdateQuantity = 0

        for item in listCartItem {
            let itemQty = item.soluong
            itemUpdateQuantity = itemUpdateQuantity + itemQty
        }
        
        self.orderButton.isEnabled = itemUpdateQuantity != 0
        if itemUpdateQuantity == 0 {
            self.orderButton.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0, alpha: 0.2)
        } else {
            self.orderButton.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0, alpha: 1.0)
        }
        
        totalQuantity = itemUpdateQuantity
        lbltotalQuantity.text = "Số lượng: \(totalQuantity)"
        
        var itemUpdatePrice = 0
        var itemUpdateAmount = 0
        for item in listCartItem {
            let itemPrice = item.giatien
            let itemQty = item.soluong
            itemUpdateAmount = itemPrice * itemQty
            itemUpdatePrice = itemUpdatePrice + itemUpdateAmount
        }
        
        totalAmontPrice = itemUpdatePrice
        totalPrice.text = "Tổng tiền: \(totalAmontPrice)"
        _ = QueryDatabaseModel.getInstance().updateCartCell(id: itemUpdate.id, soluong: itemUpdate.soluong)
        tableView.reloadData()
    }
}


