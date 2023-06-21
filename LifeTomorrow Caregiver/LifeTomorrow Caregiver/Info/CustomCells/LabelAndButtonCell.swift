//
//  LabelAndButtonCell.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 20.06.23.
//

import UIKit

class LabelAndButtonElement: CustomElementModel {
    
    var image: UIImage?
    var username: String
    var mood: String
    
    var type: CustomElementType { return .labelAndButton }
    
    init(image: UIImage?, username: String, mood: String) {
        self.image = image
        self.username = username
        self.mood = mood
    }
}


class LabelAndButtonCell: UITableViewCell, CustomElementCell {
    var model: LabelAndButtonElement!
    
    func configure(withModel elementModel: CustomElementModel) {
        guard let model = elementModel as? LabelAndButtonElement else {
            print("Unable to cast model as ProfileElement: \(elementModel)")
            return
        }
        
        self.model = model
        
        configureUI()
    }
    
    func configureUI() {
        //Configure UI elements...
    }
}
