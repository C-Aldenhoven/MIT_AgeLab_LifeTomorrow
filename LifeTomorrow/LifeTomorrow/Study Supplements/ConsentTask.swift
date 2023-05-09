//
//  ConsentTask.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 09.05.23.
//

import Foundation
import ResearchKit

public var ConsentTask: ORKOrderedTask {
  
    var steps = [ORKStep]()
  
    let consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    let signature = consentDocument.signatures!.first as! ORKConsentSignature

    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDocument)

    reviewConsentStep.text = "Review Consent!"
    reviewConsentStep.reasonForConsent = "Consent to join study"

    steps += [reviewConsentStep]

  
    //TODO: Note: The "ConsentTask" identifier serves to distinguish this task for the purposes of handling its results. The results are outside the scope of this tutorial, but I encourage you to take note of the task identifiers in the sample code and try to retrieve the results yourself.
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}
