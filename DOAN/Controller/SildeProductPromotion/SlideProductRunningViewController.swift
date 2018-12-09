//
//  SlideProductRunningViewController.swift
//  DOAN
//
//  Created by T.A Savvycom on 9/27/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class SlideProductPromotionViewController: UIViewController {

    @IBOutlet weak var buttonBar: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var icon: Array = [UIImage]()
    var nameArr: Array = [String]()
    var infoArr: Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupCollectionView()
        collectionView.showsHorizontalScrollIndicator = false
        self.setupNavigationBar()
        
        nameArr = ["Sandwiches Trow","Candy How", "Sandwiches Bow", "Nutifood", "Dink Tea"]
        icon = [UIImage(named: "sanwitches1")!,UIImage(named: "candy")!,UIImage(named: "sanwitch2")!,UIImage(named: "nutifood")!,UIImage(named: "tea2")!]
        infoArr = ["Perfectly baked, hearty and full of flavor","Perfectly baked, hearty and full of flavor","Perfectly baked, hearty and full of flavor","Perfectly baked, hearty and full of flavor","Perfectly baked, hearty and full of flavor"]
    }
    
    func setupNavigationBar(){
        buttonBar.target = revealViewController()
        buttonBar.action = #selector(SWRevealViewController.revealToggle(_:))
        self.title = "Promotion Product"
        pageControl.numberOfPages = 5
    }


    func setupCollectionView() {
        let nib = UINib(nibName: "SlideProductRuningCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "SlideProductRuningCollectionViewCell")

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 50
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 25, bottom: 10, right: 25)
        flowLayout.invalidateLayout()
        
        flowLayout.scrollDirection = .horizontal
        let hWidth = 650 * (UIScreen.main.bounds.size.width / 750)
        flowLayout.itemSize = CGSize(width: hWidth, height: 525)
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
}

extension SlideProductPromotionViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = 5
        
        pageControl.numberOfPages = count
        pageControl.isHidden = !(count > 1)
        
        return nameArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideProductRuningCollectionViewCell", for: indexPath) as? SlideProductRuningCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.lblnameFood.text = nameArr[indexPath.row]
        cell.lblInfoFood.text = infoArr[indexPath.row]
        cell.imgvAvata.image = icon[indexPath.row]
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        pageControl?.currentPage = Int(roundedIndex)
    }
}


