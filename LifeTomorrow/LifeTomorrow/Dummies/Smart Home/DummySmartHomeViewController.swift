//
//  DummySmartHomeViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 03.07.23.
//

import Foundation
import UIKit

class DummySmartHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        view.addSubview(dummySmartWatchButton)
        view.addSubview(dummySmartContactButton)
        view.addSubview(dummySmartFireButton)
        view.addSubview(dummySmartStoveButton)
        view.addSubview(addDeviceButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let constraints = [
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            dummySmartWatchButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 140),
            dummySmartWatchButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            dummySmartWatchButton.heightAnchor.constraint(equalToConstant: 260),
            dummySmartWatchButton.widthAnchor.constraint(equalToConstant: 307),
            
            dummySmartContactButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 140),
            dummySmartContactButton.leadingAnchor.constraint(equalTo: dummySmartWatchButton.trailingAnchor, constant: 20),
            dummySmartContactButton.heightAnchor.constraint(equalToConstant: 260),
            dummySmartContactButton.widthAnchor.constraint(equalToConstant: 307),
            
            dummySmartFireButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 140),
            dummySmartFireButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            dummySmartFireButton.heightAnchor.constraint(equalToConstant: 260),
            dummySmartFireButton.widthAnchor.constraint(equalToConstant: 307),
            
            dummySmartStoveButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            dummySmartStoveButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            dummySmartStoveButton.heightAnchor.constraint(equalToConstant: 260),
            dummySmartStoveButton.widthAnchor.constraint(equalToConstant: 307),
            
            addDeviceButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            addDeviceButton.leadingAnchor.constraint(equalTo: dummySmartStoveButton.trailingAnchor, constant: 20),
            addDeviceButton.heightAnchor.constraint(equalToConstant: 260),
            addDeviceButton.widthAnchor.constraint(equalToConstant: 307)
        ]
        NSLayoutConstraint.activate(constraints)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: UI-Elements
    
    var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "smartHomeBackground")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var dummySmartWatchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummySmartWatchButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummySmartWatchButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dummySmartContactButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummySmartContactButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummySmartContactButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dummySmartFireButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummySmartFireButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummySmartFireButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dummySmartStoveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummySmartStoveButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dummySmartStoveButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var addDeviceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "addDeviceButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addDeviceButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Functions
    
    @objc private func logOutButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func dummySmartWatchButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func dummySmartContactButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func dummySmartFireButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func dummySmartStoveButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func addDeviceButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
