//
//  PaymentViewController.swift
//  DOAN
//
//  Created by Tuan Anh on 11/6/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    static let identifier = "PaymentViewController"
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var expiresInTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Info Payment"
    }
    @IBAction func actionToHome(_ sender: Any) {
        UI.aLert(ui: self, title: "Thông báo", message: "Thành Công") { (unowned) in
            let revealViewController: SWRevealViewController = self.revealViewController()
            let mainStroryboarb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStroryboarb.instantiateViewController(withIdentifier: "MainController") as! MainController
            
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            DispatchQueue.main.async {
                revealViewController.pushFrontViewController(newFrontViewController, animated: true)
                //UIApplication.shared.delegate!.window!!.rootViewController = newFrontViewController
            }
        }
    }
    
}
