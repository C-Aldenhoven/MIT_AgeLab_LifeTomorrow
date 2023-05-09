//
//  NavigationController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 09.05.23.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //undo this comment, when merged into the MMT UI
        //self.setViewControllers([MMTHomeViewController()], animated: true)
        
        // MARK: Customize NavigationBar
        
        let navigationBarAppearence = UINavigationBarAppearance()
        navigationBarAppearence.shadowColor = .clear
        navigationBarAppearence.backgroundColor = UIColor(named: "BackgroundSecondary")
        navigationBar.standardAppearance = navigationBarAppearence
    }
}
