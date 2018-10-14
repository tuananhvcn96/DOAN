//
//  LoginWithViewController.swift
//  DOAN
//
//  Created by T.A Savvycom on 10/9/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

protocol LoginWithDelegate: class {
    func checkSuccess(text: String, itemData: User)
}

class LoginWithViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var nameShowUIView: UIView!
    @IBOutlet weak var usernameUIView: UIView!
    @IBOutlet weak var passwordUIView: UIView!
    @IBOutlet weak var fabebookUIView: UIView!
    @IBOutlet weak var skypeUIView: UIView!
    @IBOutlet weak var signupUIView: UIView!
    @IBOutlet weak var usernameTextView: UITextView!
    @IBOutlet weak var passwordTextView: UITextView!
    var userInfo = [User]()
    weak var delegate: LoginWithDelegate?
    var itemUser: User?
    static let identifier = "LoginWithViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBorderUIView()
        // Do any additional setup after loading the view.
        
        usernameTextView.text = "User Name"
        passwordTextView.text = "Pass Word"
        usernameTextView.returnKeyType = .done
        passwordTextView.returnKeyType = .done
        
        usernameTextView.delegate = self
        passwordTextView.delegate = self
        
        userInfo = QueryLoaiSpModel.getInstance().getAllUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func checkUser()  {
        let indexPath = 0
        let user = userInfo[indexPath]
        let userName = usernameTextView.text!
        let passWord = passwordTextView.text!
        let userData = user.username
        let passData = user.password
        if userName == userData && passWord == passData {
            UI.aLert(ui: self, title: "Thông báo", message: "Thành Công") { (unowned) in
                self.dismiss(animated: true, completion: {
                    //self.delegate?.checkSuccess(text: userName, itemData: user)
                    
                })
            }
            UserDefaults.standard.set(userData, forKey: "ok")
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
        } else {

            UI.ALert(ui: self, title: "Kiểm tra", message: "Sai Mật Khẩu")
        }
    }

    func setupBorderUIView(){
        nameShowUIView.setBorder(radius: 7, color: UIColor.darkGray)
        usernameUIView.setBorder(radius: 7, color: UIColor.darkGray)
        passwordUIView.setBorder(radius: 7, color: UIColor.darkGray)
        fabebookUIView.setBorder(radius: 7)
        skypeUIView.setBorder(radius: 7)
        signupUIView.setBorder(radius: 7)
    }
    @IBAction func tapLogin(_ sender: Any) {
        self.checkUser()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "User Name"{
            textView.text = ""
        } else if (textView.text == "Pass Word"){
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if usernameTextView.text == "" {
            usernameTextView.text = "User Name"
        } else if passwordTextView.text == "" {
            passwordTextView.text = "Pass Word"
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        
        return true
    }
    
}
