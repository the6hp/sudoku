import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
//    class CustomFlowLayout : UICollectionViewFlowLayout {
//      var insertingIndexPaths = [IndexPath]()
//
//    }
    
    
    
    override func prepareForReuse() -> Void {
        super.prepareForReuse()
        
        self.nameLabel.layer.sublayers?.removeAll()
//        self.nameLabel.text = nil
//        self.miniNameLabel_1.text = nil
//        self.miniNameLabel_2.text = nil
//        self.miniNameLabel_3.text = nil
//        self.miniNameLabel_4.text = nil
//        self.miniNameLabel_5.text = nil
//        self.miniNameLabel_6.text = nil
//        self.miniNameLabel_7.text = nil
//        self.miniNameLabel_8.text = nil
//        self.miniNameLabel_9.text = nil
        
        isSelected = false
        
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
