//
//  ViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 02.05.23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(homeButton)
        view.addSubview(healthButton)
        view.addSubview(dataSharingAndProfileButton)
        view.addSubview(carePlanButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let constraints = [
            homeButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            homeButton.bottomAnchor.constraint(equalTo: guide.centerYAnchor, constant: -20),
            homeButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 20),
            homeButton.rightAnchor.constraint(equalTo: guide.centerXAnchor, constant: -20),
            
            healthButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            healthButton.bottomAnchor.constraint(equalTo: guide.centerYAnchor, constant: -20),
            healthButton.leftAnchor.constraint(equalTo: guide.centerXAnchor, constant: 20),
            healthButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -20),
            
            dataSharingAndProfileButton.topAnchor.constraint(equalTo: guide.centerYAnchor, constant: 20),
            dataSharingAndProfileButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            dataSharingAndProfileButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 20),
            dataSharingAndProfileButton.rightAnchor.constraint(equalTo: guide.centerXAnchor, constant: -20),
            
            carePlanButton.topAnchor.constraint(equalTo: guide.centerYAnchor, constant: 20),
            carePlanButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            carePlanButton.leftAnchor.constraint(equalTo: guide.centerXAnchor, constant: 20),
            carePlanButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(constraints)
        self.navigationItem.titleView = topTitleLabel
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to LifeTomorrow!"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private var homeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Home", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize(width: 8, height: 8)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var healthButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Health", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var dataSharingAndProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Data Sharing & Profile", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var carePlanButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Care Plan", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
}

