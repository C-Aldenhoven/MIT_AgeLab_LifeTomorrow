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
        view.addSubview(smartHomeButton)
        view.addSubview(healthButton)
        view.addSubview(dataSharingAndProfileButton)
        view.addSubview(carePlanButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let constraints = [
            smartHomeButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            smartHomeButton.bottomAnchor.constraint(equalTo: guide.centerYAnchor, constant: -20),
            smartHomeButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 20),
            smartHomeButton.rightAnchor.constraint(equalTo: guide.centerXAnchor, constant: -20),
            
            healthButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            healthButton.bottomAnchor.constraint(equalTo: guide.centerYAnchor, constant: -20),
            healthButton.leftAnchor.constraint(equalTo: guide.centerXAnchor, constant: 20),
            healthButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -20),
            
            dataSharingAndProfileButton.topAnchor.constraint(equalTo: guide.centerYAnchor, constant: 20),
            dataSharingAndProfileButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            dataSharingAndProfileButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 20),
            dataSharingAndProfileButton.rightAnchor.constraint(equalTo: guide.centerXAnchor, constant: -20),
            
            carePlanButton.topAnchor.constraint(equalTo: guide.centerYAnchor, constant: 20),
            carePlanButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            carePlanButton.leftAnchor.constraint(equalTo: guide.centerXAnchor, constant: 20),
            carePlanButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(constraints)
        
        self.navigationItem.titleView = topTitleLabel
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
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to LifeTomorrow!"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private var smartHomeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Smart Home", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .bottom
        button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 23.0, right: 0.0)
        button.layer.cornerRadius = 20
        button.setBackgroundImage(UIImage(named: "smartHomeButtonBackground"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(smartHomeButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var healthButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Health", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .bottom
        button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 23.0, right: 0.0)
        button.layer.cornerRadius = 20
        button.setBackgroundImage(UIImage(named: "healthButtonBackground"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(healthButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var dataSharingAndProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Data Sharing & Profile", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .bottom
        button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 23.0, right: 0.0)
        button.layer.cornerRadius = 20
        button.setBackgroundImage(UIImage(named: "dataSharingAndProfileButtonBackground"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dataSharingAndProfileButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var carePlanButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Care Plan", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .bottom
        button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 23.0, right: 0.0)
        button.layer.cornerRadius = 20
        button.setBackgroundImage(UIImage(named: "carePlanButtonBackground"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(carePlanButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Button Actions
    @objc private func smartHomeButtonAction() {
        navigationController?.pushViewController(SmartHomeViewController(), animated: true)
    }
    
    @objc private func healthButtonAction() {
        navigationController?.pushViewController(HealthViewController(), animated: true)
    }
    
    @objc private func dataSharingAndProfileButtonAction() {
        if Auth.auth().currentUser != nil {
            // User is signed in.
            print("Navigation: Yes user is indeed signed in")
            navigationController?.pushViewController(DataSharingAndProfileViewController(), animated: true)
        } else {
            // No user is signed in.
            print("Navigation: No user is signed in")
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
    
    @objc private func carePlanButtonAction() {
        navigationController?.pushViewController(CarePlanViewController(), animated: true)
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

