//
//  DummyProfileViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 03.07.23.
//

import Foundation
import UIKit

class DummyProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        view.addSubview(logOutButton)
        view.addSubview(phoneNumberButton)
        view.addSubview(passwordButton)
        view.addSubview(emailButton)
        view.addSubview(notificationsButton)
        view.addSubview(profileAddressButton)
        view.addSubview(demographicsButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let constraints = [
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logOutButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: -20),
            logOutButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -42),
            logOutButton.heightAnchor.constraint(equalToConstant: 40),
            logOutButton.widthAnchor.constraint(equalToConstant: 140),
            
            phoneNumberButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 270),
            phoneNumberButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            phoneNumberButton.heightAnchor.constraint(equalToConstant: 150),
            phoneNumberButton.widthAnchor.constraint(equalToConstant: 540),
            
            passwordButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 270),
            passwordButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            passwordButton.heightAnchor.constraint(equalToConstant: 150),
            passwordButton.widthAnchor.constraint(equalToConstant: 540),
            
            emailButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 420),
            emailButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            emailButton.heightAnchor.constraint(equalToConstant: 150),
            emailButton.widthAnchor.constraint(equalToConstant: 540),
            
            notificationsButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 420),
            notificationsButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            notificationsButton.heightAnchor.constraint(equalToConstant: 150),
            notificationsButton.widthAnchor.constraint(equalToConstant: 540),
            
            profileAddressButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 570),
            profileAddressButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            profileAddressButton.heightAnchor.constraint(equalToConstant: 150),
            profileAddressButton.widthAnchor.constraint(equalToConstant: 540),
            
            demographicsButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 570),
            demographicsButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            demographicsButton.heightAnchor.constraint(equalToConstant: 150),
            demographicsButton.widthAnchor.constraint(equalToConstant: 540),
        ]
        NSLayoutConstraint.activate(constraints)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: UI-Elements
    
    var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dummyProfileBackground")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "logOutButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logOutButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var phoneNumberButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "phoneNumberButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(phoneNumberButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var passwordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "passwordButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(passwordButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var emailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "profileEmailButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(emailButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var notificationsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "notificationsButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(notificationsButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var profileAddressButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "profileAddressButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(profileAddressButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var demographicsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "demographicsButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(demographicsButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Functions
    
    @objc private func logOutButtonAction() {
        
    }
    
    @objc private func phoneNumberButtonAction() {
        
    }
    
    @objc private func passwordButtonAction() {
        
    }
    
    @objc private func emailButtonAction() {
        
    }
    
    @objc private func notificationsButtonAction() {
        
    }
    
    @objc private func profileAddressButtonAction() {
        
    }
    
    @objc private func demographicsButtonAction() {
        
    }
    
}
