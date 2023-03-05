//
//  DetailViewController.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/6/10.
//  Copyright © 2021 雀栎. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var DetImg: UIImageView!
    @IBOutlet weak var DetName: UILabel!
    @IBOutlet weak var DetPrice: UILabel!
    @IBOutlet weak var DetDe: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var subBtn: UIButton!
    @IBOutlet weak var orderNum: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let selDish = "SELECT * FROM orders WHERE img = '" + DishTableViewController.imgname + "'"
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return}
        let dishResult = sqlite.execQuerySQL(sql: selDish)
        
        print(dishResult)
        
        let detimg = DishTableViewController.imgname
        let detname = dishResult?[0]["name"]
        let detprice = dishResult?[0]["price"]
        let detnum = dishResult?[0]["num"]
 
        DetImg.image = UIImage(named: detimg)
        DetName.text = detname as! String
        DetPrice.text = "$ " + (detprice as! NSNumber).stringValue
        DetDe.text = "This is a" + (detname as! String)
        orderNum.text = (detnum as! NSNumber).stringValue

        sqlite.closeDB()
        
    }
    
    var num = 0
    
    @IBAction func addNum(_ sender: UIButton) {
        
        num = num + 1
        orderNum.text = String(num)
        
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return}
        DatabaseInit.addNum(str: DishTableViewController.imgname)
        sqlite.closeDB()
        
        let selDish = "SELECT * FROM orders WHERE img = '" + DishTableViewController.imgname + "'"
        if !sqlite.openDB(){return}
        let dishResult = sqlite.execQuerySQL(sql: selDish)
        let detnum = dishResult?[0]["num"]
        print(detnum)
        
    }
    
    @IBAction func subNum(_ sender: UIButton) {
        if num>0{
            
            num = num - 1
            orderNum.text = String(num)
            
            
            let sqlite = SQLiteManager.sharedInstance
            if !sqlite.openDB(){return}
            DatabaseInit.subNum(str: DishTableViewController.imgname)
            sqlite.closeDB()
            
            let selDish = "SELECT * FROM orders WHERE img = '" + DishTableViewController.imgname + "'"
            if !sqlite.openDB(){return}
            let dishResult = sqlite.execQuerySQL(sql: selDish)
            let detnum = dishResult?[0]["num"]
            print(detnum)
        }
    }
    
}
