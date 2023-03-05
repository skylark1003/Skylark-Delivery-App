//
//  ViewController.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/5/28.
//  Copyright © 2021 雀栎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DatabaseInit.initDB()
        // Do any additional setup after loading the view.
        
    }

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    @IBAction func loginPress(_ sender: Any) {
        let userword = txtUser.text!
        let password = txtPass.text!
        
        if userword == "skylark" && password == "20001003"{  //账号密码正确时跳转
            self.performSegue(withIdentifier: "loginToMain", sender: self)
        }else{   //否则提示密码错误，清空密码
            let p = UIAlertController(title: "Login Failed", message: "Wrong username or password.", preferredStyle: .alert)
            p.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(act:UIAlertAction)in self.txtPass.text=""}))
            present(p, animated: false,completion: nil)
        }
    }
    @IBAction func endUser(_ sender: UITextField) {
        txtUser.resignFirstResponder()
    }
    @IBAction func endPass(_ sender: UITextField) {
        txtPass.resignFirstResponder()
    }
    
}

