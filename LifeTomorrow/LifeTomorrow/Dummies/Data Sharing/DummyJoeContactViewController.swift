//
//  DummyJoeContactViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 03.07.23.
//

import Foundation
import UIKit

class DummyJoeContactViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        view.addSubview(editContactInfoButton)
        view.addSubview(callButton)
        view.addSubview(emailButton)
        view.addSubview(messageButton)
        view.addSubview(addressButton)
        view.addSubview(selectAllButton)
        view.addSubview(heartRateButton)
        view.addSubview(locationButton)
        view.addSubview(bloodOxygenButton)
        view.addSubview(fallDetectionButton)
        view.addSubview(stepsButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let constraints = [
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            editContactInfoButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: -20),
            editContactInfoButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -42),
            editContactInfoButton.heightAnchor.constraint(equalToConstant: 70),
            editContactInfoButton.widthAnchor.constraint(equalToConstant: 190),
            
            callButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 120),
            callButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 40),
            callButton.heightAnchor.constraint(equalToConstant: 110),
            callButton.widthAnchor.constraint(equalToConstant: 160),
            
            emailButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 120),
            emailButton.leadingAnchor.constraint(equalTo: callButton.trailingAnchor, constant: 25),
            emailButton.heightAnchor.constraint(equalToConstant: 110),
            emailButton.widthAnchor.constraint(equalToConstant: 160),
            
            messageButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 120),
            messageButton.leadingAnchor.constraint(equalTo: emailButton.trailingAnchor, constant: 25),
            messageButton.heightAnchor.constraint(equalToConstant: 110),
            messageButton.widthAnchor.constraint(equalToConstant: 160),
            
            addressButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 120),
            addressButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -40),
            addressButton.heightAnchor.constraint(equalToConstant: 110),
            addressButton.widthAnchor.constraint(equalToConstant: 540),
            
            selectAllButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 298),
            selectAllButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -42),
            selectAllButton.heightAnchor.constraint(equalToConstant: 20),
            selectAllButton.widthAnchor.constraint(equalToConstant: 100),
            
            heartRateButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 350),
            heartRateButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 40),
            heartRateButton.heightAnchor.constraint(equalToConstant: 100),
            heartRateButton.widthAnchor.constraint(equalToConstant: 540),
            
            locationButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 350),
            locationButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -40),
            locationButton.heightAnchor.constraint(equalToConstant: 100),
            locationButton.widthAnchor.constraint(equalToConstant: 540),
            
            bloodOxygenButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 480),
            bloodOxygenButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 40),
            bloodOxygenButton.heightAnchor.constraint(equalToConstant: 100),
            bloodOxygenButton.widthAnchor.constraint(equalToConstant: 540),
            
            fallDetectionButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 480),
            fallDetectionButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -40),
            fallDetectionButton.heightAnchor.constraint(equalToConstant: 100),
            fallDetectionButton.widthAnchor.constraint(equalToConstant: 540),
            
            stepsButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 610),
            stepsButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 40),
            stepsButton.heightAnchor.constraint(equalToConstant: 100),
            stepsButton.widthAnchor.constraint(equalToConstant: 540),
        ]
        NSLayoutConstraint.activate(constraints)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Health"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dummyJoeContactBackground")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var editContactInfoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "editContactInfoButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(editContactInfoButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var callButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "callButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(callButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var emailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "emailButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(emailButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "messageButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(messageButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var addressButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "addressButtonJoe"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addressButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var selectAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "selectAllButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(selectAllButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var heartRateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "heartRateButtonFilled"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(heartRateButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var locationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "locationButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(locationButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var bloodOxygenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "bloodOxygenButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(bloodOxygenButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var fallDetectionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "fallDetectionButtonFilled"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(fallDetectionButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var stepsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "stepsButtonFilled"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(stepsButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Functions
    
    @objc private func editContactInfoButtonAction() {
        
    }
    
    @objc private func callButtonAction() {
        
    }
    
    @objc private func emailButtonAction() {
        
    }
    
    @objc private func messageButtonAction() {
        
    }
    
    @objc private func addressButtonAction() {
        
    }
    
    @objc private func selectAllButtonAction() {
        
    }
    
    @objc private func heartRateButtonAction() {
        
    }
    
    @objc private func locationButtonAction() {
        
    }
    
    @objc private func bloodOxygenButtonAction() {
        
    }
    
    @objc private func fallDetectionButtonAction() {
        
    }
    
    @objc private func stepsButtonAction() {
        
    }
    
}
