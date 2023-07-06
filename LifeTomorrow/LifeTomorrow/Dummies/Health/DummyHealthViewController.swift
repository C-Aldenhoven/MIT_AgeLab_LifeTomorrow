//
//  DummyHealthViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 03.07.23.
//

import Foundation
import UIKit

class DummyHealthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        view.addSubview(careTeamButton)
        view.addSubview(dummyBloodOxygenButton)
        view.addSubview(dummyBloodPressureButton)
        view.addSubview(dummyCardioButton)
        view.addSubview(dummyFallDetectionButton)
        view.addSubview(dummyHeartRateButton)
        view.addSubview(dummyStepsButton)
        view.addSubview(dummyStretchButton)
        view.addSubview(seeAllActivitiesButton)
        view.addSubview(seeAllSymptomsButton)
        view.addSubview(dummyTemperatureButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let constraints = [
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            careTeamButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            careTeamButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            careTeamButton.heightAnchor.constraint(equalToConstant: 50),
            careTeamButton.widthAnchor.constraint(equalToConstant: 200),
            
            dummyStepsButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 40),
            dummyStepsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dummyStepsButton.heightAnchor.constraint(equalToConstant: 145),
            dummyStepsButton.widthAnchor.constraint(equalToConstant: 260),
            
            dummyHeartRateButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 205),
            dummyHeartRateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dummyHeartRateButton.heightAnchor.constraint(equalToConstant: 145),
            dummyHeartRateButton.widthAnchor.constraint(equalToConstant: 260),
            
            dummyBloodOxygenButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 380),
            dummyBloodOxygenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dummyBloodOxygenButton.heightAnchor.constraint(equalToConstant: 145),
            dummyBloodOxygenButton.widthAnchor.constraint(equalToConstant: 260),
            
            dummyFallDetectionButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -10),
            dummyFallDetectionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dummyFallDetectionButton.heightAnchor.constraint(equalToConstant: 145),
            dummyFallDetectionButton.widthAnchor.constraint(equalToConstant: 260),
            
            dummyCardioButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 135),
            dummyCardioButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 320),
            dummyCardioButton.heightAnchor.constraint(equalToConstant: 200),
            dummyCardioButton.widthAnchor.constraint(equalToConstant: 220),
            
            dummyStretchButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 135),
            dummyStretchButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -270),
            dummyStretchButton.heightAnchor.constraint(equalToConstant: 200),
            dummyStretchButton.widthAnchor.constraint(equalToConstant: 220),
            
            seeAllActivitiesButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 135),
            seeAllActivitiesButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -55),
            seeAllActivitiesButton.heightAnchor.constraint(equalToConstant: 200),
            seeAllActivitiesButton.widthAnchor.constraint(equalToConstant: 220),
            
            dummyTemperatureButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 475),
            dummyTemperatureButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 320),
            dummyTemperatureButton.heightAnchor.constraint(equalToConstant: 200),
            dummyTemperatureButton.widthAnchor.constraint(equalToConstant: 220),
            
            dummyBloodPressureButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 475),
            dummyBloodPressureButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -270),
            dummyBloodPressureButton.heightAnchor.constraint(equalToConstant: 200),
            dummyBloodPressureButton.widthAnchor.constraint(equalToConstant: 220),
            
            seeAllSymptomsButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 475),
            seeAllSymptomsButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -55),
            seeAllSymptomsButton.heightAnchor.constraint(equalToConstant: 200),
            seeAllSymptomsButton.widthAnchor.constraint(equalToConstant: 220),
        ]
        NSLayoutConstraint.activate(constraints)
        
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    // MARK: UI-Elements
    
    var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "healthBackground")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var careTeamButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "careTeamButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(careTeamButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dummyBloodOxygenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummyBloodOxygenButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummyBloodOxygenButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dummyBloodPressureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummyBloodPressureButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummyBloodPressureButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dummyCardioButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummyCardioButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummyCardioButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dummyFallDetectionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummyFallDetectionButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummyFallDetectionButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dummyHeartRateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummyHeartRateButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummyHeartRateButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dummyStepsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummyStepsButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummyStepsButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dummyStretchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummyStretchButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummyStretchButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var seeAllActivitiesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "seeAllActivitiesButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(seeAllActivitiesButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var seeAllSymptomsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "seeAllSymptomsButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(seeAllSymptomsButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dummyTemperatureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummyTemperatureButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummyTemperatureButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Functions
    
    @objc private func careTeamButtonAction() {
        navigationController?.pushViewController(DummyDataSharingViewController(), animated: true)
    }
    
    @objc private func dummySmartWatchButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func dummyBloodOxygenButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func dummyBloodPressureButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func dummyCardioButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func dummyFallDetectionButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func dummyHeartRateButtonAction() {
        navigationController?.pushViewController(DummyHeartRateViewController(), animated: true)
    }
    
    @objc private func dummyStepsButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func dummyStretchButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func seeAllActivitiesButtonAction() {
        navigationController?.pushViewController(DummyTrainingViewController(), animated: true)
    }
    
    @objc private func seeAllSymptomsButtonAction() {
        navigationController?.pushViewController(DummySymptomViewController(), animated: true)
    }
    
    @objc private func dummyTemperatureButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}