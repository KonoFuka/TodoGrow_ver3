//
//  ViewController.swift
//  TodoGrow
//
//  Created by 香野風花 on 2023/12/12.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet var tableview: UITableView!
    
    let realm = try! Realm()
    var items: [TodoItem] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.dataSource = self
                tableview.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
                items = readItems()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            items = readItems()
            tableview.reloadData()
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
            return items.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
            let item: TodoItem = items[indexPath.row]
            cell.setCell(title: item.title, day: item.day, isMarked: item.isMarked)
            
            return cell
        }
    
    func readItems() -> [TodoItem]{
            return Array(realm.objects(TodoItem.self))
        }


}

