//
//  SQLiteManager.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/6/9.
//  Copyright © 2021 雀栎. All rights reserved.
//

import Foundation

class SQLiteManager:NSObject //封装数据库操作
{
    private var dbPath:String!
    private var database:OpaquePointer? = nil
    
    static var sharedInstance:SQLiteManager
    {
        return SQLiteManager()
    }
    
    override init()
    {
        super.init()
        
        let dirpath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        dbPath = dirpath.appendingPathComponent("app.sqlite").path
    }
    
    //open database 打开数据库
    func openDB() -> Bool{
        //let cPath = dbPath.cString(using:String.Encoding.utf8)
        let result = sqlite3_open(dbPath, &database) //文件名不存在，自动创建
        if result != SQLITE_OK{
            print("fail to open database")
            return false
        }
        return true
    }
    
    //close database 关闭数据库
    func closeDB(){
        sqlite3_close(database)
    }
    
    //execute the statement: creat, insert, update, delete 增删改数据库
    func execNoneQuerySQL(sql : String) -> Bool{
        var errMsg:UnsafeMutablePointer<Int8>? = nil
        let cSql = sql.cString(using: String.Encoding.utf8)!
        
        /*
        参数
        1. db：OpaquePointer！ 已打开数据库句柄
        2. sql：执行的sql
        3. callback：回调函数
        4. 自定义指针，会传递到回调函数内
        5. errmsg：错误信息
        */
        
        if sqlite3_exec(database, cSql, nil, nil, &errMsg) == SQLITE_OK{
            return true
        }
        let msg = String.init(cString: errMsg!)
        print(msg)
        return false
    }
    
    //execute the statement: select  查数据库
    func execQuerySQL(sql : String) -> [[String: AnyObject]]? {
        let cSql = sql.cString(using: String.Encoding.utf8)!
        var statement:OpaquePointer? = nil
        
        /*
        参数
        1. db：已打开数据库句柄
        2. zSql：要执行的SQL语句
        3. nByte：以字节为单位的sql语句长度，-1自动计算
        4. ppStmt：语句句柄，据此获取查询结果
           需要调用 sqlite3_finalize 释放
        5. _ pzTail：未使用的指针地址，通常传入nil
        */
        if sqlite3_prepare_v2(database, cSql, -1, &statement, nil) != SQLITE_OK{
            sqlite3_finalize(statement)
            print("执行\(sql)错误\n")
            let errmsg = sqlite3_errmsg(database)
            if errmsg != nil{
                print(errmsg!)
            }
            return nil
        }
        
        var rows = [[String: AnyObject]]()
        
        while sqlite3_step(statement) == SQLITE_ROW{
            rows.append(record(stmt: statement!))
        }
        sqlite3_finalize(statement)
        return rows
    }
    
    private func record(stmt: OpaquePointer) -> [String: AnyObject]{
        var row = [String: AnyObject]()
        //遍历所有列，获取每一列的信息
        for col in 0 ..< sqlite3_column_count(stmt){
            let cName = sqlite3_column_name(stmt, col) //获取列名
            let name = String(cString: cName!, encoding: String.Encoding.utf8)
            
            var value: AnyObject?
            switch(sqlite3_column_type(stmt, col)){
            case SQLITE_FLOAT:
                value = sqlite3_column_double(stmt, col) as AnyObject
            case SQLITE_INTEGER:
                value = Int(sqlite3_column_int(stmt, col)) as AnyObject
            case SQLITE_TEXT:
                let cText = sqlite3_column_text(stmt, col)
                value = String.init(cString: cText!) as AnyObject
            case SQLITE_NULL:
                value = NSNull()
            default:
                print("The data type is not supported!")
            }
            row[name!] = value ?? NSNull()
        }
        return row
    }
}
