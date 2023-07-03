//
//  HomeViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 09.05.23.
//

import UIKit
import ResearchKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(topTitleLabel)
        view.addSubview(profileButton)
        view.addSubview(careButton)
        view.addSubview(chatButton)
        view.addSubview(infoButton)
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            topTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            topTitleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            topTitleLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            
            profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            profileButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            profileButton.heightAnchor.constraint(equalToConstant: 50),
            profileButton.widthAnchor.constraint(equalToConstant: 50),
            
            careButton.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor, constant: 25),
            careButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            careButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            careButton.heightAnchor.constraint(equalToConstant: 300),
            
            chatButton.topAnchor.constraint(equalTo: careButton.bottomAnchor, constant: -20),
            chatButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            chatButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            chatButton.heightAnchor.constraint(equalToConstant: 120),
            
            infoButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -10),
            infoButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            infoButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            infoButton.heightAnchor.constraint(equalToConstant: 220)
        ])
        
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
    }
    
    // MARK: Button Functions
    
    @objc func showProfilePage() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @objc func showCarePage() {
        self.tabBarController?.selectedIndex = 4
    }
    
    @objc func showChatPage() {
        self.tabBarController?.selectedIndex = 0
    }
    
    @objc func showInfoPage() {
        self.tabBarController?.selectedIndex = 3
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "  Welcome back, Joe!"
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var profileButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "dummyProfileButtonImage"), for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(showProfilePage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var careButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "dummyHomeCareButton"), for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(showCarePage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var chatButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "dummyHomeChatButton"), for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(showChatPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var infoButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "dummyHomeInfoButton"), for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(showInfoPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
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
