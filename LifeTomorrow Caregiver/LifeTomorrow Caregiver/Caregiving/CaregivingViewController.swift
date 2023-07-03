//
//  CaregivingViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 09.05.23.
//

import UIKit

class CaregivingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(backgroundImageView)
        view.addSubview(editButton)
        view.addSubview(callButton)
        view.addSubview(heartRateButton)
        view.addSubview(bloodOxyButton)
        view.addSubview(locationAndStepsButton)
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            editButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            editButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            editButton.heightAnchor.constraint(equalToConstant: 50),
            editButton.widthAnchor.constraint(equalToConstant: 50),
            
            callButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 270),
            callButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -5),
            callButton.heightAnchor.constraint(equalToConstant: 50),
            callButton.widthAnchor.constraint(equalToConstant: 150),
            
            heartRateButton.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: 20),
            heartRateButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 5),
            heartRateButton.heightAnchor.constraint(equalToConstant: 150),
            heartRateButton.widthAnchor.constraint(equalToConstant: 190),
            
            bloodOxyButton.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: 20),
            bloodOxyButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -5),
            bloodOxyButton.heightAnchor.constraint(equalToConstant: 150),
            bloodOxyButton.widthAnchor.constraint(equalToConstant: 190),
            
            locationAndStepsButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -30),
            locationAndStepsButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -5),
            locationAndStepsButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 5),
            locationAndStepsButton.heightAnchor.constraint(equalToConstant: 210)
        ])
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    // MARK: Button Functions
    
    @objc func showEditPage() {
    }
    
    @objc func showProfilePage() {
    }
    
    @objc func showCarePage() {
    }
    
    @objc func showChatPage() {
    }
    
    @objc func showInfoPage() {
    }
    
    // MARK: UI-Elements
    
    private var editButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "mechanicWheel"), for: .normal)
        button.addTarget(self, action: #selector(showEditPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var callButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "callButton"), for: .normal)
        button.addTarget(self, action: #selector(showProfilePage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var heartRateButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "dummyCaregivingHeartRateButton"), for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(showCarePage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var bloodOxyButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "dummyCaregivingBloodOxyButton"), for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(showChatPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var locationAndStepsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "dummyCaregivingLocationAndStepsButton"), for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(showInfoPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dummyCaregivingBackground")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
}
