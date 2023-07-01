//
//  Resource.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 22.06.23.
//

import Foundation

struct Resource {
    let name: String?
    let address: String?
    let openingHours: String?
    let group: ResourceGroup?
}

enum ResourceGroup: String, CaseIterable {
    case health = "Health Services"
    case financial = "Financial Services"
    case legal = "Legal Support"
}
