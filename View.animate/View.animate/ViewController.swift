//
//  ViewController.swift
//  View.animate
//
//  Created by Yulya on 18.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func pushButton(_ sender: Any) {
        UIView.animate(withDuration: 2) {
                var frame = self.button.frame
                frame.origin.x = 50
                frame.origin.y = 600
                self.button.frame = frame
//                self.pushButton.center = self.view.center
            }
        }
    
    
    
    
    @IBAction func pushButton2(_ sender: Any) {
        
        let parentFrame = button2.frame
        let center = button2.center
        UIView.animate(withDuration: 0.2) {
            var frame = self.button2.frame
            frame.size.width = frame.size.width - 40
            frame.size.height = frame.size.height - 40
            
            self.button2.frame = frame
            self.button2.center = center
        } completion: { Bool in
            self.button2.frame = parentFrame
        }
    }
    
    
    @IBAction func pushButton3(_ sender: Any) {
        
        let center = button3.center
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .allowAnimatedContent) {
            var c = self.button3.center
            c.y = c.y + 100
            self.button3.center = c
            
            
        }  completion: { Bool in
            self.button3.center = center
        }
    }
}

