//
//  MenuCollectionViewCell.swift
//  uicollectionView_lesson
//
//  Created by Alexander Penkov on 08.01.2020.
//  Copyright © 2020 Alexander Penkov. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    override func prepareForReuse() -> Void {
        self.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.white, thickness: 1)
        self.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.white, thickness: 1)
        self.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: UIColor.white, thickness: 1)
        self.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: UIColor.white, thickness: 1)
        isSelected = false
        super.prepareForReuse()
    }

    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var miniNameLabel_1: UILabel!
    @IBOutlet weak var miniNameLabel_2: UILabel!
    @IBOutlet weak var miniNameLabel_3: UILabel!
    @IBOutlet weak var miniNameLabel_4: UILabel!
    @IBOutlet weak var miniNameLabel_5: UILabel!
    @IBOutlet weak var miniNameLabel_6: UILabel!
    @IBOutlet weak var miniNameLabel_7: UILabel!
    @IBOutlet weak var miniNameLabel_8: UILabel!
    @IBOutlet weak var miniNameLabel_9: UILabel!
    
    
            
    
    var CellFull: CellStruct? {
        didSet {
            nameLabel.text = CellFull?.name
            miniNameLabel_1.text = CellFull?.name
            miniNameLabel_2.text = CellFull?.name
            miniNameLabel_3.text = CellFull?.name
            miniNameLabel_4.text = CellFull?.name
            miniNameLabel_5.text = CellFull?.name
            miniNameLabel_6.text = CellFull?.name
            miniNameLabel_7.text = CellFull?.name
            miniNameLabel_8.text = CellFull?.name
            miniNameLabel_9.text = CellFull?.name
        }
    }
        
}
