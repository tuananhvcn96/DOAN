//
//  UserInfoViewController.swift
//  DOAN
//
//  Created by T.A Savvycom on 10/15/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewImage: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionToFavotites(_ sender: UIButton) {
        
    }
}
