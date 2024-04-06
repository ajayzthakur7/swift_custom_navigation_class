//
//  ViewController.swift
//  CustomNavigation
//
//  Created by Rahul Sharma on 19/11/23.
//

import UIKit

class ViewController: UIViewController, CustomNavigationControllerDelegate {
    func leftBarButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func rightBarButtonTapped() {
        print("HEY")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .red
    
        if let navigation = self.navigationController as? CustomNavigationViewController{
            navigation.customDelegate = self
        }
        
        
        let button = UIButton.init(type: .custom)
        button.setTitle("Continue", for: .normal)
        button.addTarget(self, action: #selector(continueToNext(button: )), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        
        self.view.addSubview(button)
        
        
    }
    
    
    @objc func continueToNext(button:UIButton){
        
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    



}

