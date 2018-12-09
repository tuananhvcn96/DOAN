//
//  CheckoutViewController.swift
//  DOAN
//
//  Created by Tuan Anh on 11/10/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbltotalCartPrice: UILabel!
    @IBOutlet weak var switchShip: UISwitch!
    @IBOutlet weak var lbldeliveryPriceNumber: UILabel!

    var allProductTotal: Int!
    var shipdeliveryPrice = 250
    var listItemCart = [Cart]()
    var indexPath = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Check Out Cart"
        
        setupLayout()
        setupToQuery()
    }
    
    func setupToQuery(){
        listItemCart = QueryDatabaseModel.getInstance().getAllCart()
    }
    
    func setupLayout(){
        let cartButton = UIBarButtonItem(image: UIImage(named: "home30"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(CheckoutViewController.actionGoToHome))
        
        self.navigationItem.rightBarButtonItem = cartButton
        
        //totalCartAmount.text = "\(String(allProductTotal + deliveryPrice))"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in 0 ..< listItemCart.count {
            print("ListItems\(i): \(listItemCart[i])")
        }
    }
    
    @objc func actionGoToHome(){
        let homeScreen = storyboard?.instantiateViewController(withIdentifier: MainController.identifier) as! MainController
        navigationController?.show(homeScreen, sender: self)
    }
    
    @IBAction func shippingOption(_ sender: AnyObject) {
     // tinh them tien ship
        if switchShip.isOn {
//            let valuePriceCart = listItemCart.map {$0}
            for i in 0 ..< listItemCart.count {
                print("ListItems\(i): \(listItemCart[i])")
                //let va = listItemCart[i]
                let va = listItemCart[i].giatien * listItemCart[i].soluong
                lbltotalCartPrice.text = "\(va + shipdeliveryPrice)"
            }
        } else {
            for i in 0 ..< listItemCart.count {
                print("ListItems\(i): \(listItemCart[i])")
                //let va = listItemCart[i]
                let va = listItemCart[i].giatien * listItemCart[i].soluong
                lbltotalCartPrice.text = "\(va)"
            }
        }
        
    }
    @IBAction func actionToAddress(_ sender: Any) {        
        let stroryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = stroryboard.instantiateViewController(withIdentifier: AddressViewController.identifier) as! AddressViewController
        //vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItemCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutViewCell", for: indexPath) as! CheckoutViewCell
        let item = listItemCart[indexPath.row]
        
        cell.delegate = self
        cell.setupDataCart(item)
        
        return cell
    }
}

extension CheckoutViewController: DelegateSwitchCell {
    func valueChangeSwitch(_ cell: CheckoutViewCell, itemUpdate: Cart) {

    }
}
