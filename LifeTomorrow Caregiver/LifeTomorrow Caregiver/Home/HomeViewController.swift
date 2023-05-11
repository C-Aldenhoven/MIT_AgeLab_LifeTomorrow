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
    
}

extension HomeViewController : ORKTaskViewControllerDelegate {
    // Your view controller now implements ORKTaskViewControllerDelegate by handling task results in taskViewController:didFinishWithReason:error:. These results could be in the form of a signed consent document, survey responses, or sensor data. For now, you are simply dismissing the task’s view controller when the task finishes
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
}
