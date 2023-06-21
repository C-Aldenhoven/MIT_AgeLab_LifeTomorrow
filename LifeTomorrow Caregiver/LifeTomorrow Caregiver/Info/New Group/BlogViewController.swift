//
//  BlogsViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 21.06.23.
//

import UIKit

class BlogsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let contacts = BlogAPI.getBlogs() // model
    let contactsTableView = UITableView() // view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(topTitleLabel)
        view.addSubview(contactsTableView)
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = self.view.safeAreaLayoutGuide
        
        let constraints = [
            topTitleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: -40),
            topTitleLabel.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 10),
            topTitleLabel.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -10),
            
            contactsTableView.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor),
            contactsTableView.leftAnchor.constraint(equalTo: guide.leftAnchor),
            contactsTableView.rightAnchor.constraint(equalTo: guide.rightAnchor),
            contactsTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        
        contactsTableView.register(BlogTableViewCell.self, forCellReuseIdentifier: "contactCell")
        
        contactsTableView.separatorStyle = .none
        
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Information"
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //      let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! BlogTableViewCell
        
        //      cell.textLabel?.text = contacts[indexPath.row].name
        cell.blog = contacts[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    
}
