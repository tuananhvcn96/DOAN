//
//  LoginViewController.swift
//  DOAN
//
//  Created by T.A Savvycom on 10/8/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var buttonBar: UIBarButtonItem!
    @IBOutlet weak var uiviewLabelCentre: UIView!
    @IBOutlet weak var uiviewSignUp: UIView!
    @IBOutlet weak var uiviewSignFace: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonBar.target = revealViewController()
        buttonBar.action = #selector(SWRevealViewController.revealToggle(_:))
        self.setupBorder()
    }

    func setupBorder(){
        uiviewLabelCentre.setBorder(radius: 7, color: UIColor.white)
        uiviewSignUp.setBorder(radius: 7)
        uiviewSignFace.setBorder(radius: 7)
    }
    
    @IBAction func tapSignUp(_ sender: Any) {
    }
    @IBAction func tapSignUpFace(_ sender: Any) {
    }
    @IBAction func tapToNotAccount(_ sender: Any) {
    }
}
