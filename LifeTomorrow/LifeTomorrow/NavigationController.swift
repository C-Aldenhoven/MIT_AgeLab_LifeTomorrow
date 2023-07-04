//
//  NavigationController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 04.05.23.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    var defaultAppearance: UINavigationBarAppearance?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Customize NavigationBar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()

        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    public func resetToDefaultAppearance() {
        if let defaultAppearance = defaultAppearance {
            navigationBar.standardAppearance = defaultAppearance
            navigationBar.scrollEdgeAppearance = defaultAppearance
        }
    }
}
