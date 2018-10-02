//
//  DetailProductViewController.swift
//  DOAN
//
//  Created by T.A Savvycom on 9/20/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class DetailProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameProductlbl: UILabel!
    @IBOutlet weak var noteProductlbl: UILabel!
    
    var product = [SanPhamm]()
    static let iddentifer = "DetailProductViewController"
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = navigationLefBarItem()
        product = QueryLoaiSpModel.getInstance().getAllDataProduct(id: id!)
        self.setupTableView()
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //Detault Background clear
        tableView.backgroundColor = UIColor.clear
    }
    
    func navigationLefBarItem() -> UIBarButtonItem {
        let addProductButton = UIButton(type: .system)
        addProductButton.setTitle("Back", for: .normal)
        addProductButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        addProductButton.addTarget(self, action: #selector(self.onTapMenuBack), for: .touchUpInside)
        return UIBarButtonItem(customView: addProductButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onTapMenuBack() {
        self.dismiss(animated: true, completion: nil)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupTableView() {
        let nib = UINib(nibName: "DetailProductTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "DetailProductTableViewCell")
    }
}

extension DetailProductViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: DetailProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DetailProductTableViewCell", for: indexPath) as? DetailProductTableViewCell else {
            return UITableViewCell()
        }
        let products = product[indexPath.row]
        cell.setupData(products)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productPromotion = product[indexPath.row]
        let vc = DetailPromotionViewController.newVC(categoryName: productPromotion)
        vc.categoryName = productPromotion
    
        self.present(vc, animated: true, completion: nil)
    }
}


