//
//  MenuCollectionViewCell.swift
//  uicollectionView_lesson
//
//  Created by Alexander Penkov on 08.01.2020.
//  Copyright © 2020 Alexander Penkov. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var CellFull: CellStruct? {
        didSet {
            nameLabel.text = CellFull?.name
        }
    }
    

    
}
