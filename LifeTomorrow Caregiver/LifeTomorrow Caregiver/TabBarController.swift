//
//  TabBarController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 02.05.23.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let chatNavigationController = NavigationController()
        let finderNavigationController = NavigationController()
        let homeNavigationController = NavigationController()
        let infoNavigationController = NavigationController()
        let caregivingNavigationController = NavigationController()
                
        let chatTab = chatNavigationController
        let chatIcon = UITabBarItem(title: "Chat", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard"))
        chatTab.tabBarItem = chatIcon
        chatTab.setViewControllers([ChatViewController()], animated: true)
        
        let finderTab = finderNavigationController
        let finderIcon = UITabBarItem(title: "Finder", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard"))
        finderTab.tabBarItem = finderIcon
        finderTab.setViewControllers([FinderViewController()], animated: true)
        
        let homeTab = homeNavigationController
        let homeIcon = UITabBarItem(title: "Home", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard"))
        homeTab.tabBarItem = homeIcon
        homeTab.setViewControllers([HomeViewController()], animated: true)
        
        let infoTab = infoNavigationController
        let infoIcon = UITabBarItem(title: "Info", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard"))
        infoTab.tabBarItem = infoIcon
        infoTab.setViewControllers([InfoViewController()], animated: true)
        
        let caregivingTab = caregivingNavigationController
        let caregivingIcon = UITabBarItem(title: "Caregiving", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard"))
        caregivingTab.tabBarItem = caregivingIcon
        caregivingTab.setViewControllers([CaregivingViewController()], animated: true)
        
        let controllers = [chatTab, finderTab, homeTab, infoTab, caregivingTab]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
        
        self.selectedIndex = 2
        self.tabBar.backgroundColor = .lightGray
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
}

