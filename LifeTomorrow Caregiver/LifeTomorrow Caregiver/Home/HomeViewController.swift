//
//  HomeViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 09.05.23.
//

import Foundation
import UIKit
import ResearchKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
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
        label.text = "Home"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .left
        return label
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
