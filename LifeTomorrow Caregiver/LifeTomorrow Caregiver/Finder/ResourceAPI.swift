//
//  ResourceAPI.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 22.06.23.
//

import Foundation

class ResourceAPI {
    static func getResources() -> [Resource]{
        let resources = [
            Resource(name: "Boston Retirement", address: "32 Imaginary Lane,\n Cambridge, MA", openingHours: "Open from 11 to 5", group: .financial),
            Resource(name: "Cambridge Care Center", address: "2 Imagine Road,\n Boston, MA", openingHours: "Open - Closes 7 PM", group: .health),
            Resource(name: "Lawyer Rick Burton", address: "111 LalaLand Street,\n Cambridge, MA", openingHours: "Open - Closes 5 PM", group: .legal),
            Resource(name: "Stay Young Fitness", address: "23 FeelTwentyThree Ave,\n Boston, MA", openingHours: "Open from 9 to 7", group: .health)
        ]
        return resources
    }
}
