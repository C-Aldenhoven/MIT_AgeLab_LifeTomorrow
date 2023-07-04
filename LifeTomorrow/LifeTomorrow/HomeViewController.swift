//
//  ViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 02.05.23.
//

import UIKit
import FirebaseAuth
import ResearchKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(topTitleLabel)
        view.addSubview(smartHomeButton)
        view.addSubview(healthButton)
        view.addSubview(dataSharingButton)
        view.addSubview(profileButton)
        
        let constraints = [
            topTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            topTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            topTitleLabel.widthAnchor.constraint(equalToConstant: 500),
            topTitleLabel.heightAnchor.constraint(equalToConstant: 150),
            
            smartHomeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            smartHomeButton.heightAnchor.constraint(equalToConstant: 320),
            smartHomeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            smartHomeButton.rightAnchor.constraint(equalTo: view.centerXAnchor),
            
            healthButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            healthButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            healthButton.leftAnchor.constraint(equalTo: view.centerXAnchor),
            healthButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            dataSharingButton.heightAnchor.constraint(equalToConstant: 320),
            dataSharingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            dataSharingButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            dataSharingButton.rightAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            profileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            profileButton.heightAnchor.constraint(equalToConstant: 50),
            profileButton.widthAnchor.constraint(equalToConstant: 170)
        ]
        NSLayoutConstraint.activate(constraints)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "ConsentSigned") {
            // Consent form has been signed, proceed as normal
        } else {
            // Consent form has not been signed. Show consent form (perhaps using performSegueWithIdentifier)
            let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
            taskViewController.delegate = self
            present(taskViewController, animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "ConsentSigned")
        }
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back, Michael!"
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var smartHomeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "smartHomeButton"), for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(smartHomeButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var healthButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "healthButton"), for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(healthButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dataSharingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "dataSharingButton"), for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dataSharingButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "profileButton"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(profileButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Button Actions
    @objc private func smartHomeButtonAction() {
        navigationController?.pushViewController(DummySmartHomeViewController(), animated: true)
    }
    
    @objc private func healthButtonAction() {
        navigationController?.pushViewController(DummyHealthViewController(), animated: true)
    }
    
    @objc private func dataSharingButtonAction() {
        navigationController?.pushViewController(DummyDataSharingViewController(), animated: true)
        
        /*if Auth.auth().currentUser != nil {
            // User is signed in.
            print("Navigation: Yes user is indeed signed in")
            navigationController?.pushViewController(DataSharingAndProfileViewController(), animated: true)
        } else {
            // No user is signed in.
            print("Navigation: No user is signed in")
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }*/
    }
    
    @objc private func profileButtonAction() {
        navigationController?.pushViewController(DummyProfileViewController(), animated: true)
    }
}

extension HomeViewController : ORKTaskViewControllerDelegate {
    // Your view controller now implements ORKTaskViewControllerDelegate by handling task results in taskViewController:didFinishWithReason:error:. These results could be in the form of a signed consent document, survey responses, or sensor data. For now, you are simply dismissing the task’s view controller when the task finishes
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        switch(reason) {
        case .completed:
            let signatureResult: ORKConsentSignatureResult = taskViewController.result.stepResult(forStepIdentifier: "ConsentReviewStep")?.firstResult as! ORKConsentSignatureResult
            let consentDocument = ConsentDocument.copy() as! ORKConsentDocument
            signatureResult.apply(to: consentDocument)
            consentDocument.makePDF{ (data, error) -> Void in
                var docURL = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last
                docURL = docURL?.appendingPathComponent("consent.pdf")
                try? data?.write(to: docURL!, options: .atomicWrite)
                
                let ac = UIActivityViewController(activityItems: [docURL!], applicationActivities: nil)
                if let popoverController = ac.popoverPresentationController {
                    popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
                    popoverController.sourceView = self.view
                    popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
                }
                DispatchQueue.main.async {
                    self.present(ac, animated: true)
                }
            }
            taskViewController.dismiss(animated: true, completion: nil)
        default:
            taskViewController.dismiss(animated: true, completion: nil)
        }
    }
    
}

