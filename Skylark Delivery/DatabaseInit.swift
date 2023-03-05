//
//  DatabaseInit.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/6/9.
//  Copyright © 2021 雀栎. All rights reserved.
//

import Foundation

class DatabaseInit
{
    static func initDB()
    {
        let sqlite = SQLiteManager.sharedInstance
        
        if !sqlite.openDB(){return}
        
        let createRestaurant = "CREATE TABLE IF NOT EXISTS restaurant('img' TEXT, 'name' TEXT);"  //创建餐厅表
        if !sqlite.execNoneQuerySQL(sql: createRestaurant) { sqlite.closeDB() ; return}
        
        let deleteRestaurant = "DELETE FROM restaurant"
        if !sqlite.execNoneQuerySQL(sql: deleteRestaurant) { sqlite.closeDB() ; return }
        
        //let resetRestaurant = "DELETE FROM sqlite_sequence WHERE name = 'restaurant';"
        //if !sqlite.execNoneQuerySQL(sql: resetRestaurant) { sqlite.closeDB() ; return }
        
        let restaurant01 = "INSERT INTO restaurant(img,name) VALUES('McDonalds','McDonald''s');"
        let restaurant02 = "INSERT INTO restaurant(img,name) VALUES('Dunkin','Dunkin'' Donuts');"
        let restaurant03 = "INSERT INTO restaurant(img,name) VALUES('kfc','KFC');"
        let restaurant04 = "INSERT INTO restaurant(img,name) VALUES('Starbucks','Starbucks');"
        
        if !sqlite.execNoneQuerySQL(sql: restaurant01) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: restaurant02) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: restaurant03) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: restaurant04) { sqlite.closeDB() ; return }
        
        let dropDish = "DROP TABLE IF EXISTS dish"
        if !sqlite.execNoneQuerySQL(sql: dropDish) { sqlite.closeDB() ; return}
        
        let createDish = "CREATE TABLE IF NOT EXISTS dish('img' TEXT, 'name' TEXT, 'rest' TEXT, 'price' TEXT)"  //创建各个餐厅的菜品
        if !sqlite.execNoneQuerySQL(sql: createDish) { sqlite.closeDB() ; return}
        
        let deleteDish = "DELETE FROM dish"
        if !sqlite.execNoneQuerySQL(sql: deleteDish) { sqlite.closeDB() ; return }
        
        //let resetDish = "DELETE FROM sqlite_sequence WHERE name = 'dish';"
        //if !sqlite.execNoneQuerySQL(sql: resetDish) { sqlite.closeDB() ; return }
        
        let dish01 = "INSERT INTO dish(img, name, rest, price) VALUES('kfc01', 'Original Recipe', 'kfc', '12');"
        let dish02 = "INSERT INTO dish(img, name, rest, price) VALUES('kfc02', 'Zinger Burger', 'kfc', '17');"
        let dish03 = "INSERT INTO dish(img, name, rest, price) VALUES('kfc03', 'Popcorn Chicken', 'kfc', '10');"
        let dish04 = "INSERT INTO dish(img, name, rest, price) VALUES('kfc04', 'Mexican Twister', 'kfc', '16');"
        let dish05 = "INSERT INTO dish(img, name, rest, price) VALUES('kfc05', 'Hot Wings', 'kfc', '13');"
        
        let dish06 = "INSERT INTO dish(img, name, rest, price) VALUES('mc01', 'Cheese Burger', 'mc', '8');"
        let dish07 = "INSERT INTO dish(img, name, rest, price) VALUES('mc02', 'French Fries', 'mc', '12');"
        let dish08 = "INSERT INTO dish(img, name, rest, price) VALUES('mc03', 'Hot Chocolate', 'mc', '14');"
        let dish09 = "INSERT INTO dish(img, name, rest, price) VALUES('mc04', 'Dip Cone', 'mc', '6');"
        let dish10 = "INSERT INTO dish(img, name, rest, price) VALUES('mc05', 'Shakes', 'mc', '11');"
        
        let dish11 = "INSERT INTO dish(img, name, rest, price) VALUES('star01', 'Caramel Macchiato', 'star', '34');"
        let dish12 = "INSERT INTO dish(img, name, rest, price) VALUES('star02', 'Coffee Frappuccino', 'star', '25');"
        let dish13 = "INSERT INTO dish(img, name, rest, price) VALUES('star03', 'Cheese Cake', 'star', '29');"
        let dish14 = "INSERT INTO dish(img, name, rest, price) VALUES('star04', 'Tiramisu', 'star', '16');"
        let dish15 = "INSERT INTO dish(img, name, rest, price) VALUES('star05', 'Vegetable Salad', 'star', '23');"
        
        let dish16 = "INSERT INTO dish(img, name, rest, price) VALUES('duk01', 'Icing Doughnuts', 'duk', '48');"
        let dish17 = "INSERT INTO dish(img, name, rest, price) VALUES('duk02', 'Ice Caramel Latte', 'duk', '12');"
        let dish18 = "INSERT INTO dish(img, name, rest, price) VALUES('duk03', 'Coffee', 'duk', '20');"
        let dish19 = "INSERT INTO dish(img, name, rest, price) VALUES('duk04', 'Croissants', 'duk', '21');"
        let dish20 = "INSERT INTO dish(img, name, rest, price) VALUES('duk05', 'Cinnamon Roll', 'duk', '15');"
        
        if !sqlite.execNoneQuerySQL(sql: dish01) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish02) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish03) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish04) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish05) { sqlite.closeDB() ; return }
        
        if !sqlite.execNoneQuerySQL(sql: dish06) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish07) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish08) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish09) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish10) { sqlite.closeDB() ; return }
        
        if !sqlite.execNoneQuerySQL(sql: dish11) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish12) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish13) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish14) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish15) { sqlite.closeDB() ; return }
        
        if !sqlite.execNoneQuerySQL(sql: dish16) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish17) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish18) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish19) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: dish20) { sqlite.closeDB() ; return }
        
        let dropOrders = "DROP TABLE IF EXISTS orders"
        if !sqlite.execNoneQuerySQL(sql: dropOrders) { sqlite.closeDB() ; return}
        
        let createOrders = "CREATE TABLE IF NOT EXISTS orders('img' TEXT, 'name' TEXT, 'num' INTEGER, 'price' INTEGER)"  //创建各个餐厅的菜品
        if !sqlite.execNoneQuerySQL(sql: createOrders) { sqlite.closeDB() ; return}
        
        let deleteOrders = "DELETE FROM orders"
        if !sqlite.execNoneQuerySQL(sql: deleteOrders) { sqlite.closeDB() ; return }
        
        let order01 = "INSERT INTO orders(img, name, num, price) VALUES('kfc01', 'Original Recipe', 0, 12);"
        let order02 = "INSERT INTO orders(img, name, num, price) VALUES('kfc02', 'Zinger Burger', 0, 17);"
        let order03 = "INSERT INTO orders(img, name, num, price) VALUES('kfc03', 'Popcorn Chicken', 0, 10);"
        let order04 = "INSERT INTO orders(img, name, num, price) VALUES('kfc04', 'Mexican Twister', 0, 16);"
        let order05 = "INSERT INTO orders(img, name, num, price) VALUES('kfc05', 'Hot Wings', 0, 13);"
        
        let order06 = "INSERT INTO orders(img, name, num, price) VALUES('mc01', 'Cheese Burger', 0, 8);"
        let order07 = "INSERT INTO orders(img, name, num, price) VALUES('mc02', 'French Fries', 0, 12);"
        let order08 = "INSERT INTO orders(img, name, num, price) VALUES('mc03', 'Hot Chocolate', 0, 14);"
        let order09 = "INSERT INTO orders(img, name, num, price) VALUES('mc04', 'Dip Cone', 0, 6);"
        let order10 = "INSERT INTO orders(img, name, num, price) VALUES('mc05', 'Shakes', 0, 11);"
        
        let order11 = "INSERT INTO orders(img, name, num, price) VALUES('star01', 'Caramel Macchiato', 0, 34);"
        let order12 = "INSERT INTO orders(img, name, num, price) VALUES('star02', 'Coffee Frappuccino', 0, 25);"
        let order13 = "INSERT INTO orders(img, name, num, price) VALUES('star03', 'Cheese Cake', 0, 29);"
        let order14 = "INSERT INTO orders(img, name, num, price) VALUES('star04', 'Tiramisu', 0, 16);"
        let order15 = "INSERT INTO orders(img, name, num, price) VALUES('star05', 'Vegetable Salad', 0, 23);"
        
        let order16 = "INSERT INTO orders(img, name, num, price) VALUES('duk01', 'Icing Doughnuts', 0, 48);"
        let order17 = "INSERT INTO orders(img, name, num, price) VALUES('duk02', 'Ice Caramel Latte', 0, 12);"
        let order18 = "INSERT INTO orders(img, name, num, price) VALUES('duk03', 'Coffee', 0, 20);"
        let order19 = "INSERT INTO orders(img, name, num, price) VALUES('duk04', 'Croissants', 0, 21);"
        let order20 = "INSERT INTO orders(img, name, num, price) VALUES('duk05', 'Cinnamon Roll', 0, 15);"
        
        if !sqlite.execNoneQuerySQL(sql: order01) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order02) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order03) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order04) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order05) { sqlite.closeDB() ; return }
        
        if !sqlite.execNoneQuerySQL(sql: order06) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order07) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order08) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order09) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order10) { sqlite.closeDB() ; return }
        
        if !sqlite.execNoneQuerySQL(sql: order11) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order12) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order13) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order14) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order15) { sqlite.closeDB() ; return }
        
        if !sqlite.execNoneQuerySQL(sql: order16) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order17) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order18) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order19) { sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: order20) { sqlite.closeDB() ; return }
        
        sqlite.closeDB();
        
    }
    
    static func addNum(str:String){  //增加份数
        
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return}
        
        let addItem = "update orders set num = num + 1 where img = '" + str + "'"
        if !sqlite.execNoneQuerySQL(sql: addItem) { sqlite.closeDB() ; return }
        
        sqlite.closeDB()
    }
    
    static func subNum(str:String){  //减少份数
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return}
        
        let subItem = "update orders set num = num - 1 where img = '" + str + "'"
        if !sqlite.execNoneQuerySQL(sql: subItem) { sqlite.closeDB() ; return }
        
        sqlite.closeDB()
    }
    
    static func GetRes() //测试用
    {
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return}
        let queryResult = sqlite.execQuerySQL(sql: "SELECT * FROM orders")
        
        print(queryResult!)
        for row in queryResult!{
            print(row["name"])
        }
        sqlite.closeDB();
    }
    
    
}
