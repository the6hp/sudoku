//
//  ViewController.swift
//  sudoku_v_0001
//
//  Created by Alexander Penkov on 30.12.2019.
//  Copyright © 2019 Alexander Penkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //подписываемся для умения отображать данные
        collectionView.dataSource = self
        //подписываемся для возможности передачи параметров
        collectionView.delegate = self

    }
}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }

}
