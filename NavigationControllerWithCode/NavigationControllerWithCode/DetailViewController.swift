//
//  DetailViewController.swift
//  NavigationControllerWithCode
//
//  Created by Yulya on 09.03.2023.
//

import Foundation
import UIKit


class DetailViewController: UIViewController {
    
    let id: String
    var lable = UILabel()
    var session = URLSession.shared
//    var ingridients: Ingridients? = nil
    var data: Ingridients? = nil {
        didSet {
            DispatchQueue.main.async {
                self.lable.text = self.data?.ingredients?.first?.strDescription
                debugPrint(12344321, self.data?.ingredients?.first?.strDescription)
                self.view.layoutIfNeeded()
                self.view.layoutSubviews()
                self.view.setNeedsDisplay()
            }
        }
    }


    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        lable = UILabel()
        lable.textColor = .black
        lable.textAlignment = .center
        lable.backgroundColor = .orange
        lable.lineBreakMode = NSLineBreakMode.byWordWrapping
        lable.numberOfLines = 0
    
        self.view.addSubview(self.lable)
        
        self.setupConstraints()
        
        setUpData()
        
    }
    
    func setupConstraints() {
        self.lable.translatesAutoresizingMaskIntoConstraints = false
//        self.lable.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
//        self.lable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
//        self.lable.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50).isActive = true
//        self.lable.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -50).isActive = true
        
        self.lable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.lable.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.lable.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.lable.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
//        self.lable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
//        self.lable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        self.lable.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
//        self.lable.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    func setUpData() {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?iid=\(self.id)")
        else {
            return
        }
        debugPrint(12344321, url)
        session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self else { return }
            debugPrint(12344321, data)
            if let parsData = data {
                guard let ingridients = try?
                        JSONDecoder().decode(Ingridients.self, from: parsData) else { return }
                debugPrint(12344321, ingridients.ingredients?.count)
                self.data = ingridients
                debugPrint(12344321, ingridients.ingredients?.count)
                }
           
        }.resume()
    }
   

}
