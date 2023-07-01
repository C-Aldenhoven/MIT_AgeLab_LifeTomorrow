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
        let chatIcon = UITabBarItem(title: "Chat", image: UIImage(named: "chat"), selectedImage: UIImage(named: "chatFilled"))
        chatTab.tabBarItem = chatIcon
        chatTab.setViewControllers([ChatViewController()], animated: true)
        
        let finderTab = finderNavigationController
        let finderIcon = UITabBarItem(title: "Finder", image: UIImage(named: "finder"), selectedImage: UIImage(named: "finderFilled"))
        finderTab.tabBarItem = finderIcon
        finderTab.setViewControllers([FinderViewController()], animated: true)
        
        let homeTab = homeNavigationController
        let homeIcon = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "homeFilled"))
        homeTab.tabBarItem = homeIcon
        homeTab.setViewControllers([HomeViewController()], animated: true)
        
        let infoTab = infoNavigationController
        let infoIcon = UITabBarItem(title: "Info", image: UIImage(named: "info"), selectedImage: UIImage(named: "infoFilled"))
        infoTab.tabBarItem = infoIcon
        infoTab.setViewControllers([BlogsViewController()], animated: true)
        
        let caregivingTab = caregivingNavigationController
        let caregivingIcon = UITabBarItem(title: "Caregiving", image: UIImage(named: "care"), selectedImage: UIImage(named: "careFilled"))
        caregivingTab.tabBarItem = caregivingIcon
        caregivingTab.setViewControllers([CaregivingViewController()], animated: true)
        
        let controllers = [chatTab, finderTab, homeTab, infoTab, caregivingTab]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
        
        self.selectedIndex = 0
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.masksToBounds = false
        self.tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: -4, height: -6)
        self.tabBar.layer.shadowOpacity = 0.5
        self.tabBar.layer.shadowRadius = 20
        
        setupMiddleButton()
    }
    
    // MARK: - Setups

        func setupMiddleButton() {
            let homeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))

            var homeButtonFrame = homeButton.frame
            homeButtonFrame.origin.y = view.bounds.height - self.tabBar.frame.height * 2
            homeButtonFrame.origin.x = view.bounds.width/2 - homeButtonFrame.size.width/2
            homeButton.frame = homeButtonFrame

            homeButton.backgroundColor = UIColor.darkGray
            homeButton.layer.cornerRadius = homeButtonFrame.height/2
            view.addSubview(homeButton)

            homeButton.setImage(UIImage(named: "home"), for: .normal)
            homeButton.addTarget(self, action: #selector(homeButtonAction(sender:)), for: .touchUpInside)

            view.layoutIfNeeded()
        }


        // MARK: - Actions

        @objc private func homeButtonAction(sender: UIButton) {
            selectedIndex = 2
        }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
}

