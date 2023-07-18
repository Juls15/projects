//
//  ItemViewController.swift
//  project
//
//  Created by Yulya on 24.01.2023.
//

import UIKit

class ItemViewController: UIViewController {
    
    // MARK: - аутлеты
    
    @IBOutlet weak var TextFieldSaved: UITextField!
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var textFieldComments: UITextField!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var colorWell: UIColorWell!
    
    @IBOutlet weak var savedPickerView: UIPickerView!
    
    // MARK: - переменные свойства
    
    var task: Case?
    var pVC: ViewControllerCollection?
    var savedTask: String = ""
    var savedComments: String = ""
    var changedCategory: Category?
    var categories: [Category] = [.family,.work,.friends,.health,.hobby,.holidays,.home]
  
    // MARK: - иницилизирующие свойства контроллера
        
    override func viewDidLoad() {
        super.viewDidLoad()
        TextFieldSaved.delegate = self
        textFieldComments.delegate = self
        guard let task = task else { return }
        TextFieldSaved.text = task.name
        textFieldComments.text = task.description
//        colorWell.selectedColor = UIColor(named: task.color)
        self.savedPickerView.delegate = self
        self.savedPickerView.dataSource = self
        
        var index: Int = 0
        var savedIndex: Int = 0
        
     
        
        for category in self.categories {
            let type = self.fromTypeToCat(type: task.type!)
            if type == category {
                savedIndex = index
            }
            index += 1
        }
        self.changedCategory = self.categories[savedIndex]
        savedPickerView.selectRow(savedIndex, inComponent: 0, animated: false)
        
//        view.backgroundColor = self.colorWell.selectedColor
//        view.backgroundColor = #colorLiteral(red: 0.9623010755, green: 0.9297748208, blue: 1, alpha: 1)
//        colorWell.backgroundColor = #colorLiteral(red: 0.9623010755, green: 0.9297748208, blue: 1, alpha: 1)
        
//        if self.task?.color == "color" {
//            self.view.backgroundColor = #colorLiteral(red: 0.9623010755, green: 0.9297748208, blue: 1, alpha: 1)
//        } else {
//            let color = self.fromStringToColor(strColor: self.task?.color ?? "")
//            self.view.backgroundColor = color
////            colorWell.backgroundColor = color
//        }
        view.addSubview(colorWell)
        setupColorWell()
    }
    
    
    func fromTypeToCat(type: Int) -> Category {
        switch type {
        case 1: return .home
        case 2: return .work
        case 3: return .hobby
        case 4: return .family
        case 5: return .friends
        case 6: return .holidays
        case 7: return .health
        default: return .home
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    //MARK: - функции конвертации типов данных
    
    func fromColorToString(color: UIColor) -> String {
        var stringArray = ""
        guard let components = color.cgColor.components else { return "" }
        for component in components {
            let str = "\(component)"
            stringArray += str
            stringArray += "|"
        }
        return stringArray
    }
// конвертация из UIColor в String
    
    func fromStringToColor(strColor: String) -> UIColor {
        var colorArray: [CGFloat] = []
        let splitColor = strColor.split(separator: "|")
        for a in splitColor {
            let colorString = String(a)
            let colorNum = CGFloat(Double(colorString)!)
//            guard let colorNum = NumberFormatter().number(from: colorString) else { return .white}
            let colorFloat = CGFloat(truncating: colorNum as NSNumber)
            colorArray.append(colorFloat)
        }
        if colorArray.isEmpty {
            return .white
        } else {
            let color = UIColor(cgColor: CGColor(srgbRed: colorArray[0], green: colorArray[1], blue: colorArray[2], alpha: colorArray[3]))
            return color
        }
    }
// конвертация из String в UIColor

    // MARK: - функция коллекции
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }

    //MARK: - функции ColorWell
    
    private func setupColorWell() {
        colorWell.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
    }
    
    func fromCatToType(category: Category) -> Int {
        switch category {
        case .home: return 1
        case .work: return 2
        case .hobby: return 3
        case .family: return 4
        case .friends: return 5
        case .holidays: return 6
        case .health: return 7
        default: return 1
        }
    }
    
    @objc private func colorChanged() {
        view.backgroundColor = colorWell.selectedColor
        debugPrint(123445656, colorWell.selectedColor )
        
        guard let hexValue = colorWell.selectedColor else {
            return
        }
        print(hexValue)
    }
    
    // MARK: - действия, подключенные к аутлетам
    
    @IBAction func OnSaveButton(_ sender: Any) {
        let savedTask = String(TextFieldSaved.text!)
        print("savedTask = \(savedTask)")
        let savedComments = String(textFieldComments.text!)
        print ("savedComments = \(savedComments)")
        let savedColor = colorWell.selectedColor
        print ("savedColor = \(savedColor)")
        
        
        var savedStrColor = "color"
        if let s = savedColor {
            savedStrColor = self.fromColorToString(color: s)
            print ("savedStrColor = \(savedStrColor)")
        }
        
        guard let parent = self.pVC else { return }
        guard let saved = self.task else { return }
        var index: Int = 0
        var savedIndex: Int?
        for task in parent.users {
            if task.id == saved.id {
                savedIndex = index
            }
            index += 1
        }
        
        if savedColor != nil {
//            self.pVC?.users[savedIndex!].color = savedStrColor
        }
        
        debugPrint (parent.users[savedIndex!])
        self.pVC?.users[savedIndex!].name = savedTask
        self.pVC?.users[savedIndex!].description = savedComments
        self.pVC?.users[savedIndex!].type = self.fromCatToType(category: changedCategory!)
//        self.pVC?.users[savedIndex!].color = savedStrColor
        
//        TaskFactory.shared.set(data: pVC?.users ?? [])
        self.pVC?.Collection.reloadData()
        self.dismiss(animated: true)
        
        
    }
}

// MARK: - расширение PickerView

extension ItemViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.changedCategory = categories[row]
       print(categories[row])
    }
}

// MARK: - расширение TextField

extension ItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == TextFieldSaved {
            textFieldComments.becomeFirstResponder()
        } else {
            textFieldComments.resignFirstResponder()
        }
        return true
    }
}

    
