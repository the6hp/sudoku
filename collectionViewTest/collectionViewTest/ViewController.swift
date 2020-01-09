//
//  ViewController.swift
//  collectionViewTest
//
//  Created by Alexander Penkov on 08.01.2020.
//  Copyright © 2020 Alexander Penkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var mainViewCell: UICollectionView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var CollectionViewCell: UICollectionViewCell!
    
    var allNumbers = [1,2,3,4,5,6,7,8,9,4,5,6,7,8,9,1,2,3,7,8,9,1,2,3,4,5,6,2,3,4,5,6,7,8,9,1,5,6,7,8,9,1,2,3,4,8,9,1,2,3,4,5,6,7,3,4,5,6,7,8,9,1,2,6,7,8,9,1,2,3,4,5,9,1,2,3,4,5,6,7,8]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allNumbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView(<#T##collectionView: UICollectionView##UICollectionView#>, numberOfItemsInSection: <#T##Int#>)

        
        return cell
    }
    
    
}

