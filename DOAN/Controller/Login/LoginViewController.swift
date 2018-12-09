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
    @IBOutlet weak var nameHelloLabel: UILabel!
    var tenUser: String = ""
    var name = UserDefaults.standard.string(forKey: "ok")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.synchronize()

        // Do any additional setup after loading the view.
        if revealViewController() != nil {
            buttonBar.target = self.revealViewController()
            buttonBar.action = #selector(SWRevealViewController().revealToggle(_:))
            
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        
        buttonBar.target = revealViewController()
        buttonBar.action = #selector(SWRevealViewController.revealToggle(_:))
        self.setupBorder()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        
//        if !(self.name?.isEmpty)! {
//            nameHelloLabel.text = "Xin Chào \(String(describing: name!))"
//        }
//    }

    func setupBorder(){
        uiviewLabelCentre.setBorder(radius: 7, color: UIColor.white)
        uiviewSignUp.setBorder(radius: 7)
        uiviewSignFace.setBorder(radius: 7)
    }
    
    @IBAction func tapSignUp(_ sender: Any) {
        let stroryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = stroryboard.instantiateViewController(withIdentifier: LoginWithViewController.identifier) as! LoginWithViewController
        //vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func tapSignUpFace(_ sender: Any) {
    }
    @IBAction func tapToNotAccount(_ sender: Any) {
    }
    @IBAction func tapToDangKyAcc(_ sender: Any) {
        let stroryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = stroryboard.instantiateViewController(withIdentifier: RegistrationViewController.iddentifer) as! RegistrationViewController
        self.navigationController?.show(vc, sender: nil)
    }
}

//extension LoginViewController: LoginWithDelegate {
//    func checkSuccess(text: String, itemData: User) {
//        self.tenUser = text
//        if !self.tenUser.isEmpty {
//            nameHelloLabel.text = "Xin Chào \(self.tenUser)"
//        }
//    }
//}
