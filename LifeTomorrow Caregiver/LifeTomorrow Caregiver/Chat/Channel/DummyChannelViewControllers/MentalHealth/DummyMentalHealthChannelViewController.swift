//
//  DummyMentalHealthChannelViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 02.07.23.
//

import UIKit

class DummyMentalHealthChannelViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var posts = MentalHealthPostsAPI.getPosts() // model
    let tableView = UITableView() // view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(tableView)
        view.addSubview(newPostButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            newPostButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            newPostButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newPostButton.heightAnchor.constraint(equalToConstant: 70),
            newPostButton.widthAnchor.constraint(equalToConstant: 150)
            
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "postCell")
        tableView.separatorStyle = .none
        
    }
    
    // MARK: UI-Elements
    
    var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "mentalHealthChannelBackground")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var newPostButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "newPostButton"), for: .normal)
        button.addTarget(self, action: #selector(showNewPostCreationView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: Functions
    
    @objc func showNewPostCreationView() {
        navigationController?.pushViewController(NewPostCreationView(), animated: true)
    }
    
    // MARK: Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        
        cell.post = posts[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            let currentCell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
            if currentCell.titleLabel.text != nil {
            let dummyChatImage = UIImage(named: "dummyMentalHealthChannel" + "\(currentCell.titleLabel.text!)")
            navigationController?.pushViewController(DummySingleImageViewController(image: dummyChatImage!), animated: true)
        }
    }
    
}


