//
//  NetworkManager.swift
//  project
//
//  Created by Yulya on 15.03.2023.
//

import Foundation

class NetworkManager {
    
    static let networkItem = NetworkManager()
    
    
    func getSession(completion: @escaping ([Case]) -> Void) {
        let req: RequestManager = .get
        guard let url = URL(string: req.url) else {
            return
        }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(12345678, response, data?.description)
            }
            if let parsData = data {
                guard let cases = try?
                        JSONDecoder().decode([Case].self, from: parsData) else { return }
                print(12345678, parsData)
                completion(cases)
            }
        }.resume()
    }
    
    
    
    func updateSession(param: [String : Any]) {
        let req: RequestManager = .update(param: param)
        guard let url = URL(string: req.url) else {
            return
        }
        var request = URLRequest(url: url)
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted) else { return }
        request.httpBody = httpBody
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        print(param)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.httpMethod = req.method
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
                   if let response = response {
                       print(response)
                   }
        }.resume()
    }

    
    
    func addSession(param: [String: Any]) {
        let req: RequestManager = .add(param: param)
        guard let url = URL(string: req.url) else {
            return
        }
        var request = URLRequest(url: url)
        let httpBody = try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
        request.httpBody = httpBody
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        print(param)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.httpMethod = req.method
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response, response.url)
            }
            if let parsData = data {
            guard let cases = try?
            JSONDecoder().decode(Case.self, from: parsData) else { return }
            }
        }.resume()
    }
    
    
    func deleteSession(param: [String : Int]) {
        let req: RequestManager = .delete(param: param)
        guard let url = URL(string: req.url) else {
            return
        }
        var request = URLRequest(url: url)
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted) else { return }
        request.httpBody = httpBody
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        print(param)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.httpMethod = req.method
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
                   if let response = response {
                       print(response.url)
                   }
//            if let parsData = data {
//                guard let cases = try?
//                        JSONDecoder().decode(Case.self, from: parsData) else { return }
//                debugPrint(cases.name, "1234552356765")
//            }
        }.resume()
    }
}
