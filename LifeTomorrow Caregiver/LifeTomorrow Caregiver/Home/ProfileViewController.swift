//
//  ProfileViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 27.06.23.
//

import UIKit
import ResearchKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(topTitleLabel)
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(editButton)
        view.addSubview(changePasswordButton)
        view.addSubview(changePhoneNumberButton)
        view.addSubview(changeEmailButton)
        view.addSubview(editCareDetailsButton)
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: guide.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 250),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -65),
            nameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 15),
            nameLabel.heightAnchor.constraint(equalToConstant: 100),
            
            editButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 40),
            editButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 50),
            editButton.heightAnchor.constraint(equalToConstant: 20),
            
            changePasswordButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            changePasswordButton.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: 30),
            changePasswordButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 100),
            
            changePhoneNumberButton.topAnchor.constraint(equalTo: changePasswordButton.bottomAnchor, constant: -20),
            changePhoneNumberButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            changePhoneNumberButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            changePhoneNumberButton.heightAnchor.constraint(equalToConstant: 100),
            
            changeEmailButton.topAnchor.constraint(equalTo: changePhoneNumberButton.bottomAnchor, constant: -20),
            changeEmailButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            changeEmailButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            changeEmailButton.heightAnchor.constraint(equalToConstant: 100),
            
            editCareDetailsButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -10),
            editCareDetailsButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            editCareDetailsButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            editCareDetailsButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.titleView = topTitleLabel
        
    }
    
    // MARK: Button Functions
    
    @objc func showCarePage() {
        self.tabBarController?.selectedIndex = 4
    }
    
    @objc func showChatPage() {
        self.tabBarController?.selectedIndex = 0
    }
    
    @objc func showInfoPage() {
        self.tabBarController?.selectedIndex = 3
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "  Profile"
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var profileImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dummyProfileImage")
        return view
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Joe Canton"
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var editButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "editButton"), for: .normal)
        button.addTarget(self, action: #selector(showCarePage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var changePasswordButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "profileChangePasswordButton"), for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(showCarePage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var changePhoneNumberButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "profileChangePhoneNumberButton"), for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(showChatPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var changeEmailButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "profileChangeEmailButton"), for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(showInfoPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var editCareDetailsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "profileEditCareDetailsButton"), for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(showCarePage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
}
