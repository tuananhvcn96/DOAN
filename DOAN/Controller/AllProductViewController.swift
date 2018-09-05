//
//  AllProductViewController.swift
//  DOAN
//
//  Created by Tuan Anh on 8/26/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class AllProductViewController: UIViewController {

    @IBOutlet weak var btnMenuItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnMenuItem.target = revealViewController()
        btnMenuItem.action = #selector(SWRevealViewController.revealToggle(_:))

        // Do any additional setup after loading the view.
    }
}
