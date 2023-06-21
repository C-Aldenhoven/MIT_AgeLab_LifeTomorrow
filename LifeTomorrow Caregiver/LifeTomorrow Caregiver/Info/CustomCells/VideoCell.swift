//
//  VideoCell.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 20.06.23.
//
import UIKit

class VideoElement: CustomElementModel {
    
    var image: UIImage?
    var username: String
    var mood: String
    
    var type: CustomElementType { return .video }
    
    init(image: UIImage?, username: String, mood: String) {
        self.image = image
        self.username = username
        self.mood = mood
    }
}


class VideoCell: UITableViewCell, CustomElementCell {
    var model: VideoElement!
    
    func configure(withModel elementModel: CustomElementModel) {
        guard let model = elementModel as? VideoElement else {
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
