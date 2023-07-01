//
//  FinderViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 09.05.23.
//

import UIKit

class FinderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    private var resources = ResourceAPI.getResources() // model
    let resourcesTableView = UITableView() // view
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
        stackView.addArrangedSubview(resourcesTableView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        resourcesTableView.translatesAutoresizingMaskIntoConstraints = false
        resourcesTableView.dataSource = self
        resourcesTableView.delegate = self
        
        resourcesTableView.register(ResourceTableViewCell.self, forCellReuseIdentifier: "resourceCell")
        resourcesTableView.separatorStyle = .none
        
        resourcesTableView.tableHeaderView = searchController.searchBar
        
        searchController.searchResultsUpdater = self
        
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.obscuresBackgroundDuringPresentation = false
        
    }
    
    // MARK: Search
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            resources = ResourceAPI.getResources().filter { resource in
                resource.name!.localizedCaseInsensitiveContains(searchText)
            }
        } else {
            resources = ResourceAPI.getResources()
        }
        
        resourcesTableView.reloadData()
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "  Finder"
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceCell", for: indexPath) as! ResourceTableViewCell
        
        cell.resource = resources[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}

