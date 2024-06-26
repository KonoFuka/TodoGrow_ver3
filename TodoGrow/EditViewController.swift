//
//  EditViewController.swift
//  TodoGrow
//
//  Created by 香野風花 on 2024/01/27.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {
    
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
    
    var saveButtonItem: UIBarButtonItem!
    
    var dayStr: String!
    
    //セルの番号
    var number:Int!
    
    var items: [TodoItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "todoの編集"
        
        print("\(number)番目のtodoの編集")
        print(items)
        
        //saveボタンの作成
        saveButtonItem = UIBarButtonItem(title: "保存", style: .done, target: self, action: #selector(saveButtonPressed(_:)))
        saveButtonItem.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = saveButtonItem
        
        items = readItems()
        
        print("これ", items[number])
        
        let selectedItem: TodoItem = items[number]
        let day = DateUtils.dateFromString(string: selectedItem.day, format: "yyyy/MM/dd HH:mm")
        print(day)
        
        //受け取った番号の情報をパーツを表示する
        titleTextField.text = (selectedItem.title)
        importanceSwitch.isOn = (selectedItem.isMarked)
        contentTextField.text = (selectedItem.content)
        dayPicker.date = day
    
        //ステータスバー
        var appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.582303226, green: 0.7785794139, blue: 0.5700367689, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor:UIColor.white]
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }
    
    func readItems() -> [TodoItem]{
        return Array(realm.objects(TodoItem.self))
    }
    
    @objc func saveButtonPressed(_ sender: UIBarButtonItem) {
        let results = realm.objects(TodoItem.self)
        
        //日付を変換
        dayStr = DateUtils2.stringFromDate(date: dayPicker.date, format: "yyyy/MM/dd HH:mm")
        print("dayday")
        print(dayStr)

        //保存
        let item = TodoItem()
//        item.id = results.count + 1
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

            let target = items[number]

            target.title = titleTextField.text ?? ""
            target.isMarked = importanceSwitch.isOn
            target.content = contentTextField.text ?? ""
            target.day = dayStr

            //全データの取得
            let results = realm.objects(TodoItem.self)
            print(results)
            print(results.count, "個")

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

class DateUtils2 {
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
