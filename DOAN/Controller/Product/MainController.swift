//
//  ViewController.swift
//  DOAN
//
//  Created by Tuan Anh on 8/8/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    var product = [Product]()
    
    @IBOutlet weak var btnMenuBar: UIBarButtonItem!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    var textNameLabel: Array = [String]()
    var desrition: Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btnMenuBar.target = revealViewController()
        btnMenuBar.action = #selector(SWRevealViewController.revealToggle(_:))
        self.title = "Menu"
        textNameLabel = ["Coffee","Breakfast","Munchies","Sandwiches"]
        self.setupCollectionView()
    }
    
    @IBAction func onTapAddProduct(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: AddProductViewController.identifier) as? AddProductViewController
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}

