//
//  SubmitViewController.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/6/11.
//  Copyright © 2021 雀栎. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addr: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = PersonViewController.name
        addr.text = PersonViewController.addr
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
