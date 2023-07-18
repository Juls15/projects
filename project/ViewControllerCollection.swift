//
//  ViewControllerCollection.swift
//  project
//
//  Created by Yulya on 18.01.2023.
//

import UIKit

class ViewControllerCollection: UIViewController {
  
// MARK: - widgets
    
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var Collection: UICollectionView!
    @IBOutlet weak var sortedButton: UIButton!
    
// MARK: - переменные свойства
    
    public var users: [Case] = []
    var currentTask: Case!
    var sorted: Bool = true
    
// MARK: - функции контроллера
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.networkItem.getSession { items in
            self.users = items
//            if !items.isEmpty {
//                for item in items {
//                    let task = Task(id: item.id!, name: item.name!, comment: item.description!, category: Category.fromTypeToCat(type: item.type!) , status: false, color: "")
//                    self.users.append(task)
//                }
//                DispatchQueue.main.async {
//                    self.Collection.reloadData()
//                }
//
//            }
        }
        
//        NetworkManager.networkItem.getSession(completion: )
//        TaskFactory.shared.get { tasks in
//            self.users = tasks
//            self.loading.isHidden = true
//            debugPrint(2)
//            self.Collection.reloadData()
//        }
////        debugPrint(3)
//        for user in users {
//            debugPrint(12344321, user.color)
//        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? ItemViewController {
//            vc.parentController = self
//        }
        if let destination = segue.destination as? ItemViewController {
            destination.task = self.currentTask
        }
        if let dest = segue.destination as? ItemViewController {
            dest.pVC = self
        }
    }
    func showDetails(item: Case) {
        self.currentTask = item
        self.performSegue(withIdentifier: "show_item_details", sender: self)
    }
        
// MARK: - действие, подключенное к определенному виджету
    
    @IBAction func OnAdd(_ sender: Any) {
        self.performSegue(withIdentifier: "show_item_details", sender: self)
        NetworkManager.networkItem.addSession(param: ["name": "case", "description": "123", "type": 3])
    }
  
    @IBAction func onSortedButton(_ sender: Any) {
//        self.users { tasks in
//            for task in tasks {
//                print(task.id)
//            }
//        }
        if (self.sorted == true) {
            users.sort { a, b in
                return String(a.status!) < String(b.status!)
            }
            sorted = false
        } else {
            users.sort { a, b in
                return String(a.status!) > String(b.status!)
            }
            sorted = true
        }
        self.Collection.reloadData()
    }
    
    @objc func reloadCollection(notification: Notification) {
        DispatchQueue.main.async {
            self.Collection.reloadData()
        }
    }
}

// MARK: - функции коллекции

extension ViewControllerCollection: UICollectionViewDelegate, UICollectionViewDataSource {
 
        @objc func onRightSwipe() {
        }
        
        func closeAll() {
            for view in self.Collection.subviews {
                let cell = view as? MyCollectionViewCell
                cell?.onRightSwipe()
            }
            debugPrint(self.Collection.subviews)
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return users.count
        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as! MyCollectionViewCell
            cell.collection = self
            let model = self.users[indexPath.item]
            cell.setup(model: model)
            return cell
        }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        }
    
    
}

