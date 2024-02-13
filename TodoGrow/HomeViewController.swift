//
//  HomeViewController.swift
//  TodoGrow
//
//  Created by 香野風花 on 2024/02/06.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet var treeImageView: UIImageView!
//    @IBOutlet var waterButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var levelLabel: UILabel!
    
    var levelCount: Int!
    var level: Int!
    
    var outputValue : Int!
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        level = 0
        levelCount = 0

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if level <= 1{
            treeImageView.image = UIImage(named: "tree1")
        } else if level <= 5{
            treeImageView.image = UIImage(named: "tree2")
        } else if level <= 10 {
            treeImageView.image = UIImage(named: "tree3")
        } else if level <= 20 {
            treeImageView.image = UIImage(named: "tree4")
        } else if level <= 40 {
            treeImageView.image = UIImage(named: "tree5")
        } else if level <= 65 {
            treeImageView.image = UIImage(named: "tree6")
        } else if level <= 99 {
            treeImageView.image = UIImage(named: "tree7")
        } else if level >= 100 {
            treeImageView.image = UIImage(named: "tree8")
        }
    }
    
    @IBAction func water() {
        
//        let todoCount = realm.objects(TodoCount.self).value(forKey: "todocount")
        var todoCount = 20
        
        if todoCount >= 1 {
            todoCount -= 1
            levelCount += 1
//            print("水やり\(levelCount)残り\(todoCount)")
            if levelCount >= 5 {
                level += 1
                levelCount = 0
                print("レベル\(level)")
                if level <= 1{
                    treeImageView.image = UIImage(named: "tree1")
                } else if level <= 2{
                    treeImageView.image = UIImage(named: "tree2")
                } else if level <= 3 {
                    treeImageView.image = UIImage(named: "tree3")
                } else if level <= 20 {
                    treeImageView.image = UIImage(named: "tree4")
                } else if level <= 40 {
                    treeImageView.image = UIImage(named: "tree5")
                } else if level <= 65 {
                    treeImageView.image = UIImage(named: "tree6")
                } else if level <= 99 {
                    treeImageView.image = UIImage(named: "tree7")
                } else if level >= 100 {
                    treeImageView.image = UIImage(named: "tree8")
                }
            
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
