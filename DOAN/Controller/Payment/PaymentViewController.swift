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

}
