//
//  MyCollectionViewCell.swift
//  project
//
//  Created by Atticus on 18.01.2023.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var notOKImage: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var changeStatusButton: UIButton!
    
    @IBOutlet weak var okImage: UIImageView!
    
    var collection: ViewControllerCollection!
    var model: Case!
    
    
    func setup(model: Case) {
        
//        nameLabel.text = model.getDiscription()
        
        self.model = model
        if (model.status == true){
            backgroundColor = #colorLiteral(red: 0.1216293499, green: 0.6260606647, blue: 0.3012174368, alpha: 1)
        } else {
            backgroundColor = #colorLiteral(red: 0.7969902158, green: 0, blue: 0.1159720644, alpha: 1)
        }
        if (model.status == true) {
            self.okImage.isHidden = false
        } else {
            self.okImage.isHidden = true
        }
        if (model.status == true) {
            self.notOKImage.isHidden = true
        } else {
            self.notOKImage.isHidden = false
        }
        self.addSwipes()
    }


    func addSwipes() {
        let rightRecognizer = UISwipeGestureRecognizer (target: self, action: #selector(self.onRightSwipe))
        rightRecognizer.direction = .right
        self.addGestureRecognizer(rightRecognizer)
        
        let leftRecognizer = UISwipeGestureRecognizer (target: self, action: #selector(self.onLeftSwipe))
        leftRecognizer.direction = .left
        self.addGestureRecognizer(leftRecognizer)
    }
    
    
    @objc func onRightSwipe() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn ) {
            var f = self.menuView.frame
            f.origin.x = 336
            self.menuView.frame = f
        }
    }
    
    
    @objc func onLeftSwipe() {
        self.collection.closeAll()
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
            var f = self.menuView.frame
            f.origin.x = 237
            self.menuView.frame = f
        }
    }
    
    
    override func prepareForReuse() {
        self.onRightSwipe()
    }
    
    
    func save () {
        var index: Int = 0
        var savedIndex: Int?
        for task in collection.users {
            if task.id == model.id {
                savedIndex = index
            }
            index += 1
        }
        self.collection?.users[savedIndex!].status = model.status
        self.collection?.users[savedIndex!].name = model.name
        self.collection?.users[savedIndex!].description = model.description
//        TaskFactory.shared.set(data: collection?.users ?? [])
        self.collection?.Collection.reloadData()
    }
    
    
    
    @IBAction func changeStatusButtonOn(_ sender: Any) {
        if (model.status == false) {
            backgroundColor = #colorLiteral(red: 0.6011660099, green: 0.8279141784, blue: 0.6378276348, alpha: 1)
            self.notOKImage.isHidden = true
            self.okImage.isHidden = false
            model.status = true
        } else {
            backgroundColor = #colorLiteral(red: 0.6054612994, green: 0, blue: 0.217250973, alpha: 1)
            self.notOKImage.isHidden = false
            self.okImage.isHidden = true
            model.status = false
        }
        self.save()
    }
    
    
    
    @IBAction func editButtonOn(_ sender: Any) {
        self.collection.showDetails(item: self.model)
//        var param: [String: Any] = []
//        param["id"] =
//        param["name"] =
//        param["description"] =
//        param["type"] =
        
        NetworkManager.networkItem.updateSession(param: ["id": 12, "name": "old task", "description": "desc", "type": 2])
    }
    
    
    @IBAction func deleteButtonOn(_ sender: Any) {
        NetworkManager.networkItem.deleteSession(param: ["id": 15])
        var model = self.model
        guard let collection = self.collection else { return }
        var index: Int = 0
        var savedIndex: Int?
        for model in collection.users {
            if model.id == self.model.id {
                savedIndex = index
            }
            index += 1
        }
        self.collection.users.remove(at: savedIndex!)
//        TaskFactory.shared.set(data: collection.users)
        self.collection.Collection.reloadData()
    }
}


