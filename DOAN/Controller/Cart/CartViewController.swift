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
    var totalAmontPrice = 0
    var getAllListCartItem = NSMutableArray()
    
    override func viewDidLoad() {
        title = "Giỏ Hàng"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupToQuery()
        self.setupNavigationBar()
        self.setupHoverQuantity()
        self.setupTotalPrice()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupToQuery()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        let itemCart: [Cart] = []
//
//        do{
//            let relusts = itemCart
//            listCartItem = relusts
//        } catch {
//            print("Dữ liệu không được truy xuất")
//        }
//        for i in 0 ..< listCartItem.count {
//            print("listItems\(i): \(listCartItem[i])")
//        }
        
        
        self.setupToQuery()
        self.setupHoverQuantity()
        tableView.reloadData()
    }
    
    func setupHoverQuantity(){
        var itemQuantity = 0
        for (Qty) in listCartItem {
            let itemQty = Qty.soluong 
            itemQuantity = itemQuantity + itemQty
        }
        
        totalQuantity = itemQuantity
        totalItems.text = String("Quantity: \(totalQuantity)")
        
//        if itemQuantity != 0 && self.listCartItem.count > 0 {
//            orderButton.backgroundColor
//            self.orderButton.isEnabled = false
//        } else {
//
//        }
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
        
        cell.delegate = self
        
        return cell
    }
}

extension CartViewController: CartViewCellDelegate {
    func deleteButton(sender: CartViewCell) {
        let indexPath = sender.itemCart?.id
        //let itemUpdate = listCartItem[indexPath]
        print("hover")
        
        _ = QueryLoaiSpModel.getInstance().deleteCart(RecoreId: indexPath!)
        
        listCartItem = QueryLoaiSpModel.getInstance().getAllCart()
        
        tableView.reloadData()
    }
    
    func CartViewCellDelegate(_ cell: CartViewCell, quantity: Int, itemUpdate: Cart) {
        
    }
    
    
    
}


