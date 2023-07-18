//
//  ViewController.swift
//  NavigationControllerWithCode
//
//  Created by Yulya on 28.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton()
    let button1 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        button.setTitle("Present", for: .normal)
        view.addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.blue, for: .normal)
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        button1.setTitle("Push", for: .normal)
        view.addSubview(button1)
        button1.backgroundColor = .systemPink
        button1.setTitleColor(.blue, for: .normal)
        button1.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        button1.addTarget(self, action: #selector(didTapButtonPush), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        let secondVC = SecondViewController()
        self.navigationController?.present(secondVC, animated: true)
    }

    @objc func didTapButtonPush() {
        let thVC = ThirdViewController()
        self.navigationController?.pushViewController(thVC, animated: true)
    }
}


class SecondViewController: UIViewController {
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        
        button.setTitle("Back", for: .normal)
        view.addSubview(button)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpOutside)
    }
    
    @objc func didTapButton() {
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}


class ThirdViewController: UIViewController {
    let button2 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        
        button2.setTitle("Next", for: .normal)
        view.addSubview(button2)
        button2.backgroundColor = .systemGray2
        button2.setTitleColor(.black, for: .normal)
        button2.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button2.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    
    @objc func didTapButton() {
//            self.navigationController?.popViewController(animated: true)
        let thVC = TapBarController()
        self.navigationController?.pushViewController(thVC, animated: true)
        
    }
//    @objc func dismissSelf() {
//        dismiss(animated: true, completion: nil)
//    }
}
