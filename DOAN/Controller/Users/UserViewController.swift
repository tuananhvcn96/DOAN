//
//  UserViewController.swift
//  DOAN
//
//  Created by Tuan Anh on 10/14/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var btnMenuBar: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "User Info"
        self.setupNavigationBar()
        if revealViewController() != nil {
            btnMenuBar.target = self.revealViewController()
            btnMenuBar.action = #selector(SWRevealViewController().revealToggle(_:))
            
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
    }
    
    func setupNavigationBar(){
        btnMenuBar.target = revealViewController()
        btnMenuBar.action = #selector(SWRevealViewController.revealToggle(_:))
    }

    @IBAction func tapBarMenu(_ sender: Any) {

    }
}
