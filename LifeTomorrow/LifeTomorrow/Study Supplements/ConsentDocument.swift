//
//  ConsentDocument.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 09.05.23.
//

import Foundation
import ResearchKit

public var ConsentDocument: ORKConsentDocument {
  
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "LifeTomorrow Study Consent"
    
    /*
     .Custom: These sections have no default content, so you can add anything you need with text, images, or HTML.
     .OnlyInDocument: These sections aren’t displayed to the user, but their contents are included in the summary document for the user’s approval.
     */
    
    let consentSectionTypes: [ORKConsentSectionType] = [
        .overview,
        .dataGathering,
        .privacy,
        .dataUse,
        .timeCommitment,
        .studySurvey,
        .studyTasks,
        .withdrawing
    ]
    
    let consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
      let consentSection = ORKConsentSection(type: contentSectionType)
      consentSection.summary = "If you wish to complete this study..."
      consentSection.content = "In this study you will be asked five (wait, no, three!) questions. You will also have your voice recorded for ten seconds."
      return consentSection
    }

    consentDocument.sections = consentSections

    //Note: An ORKConsentSignature can also be pre-populated with a name, image and date. This is useful when you need to include a copy of the principal investigator’s signature in the consent document.
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
  
    return consentDocument
}
