//
//  StatisticViewController.swift
//  uicollectionView_lesson
//
//  Created by Alexander Penkov on 09.01.2020.
//  Copyright © 2020 Alexander Penkov. All rights reserved.
//

import UIKit

class StatisticViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changeBorder()

    }
    
    @IBOutlet weak var gamesPlayedLabel: UILabel!
    @IBOutlet weak var gamesCompletedLabel: UILabel!
    @IBOutlet weak var winRateLabel: UILabel!
    @IBOutlet weak var betWinStreakLabel: UILabel!
    @IBOutlet weak var bestTimeLabel: UILabel!
    @IBOutlet weak var averageTimeLabel: UILabel!
    
    
    @IBOutlet weak var gamesPlayedLabelText: UILabel!
    @IBOutlet weak var gamesCompletedLabelText: UILabel!
    @IBOutlet weak var winRateLabelText: UILabel!
    @IBOutlet weak var bestWinStreakLabelText: UILabel!
    @IBOutlet weak var bestTimeLabelText: UILabel!
    @IBOutlet weak var averageTimeLabelText: UILabel!
    
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func changeIndex(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            gamesPlayedLabelText.text = "0"
            gamesCompletedLabelText.text = "0"
            winRateLabelText.text = "0"
            bestWinStreakLabelText.text = "0"
            bestTimeLabelText.text = "00:00"
            averageTimeLabelText.text = "00:00"
        case 1:
            gamesPlayedLabelText.text = "1"
            gamesCompletedLabelText.text = "1"
            winRateLabelText.text = "1"
            bestWinStreakLabelText.text = "1"
            bestTimeLabelText.text = "01:01"
            averageTimeLabelText.text = "10:10"
        case 2:
            gamesPlayedLabelText.text = "2"
            gamesCompletedLabelText.text = "2"
            winRateLabelText.text = "2"
            bestWinStreakLabelText.text = "2"
            bestTimeLabelText.text = "02:02"
            averageTimeLabelText.text = "20:20"
        case 3:
            gamesPlayedLabelText.text = "3"
            gamesCompletedLabelText.text = "3"
            winRateLabelText.text = "3"
            bestWinStreakLabelText.text = "3"
            bestTimeLabelText.text = "03:03"
            averageTimeLabelText.text = "30:30"
        default:
            break
        }
    }
    
    
    func changeBorder () {
        gamesPlayedLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.black, thickness: 0.3)
        gamesPlayedLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 0.3)
        gamesCompletedLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 0.3)
        winRateLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 0.3)
        betWinStreakLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 0.3)
        bestTimeLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 0.3)
        averageTimeLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 0.3)

    }
    
    
    
}


extension CALayer {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {

        let border = CALayer()

        switch edge {
            case UIRectEdge.top:
             border.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: thickness)

            case UIRectEdge.bottom:
             border.frame = CGRect(x: 0, y: self.bounds.height - thickness,  width: self.bounds.width, height: thickness)

            case UIRectEdge.left:
             border.frame = CGRect(x: 0, y: 0,  width: thickness, height: self.bounds.height)

            case UIRectEdge.right:
             border.frame = CGRect(x: self.bounds.width - thickness, y: 0,  width: thickness, height: self.bounds.height)

            default:
             break
        }
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
}
