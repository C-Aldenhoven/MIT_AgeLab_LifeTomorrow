//
//  BaseCollectionViewController.swift
//  LifeTomorrow
//
//  Created by Céline Aldenhoven on 23.05.23.
//

import Foundation
import UIKit

class BaseCollectionViewController: UICollectionViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.isTranslucent = true
    navigationController?.navigationBar.tintColor = UIColor.white
    navigationController?.navigationBar.barStyle = UIBarStyle.black
    
    let width = view.frame.size.width / 3
    let height = width + 21
    let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: width, height: height)
  }
}
