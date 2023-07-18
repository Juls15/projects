//
//  UrlManager.swift
//  project
//
//  Created by Yulya on 13.03.2023.
//

import Foundation

enum RequestManager {
    case get
    case update (param: [String: Any])
    case add (param: [String: Any])
    case delete (param: [String: Int])
    
    var params: [String: Any] {
        switch self {
        case .get:
            return [:]
        case .update(let param):
            return param
        case .add(let param):
            return param
        case .delete(let param):
            return param
        }
    }
    
    private var baseUrl: String {
        return "http://81.27.244.69/traffic/"
    }
    
    var url: String {
        switch self {
        case .get:
            return "\(baseUrl)get_tasks"
        case .update:
            return "\(baseUrl)update_task"
        case .add:
            return "\(baseUrl)add_task"
        case .delete:
            return "\(baseUrl)delete_task"
        }
    }
    
    var method: String {
        switch self {
        case .get:
            return "GET"
        case .update:
            return "POST"
        case .add:
            return "POST"
        case .delete:
            return "POST"
        }
    }
}




