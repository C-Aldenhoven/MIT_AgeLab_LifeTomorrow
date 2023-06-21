//
//  HomeViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 08.05.23.
//

import Foundation
import UIKit
import HomeKit

class SmartHomeViewController: UICollectionViewController {
    
    var homes: [HMHome] = []
    let homeManager = HMHomeManager()
    
    let cellId : String = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .purple
        self.navigationItem.titleView = topTitleLabel
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newHome))
        
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: "itemCell")
        
        addHomes(homeManager.homes)
        
        collectionView?.reloadData()
        
        homeManager.delegate = self
    }
    
    // MARK: UI-Elements
    
    private var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Smart Home"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    // MARK: Collection View
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return homes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! HomeCell
      cell.home = homes[indexPath.row]
      
      return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      collectionView.deselectItem(at: indexPath, animated: true)
      
      let target = AccessoryViewController()
      target.home = homes[indexPath.row]
      navigationController?.pushViewController(target, animated: true)
    }
    
    // MARK: Functions
    
    @objc func newHome() {
      showInputDialog { homeName, roomName in
          self.homeManager.addHome(withName: homeName) { [weak self] home, error in
            guard let self = self else {
              return
            }

            if let error = error {
              print("Failed to add home: \(error.localizedDescription)")
            }

            if let discoveredHome = home {
              discoveredHome.addRoom(withName: roomName) { _, error  in

                if let error = error {
                  print("Failed to add room: \(error.localizedDescription)")
                } else {
                  self.homes.append(discoveredHome)
                  self.collectionView?.reloadData()
                }
              }
            }
          }
      }
    }
    
    func showInputDialog(_ handler: @escaping ((String, String) -> Void)) {
      let alertController = UIAlertController(title: "Create new Home?",
                                              message: "Enter the name of your new home and give it a Room",
                                              preferredStyle: .alert)
      
      let confirmAction = UIAlertAction(title: "Create", style: .default) { _ in
        guard let homeName = alertController.textFields?[0].text,
              let roomName = alertController.textFields?[1].text else {
          return
        }

        handler(homeName, roomName)
      }
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
      
      alertController.addTextField { textField in
        textField.placeholder = "Enter Home name"
      }
      alertController.addTextField { textField in
        textField.placeholder = "Enter Room name"
      }
      
      alertController.addAction(confirmAction)
      alertController.addAction(cancelAction)
      
      present(alertController, animated: true)
    }
    
    func addHomes(_ homes: [HMHome]) {
      self.homes.removeAll()
      for home in homes {
        self.homes.append(home)
      }
      collectionView?.reloadData()
    }
}

extension SmartHomeViewController: HMHomeManagerDelegate {
  func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
    addHomes(manager.homes)
  }
}
