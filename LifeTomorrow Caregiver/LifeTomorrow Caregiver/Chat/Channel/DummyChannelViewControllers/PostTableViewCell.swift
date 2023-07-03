//
//  PostTableViewCell.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 02.07.23.
//

import Foundation
import UIKit

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var post: Post? {
        didSet {
            guard let postItem = post else {return}
            if let title = postItem.title {
                titleLabel.text = title
            }
            
            if let text = postItem.text {
                postTextLabel.text = text
            }
            
            if let numberOfReplies = postItem.numberOfReplies {
                numberOfRepliesLabel.text = "\(numberOfReplies)"
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(cellContainerView)
        cellContainerView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(postTextLabel)
        containerView.addSubview(numberOfRepliesLabel)
        containerView.addSubview(membersImageView)
        
        let constraints = [
            cellContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            cellContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            cellContainerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            cellContainerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            
            containerView.leadingAnchor.constraint(equalTo: self.cellContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.cellContainerView.trailingAnchor, constant: 10),
            containerView.topAnchor.constraint(equalTo: cellContainerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: cellContainerView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -55),
            
            postTextLabel.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),
            postTextLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            
            membersImageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -10),
            membersImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            
            numberOfRepliesLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -15),
            numberOfRepliesLabel.leadingAnchor.constraint(equalTo: self.membersImageView.trailingAnchor, constant: 5),
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
        view.layer.shadowOpacity = 0.20
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let postTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()
    
    let numberOfRepliesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var membersImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "speechBubble")
        return view
    }()
    
}
