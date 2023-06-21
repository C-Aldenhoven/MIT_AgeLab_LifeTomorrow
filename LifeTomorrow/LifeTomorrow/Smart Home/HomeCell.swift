//
//  HomeCell.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 23.05.23.
//

import Foundation
import UIKit
import HomeKit

class HomeCell: UICollectionViewCell {
    
    var home: HMHome? {
        didSet {
            if let home = home {
                label.text = home.name
            }
        }
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
