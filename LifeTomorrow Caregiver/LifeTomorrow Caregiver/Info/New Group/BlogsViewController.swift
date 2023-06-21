//
//  BlogsViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 21.06.23.
//

import UIKit

class BlogsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    private var blogs = BlogAPI.getBlogs() // model
    let blogsTableView = UITableView() // view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(topTitleLabel)
        view.addSubview(blogsTableView)
        
        blogsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = self.view.safeAreaLayoutGuide
        
        let constraints = [
            topTitleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: -40),
            topTitleLabel.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 10),
            topTitleLabel.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -10),
            
            blogsTableView.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor),
            blogsTableView.leftAnchor.constraint(equalTo: guide.leftAnchor),
            blogsTableView.rightAnchor.constraint(equalTo: guide.rightAnchor),
            blogsTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        blogsTableView.dataSource = self
        blogsTableView.delegate = self
        
        blogsTableView.register(BlogTableViewCell.self, forCellReuseIdentifier: "blogCell")
        
        blogsTableView.separatorStyle = .none
        
        self.setupSearch()
        
    }
    
    // MARK: Search
    
    private var searchController = UISearchController(searchResultsController: nil)
    
    func setupSearch() {
        self.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            blogs = BlogAPI.getBlogs().filter { blog in
                blog.title!.localizedCaseInsensitiveContains(searchText)
            }
        } else {
            blogs = BlogAPI.getBlogs()
        }
        
        blogsTableView.reloadData()
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
        return blogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "blogCell", for: indexPath) as! BlogTableViewCell
        
        cell.blog = blogs[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    
}
