//
//  CarePlanViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 08.05.23.
//

import UIKit
import ResearchKit
import CareKit

class CarePlanViewController: UIViewController {
    
    fileprivate let carePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    fileprivate let carePlanData = CarePlanData(carePlanStore: CarePlanStoreManager.sharedCarePlanStoreManager.store)
    fileprivate var symptomTrackerViewController: OCKSymptomTrackerViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(zombieTrainingButton)
        view.addSubview(symptomTrackerButton)
        view.addSubview(insightsButton)
        view.addSubview(connectButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let constraints = [
            zombieTrainingButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            zombieTrainingButton.bottomAnchor.constraint(equalTo: guide.centerYAnchor, constant: -20),
            zombieTrainingButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 20),
            zombieTrainingButton.rightAnchor.constraint(equalTo: guide.centerXAnchor, constant: -20),
            
            symptomTrackerButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            symptomTrackerButton.bottomAnchor.constraint(equalTo: guide.centerYAnchor, constant: -20),
            symptomTrackerButton.leftAnchor.constraint(equalTo: guide.centerXAnchor, constant: 20),
            symptomTrackerButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -20),
            
            insightsButton.topAnchor.constraint(equalTo: guide.centerYAnchor, constant: 20),
            insightsButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            insightsButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 20),
            insightsButton.rightAnchor.constraint(equalTo: guide.centerXAnchor, constant: -20),
            
            connectButton.topAnchor.constraint(equalTo: guide.centerYAnchor, constant: 20),
            connectButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            connectButton.leftAnchor.constraint(equalTo: guide.centerXAnchor, constant: 20),
            connectButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(constraints)
        
        self.navigationItem.titleView = topTitleLabel
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Care Plan"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private var zombieTrainingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Zombie Training", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize(width: 8, height: 8)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.setImage(UIImage(named: "carecard"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(zombieTrainingButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var symptomTrackerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Symptom Tracker", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.setImage(UIImage(named: "symptoms"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(symptomTrackerButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var insightsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Insights", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.setImage(UIImage(named: "insights"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(insightsButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var connectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Connect", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.setImage(UIImage(named: "connect"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(connectButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Button Actions
    @objc private func zombieTrainingButtonAction() {
        let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func symptomTrackerButtonAction() {
        let viewController = OCKSymptomTrackerViewController(carePlanStore: carePlanStoreManager.store)
        viewController.delegate = self
        symptomTrackerViewController = viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func insightsButtonAction() {
        navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    @objc private func connectButtonAction() {
        navigationController?.pushViewController(UIViewController(), animated: true)
    }
}

// MARK: - OCKSymptomTrackerViewControllerDelegate
extension CarePlanViewController: OCKSymptomTrackerViewControllerDelegate {
  func symptomTrackerViewController(_ viewController: OCKSymptomTrackerViewController,
                                    didSelectRowWithAssessmentEvent assessmentEvent: OCKCarePlanEvent) {
    guard let userInfo = assessmentEvent.activity.userInfo,
      let task: ORKTask = userInfo["ORKTask"] as? ORKTask else { return }
    
    let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
    taskViewController.delegate = self
    
    present(taskViewController, animated: true, completion: nil)
  }
}

// MARK: - ORKTaskViewControllerDelegate
extension CarePlanViewController: ORKTaskViewControllerDelegate {
  func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith
    reason: ORKTaskViewControllerFinishReason, error: Error?) {
      
    defer {
      dismiss(animated: true, completion: nil)
    }
    
    guard reason == .completed else { return }
    guard let symptomTrackerViewController = symptomTrackerViewController,
      let event = symptomTrackerViewController.lastSelectedAssessmentEvent else { return }
      let carePlanResult = carePlanStoreManager.buildCarePlanResultFrom(taskResult: taskViewController.result)
      carePlanStoreManager.store.update(event, with: carePlanResult, state: .completed) {
        success, _, error in
        if !success {
          print(error?.localizedDescription)
        }
      }
  }
}

