//
//  ViewController.swift
//  实验十二（2）
//
//  Created by apple on 2018/12/17.
//  Copyright © 2018年 wanfengling. All rights reserved.
//

import UIKit
import SQLite3
class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    let db = SQLiteDB.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = SQLiteDB.shared.open(dbPath: "", copyFile: true)
        print("result:\(result)")
        let r = db.execute(sql: "create table if not exists person(name varchar(20),phone varchar(20))")
        print("result:\(r)")
        print(NSHomeDirectory())
        print(Bundle.main .bundlePath)
        // Do any additional setup after loading the view, typically from a nib.
    }

    

    @IBAction func add(_ sender: Any) {
        //sqlite3_exec
       let r = db.execute(sql: "insert into person(name,phone) values('\(tfName.text!)','\(tfPhone.text!)')")
        print("result:\(r)")
    }
    
    @IBAction func update(_ sender: Any) {
        let r = db.execute(sql: "update person set phone = '\(tfPhone.text!)' where name = '\(tfName.text!)'")
        print("result:\(r)")
    }
    
    @IBAction func del(_ sender: Any) {
        let r = db.execute(sql: "delete from person set where name = '\(tfName.text!)'")
        print("result:\(r)")
    }
    
    
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\(tfName.text!)'")
        if let person = persons.first,let phone = person["phone"] as? String{
            tfPhone.text = phone
        }
    }
}

