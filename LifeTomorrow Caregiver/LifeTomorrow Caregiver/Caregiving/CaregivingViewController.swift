//
//  CaregivingViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 09.05.23.
//

import Foundation
import UIKit

class CaregivingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.titleView = topTitleLabel
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Care Receiver"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
}
