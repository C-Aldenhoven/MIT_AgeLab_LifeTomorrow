//
//  DummyChannelViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 01.07.23.
//

import Foundation
import UIKit

class DummyChannelViewController: UIViewController {
    
    private var image: UIImage
    private var channelName: String
    
    init(image: UIImage, channelName: String) {
        self.image = image
        self.channelName = channelName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.titleView = topTitleLabel
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Care Receiver"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
}
