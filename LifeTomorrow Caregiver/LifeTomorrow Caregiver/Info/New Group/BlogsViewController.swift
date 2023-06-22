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
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(topTitleLabel)
        stackView.addArrangedSubview(blogsTableView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        blogsTableView.translatesAutoresizingMaskIntoConstraints = false
        blogsTableView.dataSource = self
        blogsTableView.delegate = self
        
        blogsTableView.register(BlogTableViewCell.self, forCellReuseIdentifier: "blogCell")
        blogsTableView.separatorStyle = .none
        
        blogsTableView.tableHeaderView = searchController.searchBar
        
        searchController.searchResultsUpdater = self
        
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    // MARK: Search
    
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
        label.text = "  Information"
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

