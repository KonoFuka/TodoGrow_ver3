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

    let todoCount = TodoCount()
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet var popUp : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItems()
        
        //セルの高さの設定
        tableview.rowHeight = 75
        
        // 全データの取得
        let results = realm.objects(TodoItem.self)
        print(results)
        
        let todoCount = realm.objects(TodoCount.self).value(forKey: "todocount")
        
        //ステータスバー
        var appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.582303226, green: 0.7785794139, blue: 0.5700367689, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor:UIColor.white]
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        
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
        cell.setCell(title: item.title, day: item.day, isMarked: item.isMarked, isdone: item.isdone)
        
        return cell
    }
    
    func readItems() -> [TodoItem]{
        return Array(realm.objects(TodoItem.self))
    }
    
    //popupbuttonの設定
    func popupButton(){
        popUp.menu = UIMenu(children: [
            UIAction(title: "1つ目", state: .on, handler:{_ in
               
            }),
            UIAction(title: "2つ目", state: .on, handler:{_ in
            
            }),
            UIAction(title: "3つ目", state: .on, handler:{_ in
            
            })
        ])
        popUp.showsMenuAsPrimaryAction = true
        popUp.changesSelectionAsPrimaryAction = true
    }
    
    //セルのタップ
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let target = items[indexPath.row]
        
        if target.isdone == true{
            print("\(indexPath.row)番目が解除")
            
            do{
                try realm.write{
                    target.isdone = false
                }
            }catch {
                print("Error \(error)")
            }
        }else {
            print("\(indexPath.row)番目が完了")
            
            do{
                try realm.write{
                    if let existingTodoCount = realm.objects(TodoCount.self).first {
                        existingTodoCount.todocount += 1
                    } else {
                        let newTodoCount = TodoCount()
                        newTodoCount.todocount = 1
                        realm.add(newTodoCount)
                    }
                    target.isdone = true
                }
            }catch {
                print("Error \(error)")
            }
        }
        items = readItems()
        tableview.reloadData()
    }
}

//セルのスワイプ
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        //削除のアクション
        let deleteAction = UIContextualAction(style: .destructive, title: "削除") { [self] (action, view, completionHandler) in
            completionHandler(true)
            print("\(indexPath.row)番目の削除")
            
            let target = items[indexPath.row]
            do{
              try realm.write{
                realm.delete(target)
              }
            }catch {
              print("Error \(error)")
            }
            items = readItems()
            tableView.reloadData()
        }

        //編集のアクション
        let editAction = UIContextualAction(style: .destructive, title: "編集") { [self] (action, view, completionHandler) in

            let edit = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
            self.navigationController?.pushViewController(edit, animated: true)

            edit.number = (indexPath.row)

            tableView.reloadData()
            completionHandler(true)
            
            print("\(indexPath.row)番目の編集")
        }
        
        editAction.backgroundColor = UIColor(red: 132/255, green: 189/255, blue: 127/255, alpha: 1.0)
        
        //アクションの設定
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction,editAction])
        return configuration
    }
}
