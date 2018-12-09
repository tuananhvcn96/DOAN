//
//  FavoritesViewController.swift
//  DOAN
//
//  Created by Tuan Anh on 11/21/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    static let indentifier = "FavoritesViewController"
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray: Array = [String]()
    var priceArray: Array = [String]()
    var iconimgv: Array = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameArray = ["Chocolate Muffin","Plain Bargel","Milk & Cookies","Red Berry Danish", "Caramel Muffin"]
        priceArray = ["105000 VNĐ","75000 VNĐ","44000 VNĐ","22000 VNĐ","20000 VNĐ"]
        iconimgv = [UIImage(named: "Image 1")!, UIImage(named: "Image 2")!, UIImage(named: "Image 3")!, UIImage(named: "Image 4")!, UIImage(named: "Image 5")!]

        // Do any additional setup after loading the view.
        setupTableViewCell()
//        tableView.estimatedRowHeight = 21
//        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func setupTableViewCell(){
        let nib = UINib(nibName: "FavoritesTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "FavoritesTableViewCell")
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension FavoritesViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: FavoritesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }
        cell.lblNameFood.text = nameArray[indexPath.row]
        cell.lblPriceFood.text = priceArray[indexPath.row]
        cell.imgvAvata.image = iconimgv[indexPath.row]
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        return cell
    }
    
}
