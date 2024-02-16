
//  HomeViewController.swift
//  TodoGrow
//
//  Created by 香野風花 on 2024/02/06.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var waterButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var levelLabel: UILabel!
    
    var levelCount: Int!
    var level: Int!
    
    let realm = try! Realm()
    
    //画面の大きさを取得
    let deviceWidth = UIScreen.main.bounds.width
    let deviceHeight = UIScreen.main.bounds.height
    
    //保存されてる水の回数
    let waterCount = WaterCount()
    //今このフィールド用、すでにあげた回数
    var watercount: Int = 0
    //あげられる回数
    var canWater: Int = 0
    //すでに終わっているタスク
    var doneTask: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //仮設定、後で変える
        level = 2
        levelCount = 0
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //タスク周り
        if let existingTodoCount = realm.objects(TodoCount.self).first {
            //終わったタスクの数をrealmからとって、doneTaskに入れる
            doneTask = existingTodoCount.todocount
        }
        
        //水回り
        if let existingWaterCount = realm.objects(WaterCount.self).first {
            //既存のTodoCountがある場合は、数を増やす
            watercount = existingWaterCount.water
            print("\(watercount)回水やり済み")
        } else {
            //既存のTodoCountがない場合は、新しいTodoCountを作成
            let newWaterCount = WaterCount()
            newWaterCount.water = 0
            try! realm.write {
                realm.add(newWaterCount)
            }
            print("一回も水あげてない")
        }
        
        canWater = doneTask - watercount
        print("\(canWater)回水やり可能")
        
        setTree()
    }
    
    @IBAction func water() {
        
        if canWater >= 1 {
            canWater -= 1
            levelCount += 1
            
            //水やりした回数を保存
            do{
                try realm.write{
                    if let existingWaterCount = realm.objects(WaterCount.self).first {
                        existingWaterCount.water += 1
                    }
                }
            }catch {
                print("Error \(error)")
            }
            
            let existingWaterCount = realm.objects(WaterCount.self).first
            watercount = existingWaterCount!.water
            
            print("\(watercount)回水やり済み\(canWater)回水やり可能")
            
            //仮設定
            if levelCount >= 1 {
                level += 1
                levelCount = 0
                
                setTree()
            }
        }
    }
    
    func setTree() {
        print("木の画像セット")
        if level <= 1{
            treeImageView.frame =  CGRect(x:deviceWidth/2 - 25, y: deviceHeight/2 + 50, width:50 , height: 50)
            treeImageView.image = UIImage(named: "tree1")
        } else if level <= 2{
            treeImageView.frame =  CGRect(x:deviceWidth/2 - 40, y: deviceHeight/2 + 50, width:80, height: 80)
            treeImageView.image = UIImage(named: "tree2")
        } else if level <= 3 {
            treeImageView.frame =  CGRect(x:deviceWidth/2 - 45, y: deviceHeight/2 + 50, width:90 , height: 90)
            treeImageView.image = UIImage(named: "tree3")
        } else if level <= 20 {
            treeImageView.frame =  CGRect(x:deviceWidth/2 - 50, y: deviceHeight/2 + 50, width:100 , height: 100)
            treeImageView.image = UIImage(named: "tree4")
        } else if level <= 40 {
            treeImageView.frame =  CGRect(x:deviceWidth/2 - 25, y: deviceHeight/2 + 50, width:50 , height: 50)
            treeImageView.image = UIImage(named: "tree5")
        } else if level <= 65 {
            treeImageView.frame =  CGRect(x:deviceWidth/2 - 25, y: deviceHeight/2 + 50, width:50 , height: 50)
            treeImageView.image = UIImage(named: "tree6")
        } else if level <= 99 {
            treeImageView.frame =  CGRect(x:deviceWidth/2 - 25, y: deviceHeight/2 + 50, width:50 , height: 50)
            treeImageView.image = UIImage(named: "tree7")
        } else if level >= 100 {
            treeImageView.frame =  CGRect(x:deviceWidth/2 - 25, y: deviceHeight/2 + 50, width:50 , height: 50)
            treeImageView.image = UIImage(named: "tree8")
        }
    }
}
