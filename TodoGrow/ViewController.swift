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

//セルのスワイプ
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        //削除のアクション
        let deleteAction = UIContextualAction(style: .destructive, title: "削除") { [self] (action, view, completionHandler) in

            completionHandler(true)
            
            print("削除")
            
            tableView.reloadData()
        }


        //編集のアクション
        let editAction = UIContextualAction(style: .destructive, title: "編集") { [self] (action, view, completionHandler) in

            let edit = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
            self.navigationController?.pushViewController(edit, animated: true)

            edit.number = (indexPath.row)

            tableView.reloadData()
            completionHandler(true)
            
            print("編集")
        }

        editAction.backgroundColor = UIColor.gray
        
        //アクションの設定
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction,editAction])
        return configuration
    }
}
