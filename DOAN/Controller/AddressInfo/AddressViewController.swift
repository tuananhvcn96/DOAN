//
//  AddressViewController.swift
//  DOAN
//
//  Created by Tuan Anh on 11/4/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
    
    static let identifier = "AddressViewController"

    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var CommentsTextView: UITextView!
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var MailTextField: UITextField!
    @IBOutlet weak var BillingAddressTextField: UITextField!
    @IBOutlet weak var ShippingAddressTextField: UITextField!
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var ZipCodetextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Info Address"
    }
    @IBAction func actionToPaymeny(_ sender: UIButton) {
        let stroryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = stroryboard.instantiateViewController(withIdentifier: PaymentViewController.identifier) as! PaymentViewController
        //vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
