//
//  HomeViewController.swift
//  TodoGrow
//
//  Created by 香野風花 on 2024/02/06.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var treeImageView: UIImageView!
//    @IBOutlet var waterButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var levelLabel: UILabel!
    
    var todoCount: Int!
    var levelCount: Int!
    var level: Int!
    
    var outputValue : Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("\(todoCount)個完了(ホーム)")
    }
    
    @IBAction func water() {
        if todoCount > 1 {
            levelCount += 1
            if levelCount >= 10 {
                level += 1
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
