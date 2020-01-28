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
        sizeElementStatistics()
        changeBorder()
        startStatistics()
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
    
    func startStatistics () {
        gamesPlayedLabelText.text = String(statistics.statisticsEasyGamesPlayed)
        gamesCompletedLabelText.text = String(statistics.statisticEasyGamesCompleted)
        winRateLabelText.text = String(statistics.statisticEasyWinRate)
        bestWinStreakLabelText.text = String(statistics.statisticEasyBestWinStreak)
        bestTimeLabelText.text = String(statistics.statisticEasyBestTime)
        averageTimeLabelText.text = String(statistics.statisticEasyAverageTime)
    }

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func changeIndex(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            gamesPlayedLabelText.text = String(statistics.statisticsEasyGamesPlayed)
            gamesCompletedLabelText.text = String(statistics.statisticEasyGamesCompleted)
            winRateLabelText.text = "\(String(statistics.statisticEasyWinRate)) %"
            bestWinStreakLabelText.text = String(statistics.statisticEasyBestWinStreak)
            bestTimeLabelText.text = String(statistics.statisticEasyBestTime)
            averageTimeLabelText.text = String(statistics.statisticEasyAverageTime)
        case 1:
            gamesPlayedLabelText.text = String(statistics.statisticsAverageGamesPlayed)
            gamesCompletedLabelText.text = String(statistics.statisticAverageGamesCompleted)
            winRateLabelText.text = "\(String(statistics.statisticAverageWinRate)) %"
            bestWinStreakLabelText.text = String(statistics.statisticAverageBestWinStreak)
            bestTimeLabelText.text = String(statistics.statisticAverageBestTime)
            averageTimeLabelText.text = String(statistics.statisticAverageAverageTime)
        case 2:
            gamesPlayedLabelText.text = String(statistics.statisticsHardGamesPlayed)
            gamesCompletedLabelText.text = String(statistics.statisticHardGamesCompleted)
            winRateLabelText.text = "\(String(statistics.statisticHardWinRate)) %"
            bestWinStreakLabelText.text = String(statistics.statisticHardBestWinStreak)
            bestTimeLabelText.text = String(statistics.statisticHardBestTime)
            averageTimeLabelText.text = String(statistics.statisticHardAverageTime)
        case 3:
            gamesPlayedLabelText.text = String(statistics.statisticsExpertGamesPlayed)
            gamesCompletedLabelText.text = String(statistics.statisticExpertGamesCompleted)
            winRateLabelText.text = "\(String(statistics.statisticExpertWinRate)) %"
            bestWinStreakLabelText.text = String(statistics.statisticExpertBestWinStreak)
            bestTimeLabelText.text = String(statistics.statisticExpertBestTime)
            averageTimeLabelText.text = String(statistics.statisticExpertAverageTime)
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
    
    @IBOutlet weak var resetButtonOutlet: UIButton!
    @IBAction func resetStatistics(_ sender: Any) {
            statistics.statisticsEasyGamesPlayed = 0
            statistics.statisticEasyGamesCompleted = 0
            statistics.statisticEasyWinRate = 0
            statistics.statisticEasyBestWinStreak = 0
            statistics.statisticEasyBestTime = 0
            statistics.statisticEasyAverageTime = 0

            statistics.statisticsAverageGamesPlayed = 0
            statistics.statisticAverageGamesCompleted = 0
            statistics.statisticAverageWinRate = 0
            statistics.statisticAverageBestWinStreak = 0
            statistics.statisticAverageBestTime = 0
            statistics.statisticAverageAverageTime = 0

            statistics.statisticsHardGamesPlayed = 0
            statistics.statisticHardGamesCompleted = 0
            statistics.statisticHardWinRate = 0
            statistics.statisticHardBestWinStreak = 0
            statistics.statisticHardBestTime = 0
            statistics.statisticHardAverageTime = 0

            statistics.statisticsExpertGamesPlayed = 0
            statistics.statisticExpertGamesCompleted = 0
            statistics.statisticExpertWinRate = 0
            statistics.statisticExpertBestWinStreak = 0
            statistics.statisticExpertBestTime = 0
            statistics.statisticExpertAverageTime = 0
        
    }
    
    
    func sizeElementStatistics () {
        let screenWidth = UIScreen.main.bounds.width
        switch screenWidth {
        case 375:
            self.segmentedControl.frame = CGRect(x: 20, y: 100, width: 335, height: 32)
        case 320:
            self.segmentedControl.frame = CGRect(x: 5, y: 80, width: 310, height: 33)
            
            self.gamesPlayedLabel.frame = CGRect(x: 5, y: 150, width: 310, height: 35)
            self.gamesCompletedLabel.frame = CGRect(x: 5, y: 185, width: 310, height: 35)
            self.winRateLabel.frame = CGRect(x: 5, y: 220, width: 310, height: 35)
            self.betWinStreakLabel.frame = CGRect(x: 5, y: 255, width: 310, height: 35)
            self.bestTimeLabel.frame = CGRect(x: 5, y: 290, width: 310, height: 35)
            self.averageTimeLabel.frame = CGRect(x: 5, y: 325, width: 310, height: 35)
            
            self.gamesPlayedLabelText.frame = CGRect(x: 230, y: 150, width: 80, height: 30)
            self.gamesCompletedLabelText.frame = CGRect(x: 230, y: 185, width: 80, height: 30)
            self.winRateLabelText.frame = CGRect(x: 230, y: 220, width: 80, height: 30)
            self.bestWinStreakLabelText.frame = CGRect(x: 230, y: 255, width: 80, height: 30)
            self.bestTimeLabelText.frame = CGRect(x: 230, y: 290, width: 80, height: 30)
            self.averageTimeLabelText.frame = CGRect(x: 230, y: 325, width: 80, height: 30)
            
            self.resetButtonOutlet.frame = CGRect(x: 60, y: 380, width: 200, height: 30)
            
        default:
            break
        }

    }
    
    
}




//------------------------------------------------------//
//Изменение толщины и цвета границ
//------------------------------------------------------//

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

//------------------------------------------------------//


