////
////  DetailsViewController.swift
////  project
////
////  Created by Yulya on 19.01.2023.
////
//
//import UIKit
//
//
//class AddItemViewController: UIViewController {
//    
//    // MARK: - виджеты
//    
//    @IBOutlet weak var TextFieldTask: UITextField!
//    @IBOutlet weak var TextFieldComments: UITextField!
//    @IBOutlet weak var pickerView: UIPickerView! 
//    
//    @IBOutlet weak var SwitchStatus: UISwitch!
//    
//    @IBOutlet weak var AddButton: UIButton!
//    
//    // MARK: - переменные свойства 
//    
//    var savedCategory: Category?
//    var categories: [Category] = [.family,.work,.friends,.health,.hobby,.holidays,.home]
//    var parentController: ViewControllerCollection?
//    var tasks: [Task] = [Task]()
//    
//    // savedCategory - элемент массива, categories - массив, parentController - контроллер, tasks - массив
//    
//    // MARK: - инициализирующая функция контроллера
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        TextFieldTask.delegate = self
//        TextFieldComments.delegate = self
//        self.pickerView.delegate = self
//        self.pickerView.dataSource = self
//    }
//    // вызывается один раз при появлении контроллера на экране
//    
//    
//    // MARK: - действия, подключенные к аутлетам
//    
//    @IBAction func OnAddButton(_ sender: Any) {
//        let task1 = String(TextFieldTask.text!)
//        print("task1 = \(task1)")
//        
//        let comments = String(TextFieldComments.text ?? "")
//        print("comment = \(comments)")
//        
//        let status = SwitchStatus.isOn
//        print("status = \(status)")
//        
//        let color = "color"
//        
//        let id = Int.random(in: 0..<10000)
//       // рандомное присвоение номера
//        
//        let task = Task(id: id, name: task1, comment: comments, category: savedCategory ?? .family, status: status, color: color)
//
//        
//        self.parentController?.users.append(task)
//        // добавление элемента в массив
//        TaskFactory.shared.set(data: (self.parentController?.users ?? []))
//        self.parentController?.Collection.reloadData()
//        // перезагрузка коллекции
//        self.dismiss(animated: true)
//    }
//}
//
//    // MARK: - расширение PickerView
//
//extension AddItemViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return categories.count
//    }
//    // количество ячеек в PickerView
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return categories[row].rawValue
//    }
//    // название ячейк
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        1
//    }
//    // количество повторяющихся пикеров
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        self.savedCategory = categories[row]
//       
//    }
//    // сообщает делегату выбранный элемент
//}
//
//// MARK: - расширение TextField
//
//extension AddItemViewController:  UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == TextFieldTask {
//            TextFieldComments.becomeFirstResponder()
//        } else {
//            TextFieldComments.resignFirstResponder()
//    }
//        return true
//    }
//}
//// переход от одного текстфилда к другому 
