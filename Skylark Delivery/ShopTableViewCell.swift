//
//  ShopTableViewCell.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/6/11.
//  Copyright © 2021 雀栎. All rights reserved.
//

import UIKit

class ShopTableViewCell: UITableViewCell {

    @IBOutlet weak var shopImg: UIImageView!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopPrice: UILabel!
    @IBOutlet weak var shopSub: UIButton!
    @IBOutlet weak var shopAdd: UIButton!
    @IBOutlet weak var shopNum: UILabel!
    @IBOutlet weak var shopTop: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func subNum(_ sender: Any) {
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return}
        sqlite.closeDB()
        
        let selDish = "SELECT * FROM orders WHERE img = '" + DishTableViewController.imgname + "'"
        if !sqlite.openDB(){return}
        let dishResult = sqlite.execQuerySQL(sql: selDish)
        let detnum = dishResult?[0]["num"]
        print(detnum)
        
        if ((detnum as! NSNumber) as! Int)>0{
            let sqlite = SQLiteManager.sharedInstance
            if !sqlite.openDB(){return}
            DatabaseInit.subNum(str: DishTableViewController.imgname)
            sqlite.closeDB()
            
            let selDish = "SELECT * FROM orders WHERE img = '" + DishTableViewController.imgname + "'"
            if !sqlite.openDB(){return}
            let dishResult = sqlite.execQuerySQL(sql: selDish)
            let detnum = dishResult?[0]["num"]
            print(detnum)
            
            shopNum.text = (detnum as! NSNumber).stringValue
            
            ShopViewController.tota = ShopViewController.calculate()
        }
    }
    
    @IBAction func addNum(_ sender: Any) {
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return}
        DatabaseInit.addNum(str: DishTableViewController.imgname)
        sqlite.closeDB()
        
        let selDish = "SELECT * FROM orders WHERE img = '" + DishTableViewController.imgname + "'"
        if !sqlite.openDB(){return}
        let dishResult = sqlite.execQuerySQL(sql: selDish)
        let detnum = dishResult?[0]["num"]
        print(detnum)
        
        shopNum.text = (detnum as! NSNumber).stringValue
        
        ShopViewController.tota = ShopViewController.calculate()
        
    }
    
}
