//
//  InfoViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 09.05.23.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    var customElements = MockData.mockData.customElements!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(topTitleLabel)
        view.addSubview(tableView)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let constraints = [
            topTitleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: -40),
            topTitleLabel.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 10),
            topTitleLabel.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: guide.rightAnchor,constant: -10),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Information"
        label.layer.opacity = 1
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.font = UIFont.textStyle12
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
}

extension InfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = customElements[indexPath.row]
        let cellIdentifier = cellModel.type.rawValue
        let customCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomElementCell
        
        customCell.configure(withModel: cellModel)
        
        return customCell as! UITableViewCell
    }
}

enum CustomElementType: String {
    case blog
    case video
    case labelAndButton
}

protocol CustomElementModel: class {
    var type: CustomElementType { get }
}

protocol CustomElementCell: class {
    func configure(withModel: CustomElementModel)
}
