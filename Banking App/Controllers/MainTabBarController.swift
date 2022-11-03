//
//  MainTabBarController.swift
//  Banking App
//
//  Created by Ahmed Yamany on 03/11/2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setviewControllers()
    }
    func setviewControllers(){
        let homeVC = HomeViewController()
        setupTabBarItem(of: homeVC, Icon: "house", Title: "Home")
        
        let allTransefersVC = AllTransfersViewController()
        setupTabBarItem(of: allTransefersVC, Icon: "list.bullet.below.rectangle", Title: "All Transfers")
        
        setViewControllers([homeVC, allTransefersVC], animated: false)
    }
    func setupTabBarItem(of viewController: UIViewController, Icon iconName: String, Title title: String){
        viewController.tabBarItem.image = UIImage(systemName: iconName)
        viewController.title = title
    }
}
