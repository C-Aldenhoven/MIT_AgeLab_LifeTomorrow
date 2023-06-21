//
//  MockData.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 20.06.23.
//

import UIKit

class MockData {
    
    //Singleton
    static let mockData = MockData()
    
    public var customElements: [CustomElementModel]! = {
        let customElements = [
            BlogElement(image: UIImage(named: "care"), username: "Test", mood: "okay")
        ]
        return customElements
    }()
    
}
