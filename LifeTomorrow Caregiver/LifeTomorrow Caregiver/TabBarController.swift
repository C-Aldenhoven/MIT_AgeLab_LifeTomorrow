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
        let chatIcon = UITabBarItem(title: "Chat", image: UIImage(named: "chat"), selectedImage: UIImage(named: "chat"))
        chatTab.tabBarItem = chatIcon
        chatTab.setViewControllers([ChatViewController()], animated: true)
        
        let finderTab = finderNavigationController
        let finderIcon = UITabBarItem(title: "Finder", image: UIImage(named: "finder"), selectedImage: UIImage(named: "finder"))
        finderTab.tabBarItem = finderIcon
        finderTab.setViewControllers([FinderViewController()], animated: true)
        
        let homeTab = homeNavigationController
        let homeIcon = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        homeTab.tabBarItem = homeIcon
        homeTab.setViewControllers([HomeViewController()], animated: true)
        
        let infoTab = infoNavigationController
        let infoIcon = UITabBarItem(title: "Info", image: UIImage(named: "info"), selectedImage: UIImage(named: "info"))
        infoTab.tabBarItem = infoIcon
        infoTab.setViewControllers([InfoViewController()], animated: true)
        
        let caregivingTab = caregivingNavigationController
        let caregivingIcon = UITabBarItem(title: "Caregiving", image: UIImage(named: "caregiving"), selectedImage: UIImage(named: "caregiving"))
        caregivingTab.tabBarItem = caregivingIcon
        caregivingTab.setViewControllers([CaregivingViewController()], animated: true)
        
        let controllers = [chatTab, finderTab, homeTab, infoTab, caregivingTab]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
}

