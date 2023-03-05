//
//  ResTableViewController.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/6/10.
//  Copyright © 2021 雀栎. All rights reserved.
//

import UIKit

class ResTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let sqlite = SQLiteManager.sharedInstance
        sqlite.openDB()
        let queryResult = sqlite.execQuerySQL(sql: "SELECT * FROM restaurant")
        sqlite.closeDB()
        return queryResult?.count ?? 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resCell", for: indexPath) as! ResTableViewCell
        
        let sqlite = SQLiteManager.sharedInstance
        sqlite.openDB()
        let queryResult = sqlite.execQuerySQL(sql: "SELECT * FROM restaurant")
        sqlite.closeDB()
        
        cell.resImg.image = UIImage(named: queryResult?[indexPath.row]["img"] as! String)
        cell.nameLabel.text = queryResult?[indexPath.row]["name"] as! String

        return cell
    }
    
    static var num = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResToDish"{
            let selRes = self.tableView.indexPathForSelectedRow
            ResTableViewController.num = selRes?.row ?? 0
            print(ResTableViewController.num)
        }
        
    }

}
