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
            winRateLabelText.text = String(statistics.statisticEasyWinRate)
            bestWinStreakLabelText.text = String(statistics.statisticEasyBestWinStreak)
            bestTimeLabelText.text = String(statistics.statisticEasyBestTime)
            averageTimeLabelText.text = String(statistics.statisticEasyAverageTime)
        case 1:
            gamesPlayedLabelText.text = String(statistics.statisticsAverageGamesPlayed)
            gamesCompletedLabelText.text = String(statistics.statisticAverageGamesCompleted)
            winRateLabelText.text = String(statistics.statisticAverageWinRate)
            bestWinStreakLabelText.text = String(statistics.statisticAverageBestWinStreak)
            bestTimeLabelText.text = String(statistics.statisticAverageBestTime)
            averageTimeLabelText.text = String(statistics.statisticAverageAverageTime)
        case 2:
            gamesPlayedLabelText.text = String(statistics.statisticsHardGamesPlayed)
            gamesCompletedLabelText.text = String(statistics.statisticHardGamesCompleted)
            winRateLabelText.text = String(statistics.statisticHardWinRate)
            bestWinStreakLabelText.text = String(statistics.statisticHardBestWinStreak)
            bestTimeLabelText.text = String(statistics.statisticHardBestTime)
            averageTimeLabelText.text = String(statistics.statisticHardAverageTime)
        case 3:
            gamesPlayedLabelText.text = String(statistics.statisticsExpertGamesPlayed)
            gamesCompletedLabelText.text = String(statistics.statisticExpertGamesCompleted)
            winRateLabelText.text = String(statistics.statisticExpertWinRate)
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
