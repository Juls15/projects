//
//  TapBarController.swift
//  NavigationControllerWithCode
//
//  Created by Yulya on 01.03.2023.
//

import Foundation
import UIKit

class TapBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fVC = FirstViewController()
        let secVC = SecController()
        let thVC = ThViewController()
        
        self.setViewControllers([fVC, secVC, thVC] , animated: false)
        guard let items = self.tabBar.items else { return }
        let images = ["star", "pawprint", "fish.fill"]
        for x in 0...2 {
            items[x].image = UIImage(systemName: images[x])
        }
        self.tabBar.tintColor = .systemPink
        tabBar.backgroundColor = .systemGray2
    }
}

class FirstViewController: UIViewController {
    
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    var data: Drinks? = nil
    let decoder = JSONDecoder()
    
    var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 160, height: 160)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        view.addSubview(collectionView)
        view.backgroundColor = .white
        collectionView.frame = view.bounds
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        self.collectionView.reloadData()
        
        setUpData()
    }
    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(collectionView.leadingAnchor.constraint(equalTo: collectionView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(collectionView.trailingAnchor.constraint(equalTo: collectionView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(collectionView.bottomAnchor.constraint(equalTo: collectionView.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(collectionView.topAnchor.constraint(equalTo: collectionView.safeAreaLayoutGuide.topAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    
    func setUpData() {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a")
        else {
            return
        }
        session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let strongSelf = self else { return }
            if let parsData = data {
                
                guard let drinks = try?
                        JSONDecoder().decode(Drinks.self, from: parsData) else { return }
                strongSelf.data = drinks
                
                DispatchQueue.main.async {
                    strongSelf.collectionView.reloadData()
                }
            }
        }.resume()
    }
}

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data?.drinks?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        if let title = self.data?.drinks?[indexPath.item].strDrink {
            cell.setup(title: title)
        }
        cell.backgroundColor = .systemPink
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = self.data?.drinks?[indexPath.item].idDrink else { return }
        let vc =  DetailViewController(id: id)
        self.navigationController?.pushViewController(vc, animated: true)
             
    }
    
    
}






class SecController: UIViewController{
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
}

extension SecController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row + 1)"
        return cell
    }
    
 
    
}






class ThViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        createStackView()
        view.backgroundColor = .systemIndigo
    }
    
    func createStackView() {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        imageView.image = UIImage(systemName: "carrot")
        imageView.contentMode = .scaleAspectFit

        
        let imageView1 = UIImageView()
        imageView1.backgroundColor = .systemCyan
        imageView1.image = UIImage(systemName: "sun.max")
        imageView1.contentMode = .scaleAspectFit
        
        
        let stackView = UIStackView(arrangedSubviews: [imageView, imageView1])
        stackView.frame = view.bounds
        stackView.backgroundColor = .systemOrange
        stackView.tintColor = .systemOrange
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        view.addSubview(stackView)



    }
}
