//
//  RegistrationViewController.swift
//  DOAN
//
//  Created by T.A Savvycom on 10/9/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    static let iddentifer = "RegistrationViewController"
    
    @IBOutlet weak var nameUIView: UIView!
    @IBOutlet weak var signupUIView: UIView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupUIView()
        nameTF.delegate = self
        emailTF.delegate = self
        usernameTF.delegate = self
        passwordTF.delegate = self
    }
    
    func setupUIView() {
        nameUIView.setBorder(radius: 7, color: UIColor.white)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func tap(_ sender: Any) {
        let result = checkCantAdd()
        
        if result.succuess {
            let newUserInfo: User = User()
            newUserInfo.name = nameTF.text!
            newUserInfo.email = emailTF.text!
            newUserInfo.username = usernameTF.text!
            newUserInfo.password = passwordTF.text!
            
            let isInserted = QueryLoaiSpModel.getInstance().insertUser(newUserInfo)
            if isInserted {
                Util.invokeAlertMethod(strTitle: "", strBody: "Thêm thành công", delegate: check() as AnyObject)
                
            } else {
                Util.invokeAlertMethod(strTitle: "", strBody: "Thêm thất bại", delegate: nil)
            }
        } else {
            UI.ALert(ui: self, title: "Error", message: result.error)
        }
    }
    
    func check(){
        nameTF.text = ""
        emailTF.text = ""
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func backButton(_ sender: Any) {
        
    }
    
    func checkCantAdd() -> (succuess: Bool, error: String) {
        var success = false
        var error = ""
        
        if usernameTF.text?.count == 0 {
            error += "Xin mời nhập tên đăng nhập \n"
        }
        if passwordTF.text?.count == 0 {
            error += "Xin mời nhập mật mã \n"
        }
        
        success = error.count == 0
        
        return (success,error)
    }
    
}
