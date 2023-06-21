//
//  BlogCell.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 20.06.23.
//

import UIKit

class BlogElement: CustomElementModel {
    
    var image: UIImage?
    var username: String
    var mood: String
    
    var type: CustomElementType { return .blog }
    
    init(image: UIImage?, username: String, mood: String) {
        self.image = image
        self.username = username
        self.mood = mood
    }
}


class BlogCell: UITableViewCell, CustomElementCell {
    var model: BlogElement!
    
    func configure(withModel elementModel: CustomElementModel) {
        guard let model = elementModel as? BlogElement else {
            print("Unable to cast model as ProfileElement: \(elementModel)")
            return
        }
        
        self.model = model
        
        configureUI()
    }
    
    func configureUI() {
        
    }
}
