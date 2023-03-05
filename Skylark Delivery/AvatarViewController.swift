//
//  AvatarViewController.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/6/11.
//  Copyright © 2021 雀栎. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {

    @IBOutlet weak var icon1: UIButton!
    @IBOutlet weak var icon2: UIButton!
    @IBOutlet weak var icon3: UIButton!
    @IBOutlet weak var icon4: UIButton!
    @IBOutlet weak var icon5: UIButton!
    @IBOutlet weak var icon6: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func icon1click(_ sender: Any) {
        PersonViewController.i = 0
    }
    @IBAction func icon2click(_ sender: Any) {
        PersonViewController.i = 1
    }
    @IBAction func icon3click(_ sender: Any) {
        PersonViewController.i = 2
    }
    @IBAction func icon4click(_ sender: Any) {
        PersonViewController.i = 3
    }
    @IBAction func icon5click(_ sender: Any) {
        PersonViewController.i = 4
    }
    @IBAction func icon6click(_ sender: Any) {
        PersonViewController.i = 5
    }
    

}
