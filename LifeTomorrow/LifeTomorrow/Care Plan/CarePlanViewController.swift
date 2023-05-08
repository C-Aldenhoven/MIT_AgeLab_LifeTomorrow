//
//  CarePlanViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 08.05.23.
//

import Foundation
import UIKit

class CarePlanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.titleView = topTitleLabel
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Care Plan"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
}
