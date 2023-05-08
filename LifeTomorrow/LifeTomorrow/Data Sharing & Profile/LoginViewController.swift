//
//  LoginViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 08.05.23.
//

import Foundation
import UIKit
import FirebaseAuthUI
import FirebaseEmailAuthUI

class LoginViewController: UIViewController, FUIAuthDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.titleView = topTitleLabel
        
        let signInButton = UIBarButtonItem(title: "Sign In", style: .done, target: self, action: #selector(startSignInFlow))
        self.navigationItem.rightBarButtonItem = signInButton
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    // MARK: Firebase Auth
    
    @objc func startSignInFlow() {
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers = [FUIEmailAuth()]
        authUI?.providers = providers
        let authViewController = authUI!.authViewController()
        self.present(authViewController, animated: true, completion: nil)
        self.navigationController?.popViewController(animated: false)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
      // handle user and error as necessary
        print("User has signed in")
    }
}
