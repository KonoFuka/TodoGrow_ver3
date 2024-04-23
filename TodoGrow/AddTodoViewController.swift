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
        
        //ステータスバー
        var appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.582303226, green: 0.7785794139, blue: 0.5700367689, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor:UIColor.white]
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }
    
    @IBAction func save(){
        //全データの取得
        let results = realm.objects(TodoItem.self)
        
        //日付のデータを変換
        let dayStr = DateUtils.stringFromDate(date: dayPicker.date, format: "yyyy/MM/dd HH:mm")
        print(dayStr)
        
        //保存
        let item = TodoItem()
        item.id = results.count + 1
        item.title = titleTextField.text ?? ""
        item.day = dayStr
//        item.alarm = String(alarmpicker.date) ?? ""
//        item.Repeat = String(repeatpicker) ?? ""
        item.isMarked = importanceSwitch.isOn
        item.content = contentTextField.text ?? ""
        
        creareItem(item: item)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func creareItem(item: TodoItem) {
        try! realm.write {
            realm.add(item)
            
            //全データの取得
            let results = realm.objects(TodoItem.self)
            print(results)
            print(results.count)
            
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

class DateUtils {
    class func dateFromString(string: String, format: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string)!
    }

    class func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

