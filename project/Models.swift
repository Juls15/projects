//
//  PlayGround.swift
//  project
//
//  Created by Yulya on 07.02.2023.
//

import Foundation
import UIKit


enum Category: String, Codable {
    case home = "Дом"
    case work = "Работа"
    case hobby = "Хобби"
    case family = "Семья"
    case friends = "Друзья"
    case holidays = "Отдых"
    case health = "Здоровье"
    
    static func fromTypeToCat(type:Int) -> Category {
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
    
}

struct Case: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var type: Int?
    var status: Bool?
}
    
//struct Task: Codable {
//    var id: Int?
//    var name: String?
//    var comment: String?
//    var category: Category
//    var status: Bool
//    var color: String
//    
//    init (id: Int, name: String, comment: String, category: Category, status: Bool, color: String) {
//        self.id = id
//        self.name = name
//        self.comment = comment
//        self.category = category
//        self.status = status
//        self.color = color
//    }
//    
//    func getDiscription () -> String {
//        let name = self.name ?? ""
//        let comment = self.comment ?? ""
//        let category = self.category.rawValue
//        
//        
//        return String(format: "%@ %@ %@", name, comment, category)
//    }
//}
