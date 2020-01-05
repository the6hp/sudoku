//
//  ViewController.swift
//  sudoku_v_0002
//
//  Created by Alexander Penkov on 04.01.2020.
//  Copyright © 2020 Alexander Penkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBOutlet weak var label_11: UILabel!
    @IBOutlet weak var label_12: UILabel!
    @IBOutlet weak var label_13: UILabel!
    @IBOutlet weak var label_14: UILabel!
    @IBOutlet weak var label_15: UILabel!
    @IBOutlet weak var label_16: UILabel!
    @IBOutlet weak var label_17: UILabel!
    @IBOutlet weak var label_18: UILabel!
    @IBOutlet weak var label_19: UILabel!
    @IBOutlet weak var label_21: UILabel!
    @IBOutlet weak var label_22: UILabel!
    @IBOutlet weak var label_23: UILabel!
    @IBOutlet weak var label_24: UILabel!
    @IBOutlet weak var label_25: UILabel!
    @IBOutlet weak var label_26: UILabel!
    @IBOutlet weak var label_27: UILabel!
    @IBOutlet weak var label_28: UILabel!
    @IBOutlet weak var label_29: UILabel!
    @IBOutlet weak var label_31: UILabel!
    @IBOutlet weak var label_32: UILabel!
    @IBOutlet weak var label_33: UILabel!
    @IBOutlet weak var label_34: UILabel!
    @IBOutlet weak var label_35: UILabel!
    @IBOutlet weak var label_36: UILabel!
    @IBOutlet weak var label_37: UILabel!
    @IBOutlet weak var label_38: UILabel!
    @IBOutlet weak var label_39: UILabel!
    @IBOutlet weak var label_41: UILabel!
    @IBOutlet weak var label_42: UILabel!
    @IBOutlet weak var label_43: UILabel!
    @IBOutlet weak var label_44: UILabel!
    @IBOutlet weak var label_45: UILabel!
    @IBOutlet weak var label_46: UILabel!
    @IBOutlet weak var label_47: UILabel!
    @IBOutlet weak var label_48: UILabel!
    @IBOutlet weak var label_49: UILabel!
    @IBOutlet weak var label_51: UILabel!
    @IBOutlet weak var label_52: UILabel!
    @IBOutlet weak var label_53: UILabel!
    @IBOutlet weak var label_54: UILabel!
    @IBOutlet weak var label_55: UILabel!
    @IBOutlet weak var label_56: UILabel!
    @IBOutlet weak var label_57: UILabel!
    @IBOutlet weak var label_58: UILabel!
    @IBOutlet weak var label_59: UILabel!
    @IBOutlet weak var label_61: UILabel!
    @IBOutlet weak var label_62: UILabel!
    @IBOutlet weak var label_63: UILabel!
    @IBOutlet weak var label_64: UILabel!
    @IBOutlet weak var label_65: UILabel!
    @IBOutlet weak var label_66: UILabel!
    @IBOutlet weak var label_67: UILabel!
    @IBOutlet weak var label_68: UILabel!
    @IBOutlet weak var label_69: UILabel!
    @IBOutlet weak var label_71: UILabel!
    @IBOutlet weak var label_72: UILabel!
    @IBOutlet weak var label_73: UILabel!
    @IBOutlet weak var label_74: UILabel!
    @IBOutlet weak var label_75: UILabel!
    @IBOutlet weak var label_76: UILabel!
    @IBOutlet weak var label_77: UILabel!
    @IBOutlet weak var label_78: UILabel!
    @IBOutlet weak var label_79: UILabel!
    @IBOutlet weak var label_81: UILabel!
    @IBOutlet weak var label_82: UILabel!
    @IBOutlet weak var label_83: UILabel!
    @IBOutlet weak var label_84: UILabel!
    @IBOutlet weak var label_85: UILabel!
    @IBOutlet weak var label_86: UILabel!
    @IBOutlet weak var label_87: UILabel!
    @IBOutlet weak var label_88: UILabel!
    @IBOutlet weak var label_89: UILabel!
    @IBOutlet weak var label_91: UILabel!
    @IBOutlet weak var label_92: UILabel!
    @IBOutlet weak var label_93: UILabel!
    @IBOutlet weak var label_94: UILabel!
    @IBOutlet weak var label_95: UILabel!
    @IBOutlet weak var label_96: UILabel!
    @IBOutlet weak var label_97: UILabel!
    @IBOutlet weak var label_98: UILabel!
    @IBOutlet weak var label_99: UILabel!
    
    
    
    
    
    @IBAction func fillingAll(_ sender: Any) {
        filling()
    }
    @IBAction func transposingAll(_ sender: Any) {
        allNumbers = transposing(array: allNumbers)
        filling()
    }
    @IBAction func swap_rows_small(_ sender: Any) {
        allNumbers = swap_rows_small_all (array: allNumbers)
        filling()
    }
    @IBAction func swap_colums_small(_ sender: Any) {
        allNumbers = swap_colums_small_all (array: allNumbers)
        filling()
    }
    @IBAction func swap_rows_area(_ sender: Any) {
        allNumbers = swap_rows_area_all (array: allNumbers)
        filling()
    }
    @IBAction func swap_colums_area(_ sender: Any) {
        allNumbers = swap_colums_area_all (array: allNumbers)
        filling()
    }
    @IBAction func remove(_ sender: Any) {
    }
    
    @IBAction func cleanAll(_ sender: Any) {
        cleanAll()
    }
    
    @IBAction func help_button(_ sender: Any) {
        allNumbers = [1,2,3,4,5,6,7,8,9,4,5,6,7,8,9,1,2,3,7,8,9,1,2,3,4,5,6,2,3,4,5,6,7,8,9,1,5,6,7,8,9,1,2,3,4,8,9,1,2,3,4,5,6,7,3,4,5,6,7,8,9,1,2,6,7,8,9,1,2,3,4,5,9,1,2,3,4,5,6,7,8]
    }
    
    @IBAction func testButton(_ sender: Any) {

    }
    

    var allNumbers = [1,2,3,4,5,6,7,8,9,4,5,6,7,8,9,1,2,3,7,8,9,1,2,3,4,5,6,2,3,4,5,6,7,8,9,1,5,6,7,8,9,1,2,3,4,8,9,1,2,3,4,5,6,7,3,4,5,6,7,8,9,1,2,6,7,8,9,1,2,3,4,5,9,1,2,3,4,5,6,7,8]
    
    
    
    
    func filling() {
        label_11.text = String (allNumbers[0])
        label_12.text = String (allNumbers[1])
        label_13.text = String (allNumbers[2])
        label_14.text = String (allNumbers[3])
        label_15.text = String (allNumbers[4])
        label_16.text = String (allNumbers[5])
        label_17.text = String (allNumbers[6])
        label_18.text = String (allNumbers[7])
        label_19.text = String (allNumbers[8])
        label_21.text = String (allNumbers[9])
        label_22.text = String (allNumbers[10])
        label_23.text = String (allNumbers[11])
        label_24.text = String (allNumbers[12])
        label_25.text = String (allNumbers[13])
        label_26.text = String (allNumbers[14])
        label_27.text = String (allNumbers[15])
        label_28.text = String (allNumbers[16])
        label_29.text = String (allNumbers[17])
        label_31.text = String (allNumbers[18])
        label_32.text = String (allNumbers[19])
        label_33.text = String (allNumbers[20])
        label_34.text = String (allNumbers[21])
        label_35.text = String (allNumbers[22])
        label_36.text = String (allNumbers[23])
        label_37.text = String (allNumbers[24])
        label_38.text = String (allNumbers[25])
        label_39.text = String (allNumbers[26])
        label_41.text = String (allNumbers[27])
        label_42.text = String (allNumbers[28])
        label_43.text = String (allNumbers[29])
        label_44.text = String (allNumbers[30])
        label_45.text = String (allNumbers[31])
        label_46.text = String (allNumbers[32])
        label_47.text = String (allNumbers[33])
        label_48.text = String (allNumbers[34])
        label_49.text = String (allNumbers[35])
        label_51.text = String (allNumbers[36])
        label_52.text = String (allNumbers[37])
        label_53.text = String (allNumbers[38])
        label_54.text = String (allNumbers[39])
        label_55.text = String (allNumbers[40])
        label_56.text = String (allNumbers[41])
        label_57.text = String (allNumbers[42])
        label_58.text = String (allNumbers[43])
        label_59.text = String (allNumbers[44])
        label_61.text = String (allNumbers[45])
        label_62.text = String (allNumbers[46])
        label_63.text = String (allNumbers[47])
        label_64.text = String (allNumbers[48])
        label_65.text = String (allNumbers[49])
        label_66.text = String (allNumbers[50])
        label_67.text = String (allNumbers[51])
        label_68.text = String (allNumbers[52])
        label_69.text = String (allNumbers[53])
        label_71.text = String (allNumbers[54])
        label_72.text = String (allNumbers[55])
        label_73.text = String (allNumbers[56])
        label_74.text = String (allNumbers[57])
        label_75.text = String (allNumbers[58])
        label_76.text = String (allNumbers[59])
        label_77.text = String (allNumbers[60])
        label_78.text = String (allNumbers[61])
        label_79.text = String (allNumbers[62])
        label_81.text = String (allNumbers[63])
        label_82.text = String (allNumbers[64])
        label_83.text = String (allNumbers[65])
        label_84.text = String (allNumbers[66])
        label_85.text = String (allNumbers[67])
        label_86.text = String (allNumbers[68])
        label_87.text = String (allNumbers[69])
        label_88.text = String (allNumbers[70])
        label_89.text = String (allNumbers[71])
        label_91.text = String (allNumbers[72])
        label_92.text = String (allNumbers[73])
        label_93.text = String (allNumbers[74])
        label_94.text = String (allNumbers[75])
        label_95.text = String (allNumbers[76])
        label_96.text = String (allNumbers[77])
        label_97.text = String (allNumbers[78])
        label_98.text = String (allNumbers[79])
        label_99.text = String (allNumbers[80])
    }
    
    func cleanAll() {
        label_11.text = ""
        label_12.text = ""
        label_13.text = ""
        label_14.text = ""
        label_15.text = ""
        label_16.text = ""
        label_17.text = ""
        label_18.text = ""
        label_19.text = ""
        label_21.text = ""
        label_22.text = ""
        label_23.text = ""
        label_24.text = ""
        label_25.text = ""
        label_26.text = ""
        label_27.text = ""
        label_28.text = ""
        label_29.text = ""
        label_31.text = ""
        label_32.text = ""
        label_33.text = ""
        label_34.text = ""
        label_35.text = ""
        label_36.text = ""
        label_37.text = ""
        label_38.text = ""
        label_39.text = ""
        label_41.text = ""
        label_42.text = ""
        label_43.text = ""
        label_44.text = ""
        label_45.text = ""
        label_46.text = ""
        label_47.text = ""
        label_48.text = ""
        label_49.text = ""
        label_51.text = ""
        label_52.text = ""
        label_53.text = ""
        label_54.text = ""
        label_55.text = ""
        label_56.text = ""
        label_57.text = ""
        label_58.text = ""
        label_59.text = ""
        label_61.text = ""
        label_62.text = ""
        label_63.text = ""
        label_64.text = ""
        label_65.text = ""
        label_66.text = ""
        label_67.text = ""
        label_68.text = ""
        label_69.text = ""
        label_71.text = ""
        label_72.text = ""
        label_73.text = ""
        label_74.text = ""
        label_75.text = ""
        label_76.text = ""
        label_77.text = ""
        label_78.text = ""
        label_79.text = ""
        label_81.text = ""
        label_82.text = ""
        label_83.text = ""
        label_84.text = ""
        label_85.text = ""
        label_86.text = ""
        label_87.text = ""
        label_88.text = ""
        label_89.text = ""
        label_91.text = ""
        label_92.text = ""
        label_93.text = ""
        label_94.text = ""
        label_95.text = ""
        label_96.text = ""
        label_97.text = ""
        label_98.text = ""
        label_99.text = ""
    }
    
    
    
    
}

