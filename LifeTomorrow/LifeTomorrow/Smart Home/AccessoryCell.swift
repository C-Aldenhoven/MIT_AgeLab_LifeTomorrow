//
//  AccessoryCell.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 23.05.23.
//

import Foundation
import UIKit
import HomeKit

class AccessoryCell: UICollectionViewCell {
    enum LightbulbState: String {
        case on
        case off
    }
    
    var accessory: HMAccessory? {
        didSet {
            if let accessory = accessory {
                label.text = accessory.name
                
                let state = getLightbulbState(accessory)
                imageView.image = UIImage(named: state.rawValue)
            }
        }
    }
    
    private func getLightbulbState(_ accessory: HMAccessory) -> LightbulbState {
        guard let characteristic = accessory.find(serviceType: HMServiceTypeLightbulb, characteristicType: HMCharacteristicMetadataFormatBool), let value = characteristic.value as? Bool else {
            return .off
        }
        
        return value ? .on : .off
    }
    
    // MARK: UI-Elements
    
    private var imageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
