//
//  DishTableViewController.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/6/10.
//  Copyright © 2021 雀栎. All rights reserved.
//

import UIKit

class DishTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let selKfc = "SELECT * FROM dish WHERE rest = 'kfc'"
    let selMc = "SELECT * FROM dish WHERE rest = 'mc'"
    let selStar = "SELECT * FROM dish WHERE rest = 'star'"
    let selDuk = "SELECT * FROM dish WHERE rest = 'duk'"
    var selRes:String = ""

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sqlite = SQLiteManager.sharedInstance
        sqlite.openDB()
        let queryResult = sqlite.execQuerySQL(sql: selKfc)
        sqlite.closeDB()
        return queryResult?.count ?? 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dishCell", for: indexPath) as! DishTableViewCell
        
        switch ResTableViewController.num{
        case 0:selRes = selMc
        case 1:selRes = selDuk
        case 2:selRes = selKfc
        case 3:selRes = selStar
        default:selRes = selKfc
        }
        
        let sqlite = SQLiteManager.sharedInstance
        sqlite.openDB()
        let dishResult = sqlite.execQuerySQL(sql: selRes)
        sqlite.closeDB()
        
        cell.dishImg.image = UIImage(named: dishResult?[indexPath.row]["img"]as! String)
        cell.dishName.text = dishResult?[indexPath.row]["name"]as? String
        cell.dishPrice.text = "Price: $" + (dishResult?[indexPath.row]["price"]as? String ?? "")
        
        // Configure the cell...
 
        return cell
    }
    
    static var num = 0
    static var res = ""
    static var imgname = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DishToDetail"{
            let selDish = self.tableView.indexPathForSelectedRow
            DishTableViewController.num = selDish?.row ?? 0
            
            switch ResTableViewController.num{
            case 0:DishTableViewController.res = "mc0"
            case 1:DishTableViewController.res = "duk0"
            case 2:DishTableViewController.res = "kfc0"
            case 3:DishTableViewController.res = "star0"
            default:DishTableViewController.res = "mc0"
            }
            
            DishTableViewController.imgname = DishTableViewController.res + String(DishTableViewController.num + 1)
            
            print(DishTableViewController.imgname)
        }
    }
}
