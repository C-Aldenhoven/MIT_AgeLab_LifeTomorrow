//
//  DirectMessageAPI.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 01.07.23.
//

import Foundation

class DirectMessageAPI {
    static func getDirectMessages() -> [DirectMessage]{
        let directMessage = [
            DirectMessage(name: "Direct Message", address: "32 Imaginary Lane,\n Cambridge, MA", openingHours: "Open from 11 to 5"),
            DirectMessage(name: "Cambridge Care Center", address: "2 Imagine Road,\n Boston, MA", openingHours: "Open - Closes 7 PM"),
            DirectMessage(name: "Lawyer Rick Burton", address: "111 LalaLand Street,\n Cambridge, MA", openingHours: "Open - Closes 5 PM"),
            DirectMessage(name: "Stay Young Fitness", address: "23 FeelTwentyThree Ave,\n Boston, MA", openingHours: "Open from 9 to 7")
        ]
        return directMessage
    }
}
