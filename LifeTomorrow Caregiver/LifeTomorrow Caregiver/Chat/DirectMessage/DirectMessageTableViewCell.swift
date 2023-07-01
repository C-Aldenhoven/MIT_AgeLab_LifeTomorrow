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
            }
            
            if let address = directMessageItem.address {
                addressLabel.text = " \(address) "
            }
            
            if let openingHours = directMessageItem.openingHours {
                openingHoursLabel.text = " \(openingHours) "
            }
            
            cellImageView.image = UIImage(named: "dummyFinderImage")
            
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(cellContainerView)
        cellContainerView.addSubview(cellImageView)
        cellContainerView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(addressLabel)
        containerView.addSubview(openingHoursLabel)
        
        let constraints = [
            cellContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 7.5),
            cellContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -7.5),
            cellContainerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            cellContainerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            
            cellImageView.leadingAnchor.constraint(equalTo: self.cellContainerView.leadingAnchor),
            cellImageView.topAnchor.constraint(equalTo: self.cellContainerView.topAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: self.cellContainerView.bottomAnchor),
            cellImageView.widthAnchor.constraint(equalToConstant: 120),
            
            containerView.leadingAnchor.constraint(equalTo: self.cellImageView.trailingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.cellContainerView.trailingAnchor, constant: 10),
            containerView.topAnchor.constraint(equalTo: cellContainerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: cellContainerView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -5),
            
            addressLabel.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            
            openingHoursLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -10),
            openingHoursLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
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
        return img
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()
    
    let openingHoursLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}
