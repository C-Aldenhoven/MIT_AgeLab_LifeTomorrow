//
//  DataSharingAndProfileViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 08.05.23.
//

import Foundation
import UIKit
import FirebaseAuth

class DataSharingAndProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.titleView = topTitleLabel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if Auth.auth().currentUser != nil {
            // User is signed in.
            // ...
            print("A user is signed in")
            /* TODO:
             let user = Auth.auth().currentUser
             let uid = user?.uid
             let email = user?.email
             */
            let signOutButton = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(startSignOutFlow))
            self.navigationItem.rightBarButtonItem = signOutButton
        } else {
            // No user is signed in.
            print("ERROR: No user is signed in, this view should not appear")
        }
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Data Sharing and Profile"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    // MARK: Firebase Auth
    
    @objc func startSignOutFlow() {
        do {
            try Auth.auth().signOut()
            print("User has signed out")
            navigationController?.popViewController(animated: true)
        } catch let error {
            print("Auth sign out failed: \(error)")
        }
    }
    
}
