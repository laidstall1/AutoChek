//
//  CustomTabBarController.swift
//  AutoChek
//
//  Created by mac on 09/08/2021.
//

import UIKit

class CustomTabBarViewController: UITabBarController, UITabBarControllerDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        let firstTabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreen")
        let secondTabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Liked")
        let thirdTabBar =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Notifications")
        let fourthTabBar =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Messages")
        let fifthTabBar =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShopScreen")

        
        firstTabBar.navigationItem.largeTitleDisplayMode = .always
        secondTabBar.navigationItem.largeTitleDisplayMode = .always
        thirdTabBar.navigationItem.largeTitleDisplayMode = .always
        fourthTabBar.navigationItem.largeTitleDisplayMode = .always
        fifthTabBar.navigationItem.largeTitleDisplayMode = .always
        
        let firstNavBar = UINavigationController(rootViewController: firstTabBar)
        let secondNavBar = UINavigationController(rootViewController: secondTabBar)
        let thirdNavBar = UINavigationController(rootViewController: thirdTabBar)
        let fourthNavBar = UINavigationController(rootViewController: fourthTabBar)
        let fifthNavBar = UINavigationController(rootViewController: fifthTabBar)
        
        firstNavBar.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home"), tag: 1)
        secondNavBar.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Liked"), tag: 2)
        fourthNavBar.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Notification"), tag: 3)
        thirdNavBar.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Shop"), tag: 4)
        fifthNavBar.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Message"), tag: 5)
        
        setViewControllers([firstNavBar, secondNavBar, thirdNavBar, fourthNavBar, fifthNavBar], animated: true)
        tabBar.backgroundColor = .white
        tabBar.alpha = 0.9
        tabBar.isTranslucent = true
        self.selectedViewController = firstNavBar
        setupMiddleTabBar()
    }
    
    private let tabButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.tintColor = .yellow
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.cornerRadius = 35
        button.layer.shadowOpacity = 0.3
        return button
    }()
    
    func setupMiddleTabBar() {
        tabButton.frame = CGRect(x: (view.bounds.width-70)/2, y: -25, width: 70, height: 70)
        tabButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        let buttonImage = UIImage(systemName: "lock.fill")
        tabButton.setImage(buttonImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        
        
        tabBar.addSubview(tabButton)
        view.layoutIfNeeded()
    }
    
    @objc func didTapButton() {
        self.selectedIndex = 2
    }
}

