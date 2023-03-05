//
//  PersonViewController.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/6/9.
//  Copyright © 2021 雀栎. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var avater: UIImageView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var addrTxt: UITextField!
    @IBOutlet weak var okBtn: UIButton!
    
    @IBAction func namein(_ sender: UITextField) {
        nameTxt.resignFirstResponder()
    }
    @IBAction func addrin(_ sender: UITextField) {
        addrTxt.resignFirstResponder()
    }
    
    static var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch PersonViewController.i{
        case 0:avater.image = UIImage(named: "people01_30")
        case 1:avater.image = UIImage(named: "people02_30")
        case 2:avater.image = UIImage(named: "people03_30")
        case 3:avater.image = UIImage(named: "people04_30")
        case 4:avater.image = UIImage(named: "people05_30")
        case 5:avater.image = UIImage(named: "people06_30")
        default:avater.image = UIImage(named: "people01_30")
        }

        nameTxt.text = PersonViewController.name
        addrTxt.text = PersonViewController.addr
        // Do any additional setup after loading the view.
    }
    
    static var name = "Skylark"
    static var addr = "Wuhan University"
    @IBAction func okClick(_ sender: Any) {
        PersonViewController.name = nameTxt.text ?? "Skylark"
        PersonViewController.addr = addrTxt.text ?? "Wuhan University"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        switch PersonViewController.i{
        case 0:avater.image = UIImage(named: "people01_30")
        case 1:avater.image = UIImage(named: "people02_30")
        case 2:avater.image = UIImage(named: "people03_30")
        case 3:avater.image = UIImage(named: "people04_30")
        case 4:avater.image = UIImage(named: "people05_30")
        case 5:avater.image = UIImage(named: "people06_30")
        default:avater.image = UIImage(named: "people01_30")
        }
        
        nameTxt.text = PersonViewController.name
        addrTxt.text = PersonViewController.addr
    }

}
