//
//  AddSanPhamViewController.swift
//  DOAN
//
//  Created by T.A Savvycom on 9/10/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class AddSanPhamViewController: UIViewController {
    @IBOutlet weak var buttonBar: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonBar.target = revealViewController()
        buttonBar.action = #selector(SWRevealViewController.revealToggle(_:))
    }


}
