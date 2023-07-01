//
//  ChatViewController.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 09.05.23.
//

import Foundation
import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    private var directMessages = DirectMessageAPI.getDirectMessages()
    private var channels = ChannelAPI.getChannels()
    let tableView = UITableView() // view
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        stackView.addArrangedSubview(topTitleLabel)
        stackView.addArrangedSubview(segmentedControl)
        stackView.addArrangedSubview(tableView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(DirectMessageTableViewCell.self, forCellReuseIdentifier: "directMessageCell")
        tableView.register(ChannelTableViewCell.self, forCellReuseIdentifier: "channelCell")
        tableView.separatorStyle = .none
        
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.searchResultsUpdater = self
        
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.obscuresBackgroundDuringPresentation = false
        
    }
    
    // MARK: Search
    
    func updateSearchResults(for searchController: UISearchController) {
        if segmentedControl.selectedSegmentIndex == 0 {
            if let searchText = searchController.searchBar.text, !searchText.isEmpty {
                directMessages = DirectMessageAPI.getDirectMessages().filter { directMessage in
                    directMessage.name!.localizedCaseInsensitiveContains(searchText)
                }
            } else {
                directMessages = DirectMessageAPI.getDirectMessages()
            }
        } else if segmentedControl.selectedSegmentIndex == 1 {
            if let searchText = searchController.searchBar.text, !searchText.isEmpty {
                channels = ChannelAPI.getChannels().filter { channel in
                    channel.name!.localizedCaseInsensitiveContains(searchText)
                }
            } else {
                channels = ChannelAPI.getChannels()
            }
        }
        tableView.reloadData()
    }
    
    // MARK: Segmented Control
    
    @objc func segmentedValueChanged(){
        tableView.reloadData()
    }
    
    // MARK: UI-Elements
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "  Chats"
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl (items: ["Direct Messages","Channes"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    // MARK: Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return directMessages.count
        } else if segmentedControl.selectedSegmentIndex == 1 {
            return channels.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentedControl.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "directMessageCell", for: indexPath) as! DirectMessageTableViewCell
            
            cell.directMessage = directMessages[indexPath.row]
            
            return cell
        } else if segmentedControl.selectedSegmentIndex == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as! ChannelTableViewCell
            
            cell.channel = channels[indexPath.row]
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if segmentedControl.selectedSegmentIndex == 0 {
            return 110
        } else if segmentedControl.selectedSegmentIndex == 1 {
            return 210
        } else {
            return 0
        }
    }
    
}



/*
class ChatViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let uiConfig = ATCChatUIConfiguration(primaryColor: UIColor(hexString: "#0084ff"),
                                              secondaryColor: UIColor(hexString: "#f0f0f0"),
                                              inputTextViewBgColor: UIColor(hexString: "#f4f4f6"),
                                              inputTextViewTextColor: .black,
                                              inputPlaceholderTextColor: UIColor(hexString: "#979797"))
        let channel = ATCChatChannel(id: "channel_id", name: "Chat Title")
        let viewer = ATCUser(firstName: "Florian", lastName: "Marcu")
        let chatVC = ATCChatThreadViewController(user: viewer, channel: channel, uiConfig: uiConfig)
        
        navigationController?.pushViewController(chatVC, animated: true)
    }
    
}*/
