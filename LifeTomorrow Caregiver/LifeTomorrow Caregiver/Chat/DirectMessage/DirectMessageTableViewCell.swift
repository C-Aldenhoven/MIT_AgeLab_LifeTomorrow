//
//  DirectMessageTableViewCell.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 01.07.23.
//

import UIKit

class DirectMessageTableViewCell: UITableViewCell {
    
    var directMessage: DirectMessage? {
        didSet {
            guard let directMessageItem = directMessage else {return}
            if let name = directMessageItem.name {
                nameLabel.text = name
                cellImageView.image = UIImage(named: name)
            }
            
            if let lastMessage = directMessageItem.lastMessage {
                lastMessageLabel.text = "\(lastMessage) "
            }
            
            if let lastMessageTime = directMessageItem.lastMessageTime {
                lastMessageTimeLabel.text = "\(lastMessageTime) "
            }
            
            if directMessageItem.unread! {
                messageUnreadImageView.image = UIImage(named: "messageUnread")
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(cellContainerView)
        cellContainerView.addSubview(cellImageView)
        cellContainerView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(lastMessageLabel)
        containerView.addSubview(lastMessageTimeLabel)
        containerView.addSubview(messageUnreadImageView)
        
        let constraints = [
            cellContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            cellContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            cellContainerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            cellContainerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            
            cellImageView.leadingAnchor.constraint(equalTo: self.cellContainerView.leadingAnchor, constant: 10),
            cellImageView.topAnchor.constraint(equalTo: self.cellContainerView.topAnchor, constant: 10),
            cellImageView.bottomAnchor.constraint(equalTo: self.cellContainerView.bottomAnchor, constant: -10),
            cellImageView.widthAnchor.constraint(equalToConstant: 70),
            
            containerView.leadingAnchor.constraint(equalTo: self.cellImageView.trailingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.cellContainerView.trailingAnchor, constant: 10),
            containerView.topAnchor.constraint(equalTo: cellContainerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: cellContainerView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -5),
            
            lastMessageTimeLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 10),
            lastMessageTimeLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -20),
            
            lastMessageLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5),
            lastMessageLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            
            messageUnreadImageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -25),
            messageUnreadImageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -20),
            messageUnreadImageView.heightAnchor.constraint(equalToConstant: 20),
            messageUnreadImageView.widthAnchor.constraint(equalToConstant: 20)
            
            
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
    
    let cellImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        return img
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()
    
    let lastMessageTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var messageUnreadImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
}
