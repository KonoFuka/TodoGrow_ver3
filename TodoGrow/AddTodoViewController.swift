//
//  AddTodoViewController.swift
//  TodoGrow
//
//  Created by 香野風花 on 2024/01/16.
//

import UIKit
import RealmSwift

class AddTodoViewController: UIViewController {
    
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var dayButton: UIButton!
    @IBOutlet var importanceSwitch: UISwitch!
    @IBOutlet var alarmSwitch: UISwitch!
    @IBOutlet var alarmButton: UIButton!
    @IBOutlet var repeatSwitch: UISwitch!
    @IBOutlet var repeatButton: UIButton!
    @IBOutlet var contentTextField: UITextField!
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func creareItem(item: TodoItem) {
        try! realm.write {
            realm.add(item)
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
