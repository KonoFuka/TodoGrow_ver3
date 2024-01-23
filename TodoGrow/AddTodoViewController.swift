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
    @IBOutlet var dayPicker: UIDatePicker!
    
    @IBOutlet var importanceSwitch: UISwitch!
    
    @IBOutlet var alarmSwitch: UISwitch!
    @IBOutlet var alarmButton: UIButton!
    @IBOutlet var alarmpicker: UIDatePicker!
    
    @IBOutlet var repeatSwitch: UISwitch!
    @IBOutlet var repeatButton: UIButton!
    @IBOutlet var repeatpicker: UIPickerView!
    
    @IBOutlet var contentTextField: UITextField!
    
    
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(){
        let item = TodoItem()
        item.title = titleTextField.text ?? ""
//        item.day = String(dayPicker.date) ?? ""
//        item.alarm = String(alarmpicker.date) ?? ""
//        item.Repeat = String(repeatpicker) ?? ""
        item.isMarked = importanceSwitch.isOn
        item.content = contentTextField.text ?? ""
        
        creareItem(item: item)
        
        self.dismiss(animated: true)
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
