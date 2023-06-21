//
//  CarePlanData.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 09.05.23.
//

import Foundation
import CareKit

enum ActivityIdentifier: String {
    case cardio
    case limberUp = "Limber Up"
    case pulse
    case temperature
}

class CarePlanData: NSObject {
    let carePlanStore: OCKCarePlanStore
    
    class func dailyScheduleRepeating(occurencesPerDay: UInt) -> OCKCareSchedule {
        return OCKCareSchedule.dailySchedule(withStartDate: DateComponents.firstDateOfCurrentWeek,
                                             occurrencesPerDay: occurencesPerDay)
    }
    
    init(carePlanStore: OCKCarePlanStore) {
        self.carePlanStore = carePlanStore
        
        // Care Card Activities
        
        let cardioActivity = OCKCarePlanActivity(
            identifier: ActivityIdentifier.cardio.rawValue,
            groupIdentifier: nil,
            type: .intervention,
            title: "Cardio",
            text: "60 Minutes",
            tintColor: UIColor.darkOrange(),
            instructions: "Jog at a moderate pace for an hour.",
            imageURL: nil,
            schedule:CarePlanData.dailyScheduleRepeating(occurencesPerDay: 2),
            resultResettable: true,
            userInfo: nil)
        
        let limberUpActivity = OCKCarePlanActivity(
            identifier: ActivityIdentifier.limberUp.rawValue,
            groupIdentifier: nil,
            type: .intervention,
            title: "Limber Up",
            text: "Stretch Regularly",
            tintColor: UIColor.darkOrange(),
            instructions: "Stretch and warm up muscles in your arms, legs and back before any expected burst of activity. This is especially important if, for example, you're heading down a hill to inspect a Hostess truck.",
            imageURL: nil,
            schedule: CarePlanData.dailyScheduleRepeating(occurencesPerDay: 6),
            resultResettable: true,
            userInfo: nil)
        
        // Assessment activities
        
        let pulseActivity = OCKCarePlanActivity
            .assessment(withIdentifier: ActivityIdentifier.pulse.rawValue,
                        groupIdentifier: nil,
                        title: "Pulse",
                        text: "Check your pulse.",
                        tintColor: UIColor.darkGreen(),
                        resultResettable: true,
                        schedule: CarePlanData.dailyScheduleRepeating(occurencesPerDay: 1),
                        userInfo: ["ORKTask": AssessmentTaskFactory.makePulseAssessmentTask()], optional: false)
        
        let temperatureActivity = OCKCarePlanActivity
            .assessment(withIdentifier: ActivityIdentifier.temperature.rawValue,
                        groupIdentifier: nil,
                        title: "Temperature",
                        text: "Oral",
                        tintColor: UIColor.darkYellow(),
                        resultResettable: true,
                        schedule: CarePlanData.dailyScheduleRepeating(occurencesPerDay: 1),
                        userInfo: ["ORKTask": AssessmentTaskFactory.makeTemperatureAssessmentTask()], optional: false)
        
        super.init()
        
        for activity in [cardioActivity, limberUpActivity, pulseActivity, temperatureActivity] {
            add(activity: activity)
        }
        
    }
    
    func add(activity: OCKCarePlanActivity) {
        carePlanStore.activity(forIdentifier: activity.identifier) {
            [weak self] (success, fetchedActivity, error) in
            guard success else { return }
            guard let strongSelf = self else { return }
            
            if let _ = fetchedActivity { return }
            
            
            strongSelf.carePlanStore.add(activity, completion: { _,_  in })
        }
    }
    
}
