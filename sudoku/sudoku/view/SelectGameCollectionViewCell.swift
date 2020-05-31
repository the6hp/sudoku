//
//  SelectGameCollectionViewCell.swift
//  sudoku
//
//  Created by Alexander Penkov on 25.05.2020.
//  Copyright © 2020 Alexander Penkov. All rights reserved.
//

import UIKit

class SelectGameCollectionViewCell: UICollectionViewCell {
    
    override func prepareForReuse() -> Void {
        super.prepareForReuse()
        
        self.selectGameCellLabel.text = nil

    }
    
    
    @IBOutlet weak var selectGameCellLabel: UILabel!
    @IBOutlet weak var selectGameTimeLabel: UILabel!
    
    
    var SelectGameCellFull: SelectGameCellStruct? {
        didSet {
            selectGameCellLabel.text = SelectGameCellFull?.name
            selectGameTimeLabel.text = SelectGameCellFull?.time
        }
    }
}
