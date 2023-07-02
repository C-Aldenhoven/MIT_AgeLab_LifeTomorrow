//
//  BlogTableViewCell.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 21.06.23.
//

import UIKit

class BlogTableViewCell: UITableViewCell {
    
    var blog: Blog? {
        didSet {
            guard let blogItem = blog else {return}
            if let title = blogItem.title {
                titleLabel.text = title
            }
            
            if let summary = blogItem.summary {
                summaryLabel.text = "\(summary) "
            }
            
            if let readingDuration = blogItem.readingDuration {
                readingDurationLabel.text = "\(readingDuration) "
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellContainerView.addSubview(titleLabel)
        cellContainerView.addSubview(summaryLabel)
        cellContainerView.addSubview(readingDurationLabel)
        self.contentView.addSubview(cellContainerView)
        
        let constraints = [
            cellContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 7.5),
            cellContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -7.5),
            cellContainerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            cellContainerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: self.cellContainerView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: self.cellContainerView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: readingDurationLabel.leadingAnchor, constant: -5),
            
            summaryLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
            summaryLabel.leadingAnchor.constraint(equalTo: self.cellContainerView.leadingAnchor, constant: 15),
            
            readingDurationLabel.widthAnchor.constraint(equalToConstant: 50),
            readingDurationLabel.heightAnchor.constraint(equalToConstant: 26),
            readingDurationLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            readingDurationLabel.topAnchor.constraint(equalTo: self.cellContainerView.topAnchor, constant: 15)
        ]
        NSLayoutConstraint.activate(constraints)
    
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: UI-Elements
    
    let cellContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let summaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()
    
    let readingDurationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}
