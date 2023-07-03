//
//  NewPostCreationView.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 02.07.23.
//

import Foundation
import UIKit

class NewPostCreationView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(newPostButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            newPostButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            newPostButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newPostButton.heightAnchor.constraint(equalToConstant: 65),
            newPostButton.widthAnchor.constraint(equalToConstant: 130)
        ])
        
    }
    
    // MARK: UI-Elements
    
    var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dummyNewPostCreationView")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var newPostButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "postButton"), for: .normal)
        button.addTarget(self, action: #selector(createNewPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: Functions
    
    @objc func createNewPost() {
        
    }
    
}
