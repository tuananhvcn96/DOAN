    //
//  MenuViewController.swift
//  DOAN
//
//  Created by Tuan Anh on 8/26/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageViewProfile: UIImageView!
    @IBOutlet weak var helloLbl: UILabel!
    @IBOutlet weak var buttonThoat: UIButton!
    
    var menuNameArr: Array = [String]()
    var iconImage: Array = [UIImage]()
    var tenUser: String = ""
    var name = UserDefaults.standard.string(forKey: "ok")
    static let identifier = "MenuViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuNameArr = ["Home", "Promotion", "Product","Login","User"]
        iconImage = [UIImage(named: "pic1")!,UIImage(named: "pic2")!,UIImage(named: "pic3")!,UIImage(named: "pic4")!,UIImage(named: "pic5")!]
        // Do any additional setup after loading the view.
        imageViewProfile.image = UIImage(named: "AppIcon-1")
        imageViewProfile.layer.borderColor = UIColor.red.cgColor
        imageViewProfile.layer.borderWidth = 2
        imageViewProfile.layer.cornerRadius = 20
        imageViewProfile.layer.masksToBounds = false
        imageViewProfile.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        if !(self.name?.isEmpty)! {
//            helloLbl.text = "Xin Chào \(String(describing: name!))"
//        }
    }
    
    @IBAction func btnThoat(_ sender: UIButton) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if !isUserLoggedIn {
            helloLbl.text = "Xin Chào Ngài"
            UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
        }
    }
}

//extension MenuViewController: LoginWithDelegate {
//    func checkSuccess(text: String, itemData: User) {
//        self.tenUser = text
//    }
//}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        
        cell.imgIcon.image = iconImage[indexPath.row]
        cell.lblMenuName.text = menuNameArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController: SWRevealViewController = self.revealViewController()
        let cell: MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if cell.lblMenuName.text! == "Home" {
            let mainStroryboarb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStroryboarb.instantiateViewController(withIdentifier: "MainController") as! MainController
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text! == "Promotion" {
            let mainStroryboarb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStroryboarb.instantiateViewController(withIdentifier: "SlideProductPromotionViewController") as! SlideProductPromotionViewController
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text! == "Product" {
            let mainStroryboarb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStroryboarb.instantiateViewController(withIdentifier: "AddSanPhamViewController") as! AddSanPhamViewController
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text == "Login" {
            let mainStroryboarb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStroryboarb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text == "User" {
            let mainStroryboarb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStroryboarb.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
          
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
    }
}
