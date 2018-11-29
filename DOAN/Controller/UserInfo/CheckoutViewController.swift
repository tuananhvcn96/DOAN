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
    @IBOutlet weak var totalCartAmount: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var deliveryPriceNumber: UILabel!

    var allProductTotal: Int!
    var deliveryPrice = 250
    var itemCart = [Cart]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Check Out Cart"
        
        setupNavigation()
        setupToQuery()
    }
    
    func setupToQuery(){
        itemCart = QueryLoaiSpModel.getInstance().getAllCart()
    }
    
    func setupNavigation(){
        let cartButton = UIBarButtonItem(image: UIImage(named: "home30"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(CheckoutViewController.homeScreen))
        
        self.navigationItem.rightBarButtonItem = cartButton
        
        totalCartAmount.text = "\(String(allProductTotal + deliveryPrice))"
    }
    
    @objc func homeScreen(){
        let homeScreen = storyboard?.instantiateViewController(withIdentifier: MainController.identifier) as! MainController
        navigationController?.show(homeScreen, sender: self)
    }
    
    @IBAction func ShippingOption(_ sender: AnyObject) {
     // tinh them tien ship
        
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
        return itemCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutViewCell", for: indexPath) as! CheckoutViewCell
        let item = itemCart[indexPath.row]
        
        cell.setProductAttribute(item)
        
        return cell
    }
}
