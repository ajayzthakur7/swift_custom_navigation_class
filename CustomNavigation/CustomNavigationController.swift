//
//  CustomNavigationController.swift
//  CustomNavigation
//
//  Created by Ajay Thakur on 19/11/23.
//

import Foundation
import UIKit


protocol CustomNavigationControllerDelegate : AnyObject{
    
    func leftBarButtonTapped()
       func rightBarButtonTapped()
    
}


class CustomNavigationViewController: UINavigationController {
    
    
    // Declare a variable to store the dynamic title
    var navigationTitle: String?
    
    // Declare a variable to store the custom view
    var customView: UIView?
    
    // Declare a delegate to handle the taps on controller
    weak var customDelegate: CustomNavigationControllerDelegate?
    
    init(dynamicTitle: String?, customView : UIView? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.navigationTitle = dynamicTitle
        self.customView = customView
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Create a navigation bar
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navigationBar)
        
        // Add constraints to the navigation bar
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 44) // You can adjust the height
        ])
        
        // Create a navigation item
        let navigationItem = UINavigationItem()
        
        // Use Custom View if we need some logo or custom stuff on navigation bar
        if let customView{
            navigationItem.titleView = customView
        }else{
            navigationItem.title = navigationTitle
           
        }
        
        // Apply custom font to the navigation bar title
        let customFont = UIFont(name: "YourCustomFontName", size: 17) // Replace with your custom font name
//        let titleTextAttributes: [NSAttributedString.Key: Any] = [
//            .font: customFont ?? UIFont.systemFont(ofSize: 17), // Use system font if custom font is nil
//            .foregroundColor: UIColor.white
//        ]
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .blue
//        appearance.titleTextAttributes = titleTextAttributes
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        
        // Create left and right bar button items if needed
        let leftButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(leftButtonTapped))
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(rightButtonTapped))
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        // Set the navigation item to the navigation bar
        navigationBar.items = [navigationItem]
    
    }
    
    // Handle left button tap
    @objc func leftButtonTapped() {
        if let customDelegate{
            customDelegate.leftBarButtonTapped()
        }else{
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    // Handle right button tap
    @objc func rightButtonTapped() {
        customDelegate?.rightBarButtonTapped()
    }
}
