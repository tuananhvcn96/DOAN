//
//  ViewController.swift
//  DOAN
//
//  Created by Tuan Anh on 8/8/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    @IBOutlet weak var btnMenuBar: UIBarButtonItem!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    var products = [LoaiSanPham]()
    var textNameLabel: Array = [String]()
    var desrition: Array = [String]()
    var getAllDataInfo = [loaiSanPham]()
    var id: Int?
    static let identifier = "MainController"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupNavigationBar()
        self.setupCollectionView()
        
    }
    
    func setupNavigationBar(){
        btnMenuBar.target = revealViewController()
        btnMenuBar.action = #selector(SWRevealViewController.revealToggle(_:))
        self.title = "Menu"
        textNameLabel = ["Coffee","Breakfast","Munchies","Sandwiches"]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        products = LoaiSanPham.getAll() as! [LoaiSanPham]
        getAllDataInfo = QueryLoaiSpModel.getInstance().getAllData()
        mainCollectionView.reloadData()
    }
    
    @IBAction func slideBar(_ sender: Any) {
        btnMenuBar.target = revealViewController()
        btnMenuBar.action = #selector(SWRevealViewController.revealToggle(_:))
    }
    @IBAction func onTapAddProduct(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: AddTypeProductViewController.identifier) as? AddTypeProductViewController
        let navigationController = UINavigationController(rootViewController: vc!)
        self.navigationController?.present(navigationController, animated: true, completion: {
            
        })
    }
    @IBAction func onTapToCart(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: CartViewController.identifier) as? CartViewController
        let navigationController = UINavigationController(rootViewController: vc!)
        self.navigationController?.present(navigationController, animated: true, completion: {
            
        })
    }
    
    func setupCollectionView() {
        let nib = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        self.mainCollectionView.register(nib, forCellWithReuseIdentifier: "MainCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 15, left: 12, bottom: 10, right: 12)
        flowLayout.invalidateLayout()
        
        flowLayout.scrollDirection = .vertical
        //        let hWidth = (diskPromotionCollectionView.frame.size.width + 50) / 2
        let hWidth = 340 * (UIScreen.main.bounds.size.width/750)
        flowLayout.itemSize = CGSize(width: hWidth, height: 200)
        mainCollectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
}

extension MainController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getAllDataInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = getAllDataInfo[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(cell: product)
        
        return cell
    }
}

extension MainController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let array = getAllDataInfo[indexPath.item]
        guard let detailProductVC = self.storyboard?.instantiateViewController(withIdentifier: DetailProductViewController.iddentifer) as? DetailProductViewController else { return }
        
        detailProductVC.id = array.id_loaisp
        self.navigationController?.pushViewController(detailProductVC, animated: true)
    }
}
