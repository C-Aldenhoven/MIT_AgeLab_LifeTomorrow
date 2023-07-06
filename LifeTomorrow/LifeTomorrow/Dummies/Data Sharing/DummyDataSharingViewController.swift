//
//  DummyDataSharingViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 03.07.23.
//

import Foundation
import UIKit

class DummyDataSharingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(backgroundImageView)
        view.addSubview(joeButton)
        view.addSubview(rachaelButton)
        view.addSubview(addNewContactButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let constraints = [
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            joeButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 155),
            joeButton.heightAnchor.constraint(equalToConstant: 320),
            joeButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 30),
            joeButton.rightAnchor.constraint(equalTo: guide.centerXAnchor, constant: -10),
            
            rachaelButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 155),
            rachaelButton.heightAnchor.constraint(equalToConstant: 320),
            rachaelButton.leftAnchor.constraint(equalTo: guide.centerXAnchor, constant: 10),
            rachaelButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -30),
            
            addNewContactButton.heightAnchor.constraint(equalToConstant: 185),
            addNewContactButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            addNewContactButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 30),
            addNewContactButton.rightAnchor.constraint(equalTo: guide.centerXAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(constraints)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Data Sharing"
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dataSharingBackground")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var joeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummyContactJoeButton"), for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(joeButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var rachaelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dummyContactRachaelButton"), for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(rachaelButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var addNewContactButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "addNewContactButton"), for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addNewContactButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Button Actions
    @objc private func joeButtonAction() {
        navigationController?.pushViewController(DummyJoeContactViewController(), animated: true)
    }
    
    @objc private func rachaelButtonAction() {
        navigationController?.pushViewController(DummyRachaelContactViewController(), animated: true)
    }
    
    @objc private func addNewContactButtonAction() {
        let alert = UIAlertController(title: "This function will be available soon:)", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
