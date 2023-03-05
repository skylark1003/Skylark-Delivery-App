//
//  ShopViewController.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/6/11.
//  Copyright © 2021 雀栎. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let selShop = "SELECT * FROM orders WHERE num <> 0"
        let sqlite = SQLiteManager.sharedInstance
        sqlite.openDB()
        let queryResult = sqlite.execQuerySQL(sql: selShop)
        sqlite.closeDB()
        return queryResult?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as! ShopTableViewCell
        
        let selShop = "SELECT * FROM orders WHERE num <> 0"
        let sqlite = SQLiteManager.sharedInstance
        sqlite.openDB()
        let queryResult = sqlite.execQuerySQL(sql: selShop)
        sqlite.closeDB()
        
        cell.shopImg.image = UIImage(named: queryResult?[indexPath.row]["img"]as! String)
        cell.shopName.text = queryResult?[indexPath.row]["name"]as! String
        cell.shopPrice.text = (queryResult?[indexPath.row]["price"]as! NSNumber).stringValue
        cell.shopNum.text = (queryResult?[indexPath.row]["num"]as! NSNumber).stringValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    static var tota = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShopViewController.tota = ShopViewController.calculate()
        total.text = "Total: $ " + String(ShopViewController.tota)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var total: UILabel!
    @IBAction func flushed(_ sender: Any) {
        total.text = "Total: $ " + String(ShopViewController.tota)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    static func calculate ()->Int{
        let selShop = "SELECT * FROM orders WHERE num <> 0"
        let sqlite = SQLiteManager.sharedInstance
        sqlite.openDB()
        let queryResult = sqlite.execQuerySQL(sql: selShop)
        sqlite.closeDB()
        
        var totalprice = 0
        for row in queryResult!{
            let numstr = (row["num"] as! NSNumber).stringValue
            let pricestr = (row["price"] as! NSNumber).stringValue
            let numint = Int(numstr)
            let priceint = Int(pricestr)
            totalprice = totalprice + numint! * priceint!
        }
        return totalprice

    }
    
    

}
