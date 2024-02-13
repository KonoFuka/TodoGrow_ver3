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
    
    let deviceWidth = UIScreen.main.bounds.width
    let deviceHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        level = 0
        levelCount = 0

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //画像の表示
        if level <= 1{
            treeImageView.frame =  CGRect(x:deviceWidth/2 - 25, y: deviceHeight/2 + 50, width:50 , height: 50)
            treeImageView.image = UIImage(named: "tree1")
        } else if level <= 5{
            treeImageView.frame =  CGRect(x:deviceWidth/2 - 25, y: deviceHeight/2 + 50, width:50 , height: 50)
            treeImageView.image = UIImage(named: "tree2")
        } else if level <= 10 {
            treeImageView.frame =  CGRect(x:deviceWidth/2 - 25, y: deviceHeight/2 + 50, width:50 , height: 50)
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
            if levelCount >= 1 {
                level += 1
                levelCount = 0
                print("レベル\(level)")
                if level <= 1{
                    treeImageView.frame =  CGRect(x:deviceWidth/2 - 25, y: deviceHeight/2 + 50, width:50 , height: 50)
                    treeImageView.image = UIImage(named: "tree1")
                } else if level <= 2{
                    treeImageView.frame =  CGRect(x:deviceWidth/2 - 50, y: deviceHeight/2 + 50, width:100 , height: 100)
                    treeImageView.image = UIImage(named: "tree2")
                } else if level <= 3 {
                    treeImageView.frame =  CGRect(x:deviceWidth/2 - 75, y: deviceHeight/2 + 50, width:150 , height: 150)
                    treeImageView.image = UIImage(named: "tree3")
                } else if level <= 20 {
                    treeImageView.frame =  CGRect(x:deviceWidth/2 - 75, y: deviceHeight/2 + 50, width:150 , height: 50)
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
                    treeImageView.frame =  CGRect(x:deviceWidth/2 - 150, y: deviceHeight/2 + 50, width:300 , height: 300)
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
