import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

class StatisticViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sizeElementStatistics()
        changeBorder()
        startStatistics()
        
        MSAppCenter.start("e5cf9bb1-f536-43e6-b099-0c2dfea36306", withServices:[
          MSCrashes.self
        ])
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
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        
        
        gamesPlayedLabelText.text = String(statistics.statisticsEasyGamesPlayed)
        gamesCompletedLabelText.text = String(statistics.statisticEasyGamesCompleted)
        winRateLabelText.text = "\(String(statistics.statisticEasyWinRate)) %"
        bestWinStreakLabelText.text = String(statistics.statisticEasyBestWinStreak)
        bestTimeLabelText.text = time_int_to_string_bestTime(level: 0)
        averageTimeLabelText.text = time_int_to_string_averageTime(level: 0)
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
            bestTimeLabelText.text = time_int_to_string_bestTime(level: 0)
            averageTimeLabelText.text = time_int_to_string_averageTime(level: 0)
        case 1:
            gamesPlayedLabelText.text = String(statistics.statisticsAverageGamesPlayed)
            gamesCompletedLabelText.text = String(statistics.statisticAverageGamesCompleted)
            winRateLabelText.text = "\(String(statistics.statisticAverageWinRate)) %"
            bestWinStreakLabelText.text = String(statistics.statisticAverageBestWinStreak)
            bestTimeLabelText.text = time_int_to_string_bestTime(level: 1)
            averageTimeLabelText.text = time_int_to_string_averageTime(level: 1)
        case 2:
            gamesPlayedLabelText.text = String(statistics.statisticsHardGamesPlayed)
            gamesCompletedLabelText.text = String(statistics.statisticHardGamesCompleted)
            winRateLabelText.text = "\(String(statistics.statisticHardWinRate)) %"
            bestWinStreakLabelText.text = String(statistics.statisticHardBestWinStreak)
            bestTimeLabelText.text = time_int_to_string_bestTime(level: 2)
            averageTimeLabelText.text = time_int_to_string_averageTime(level: 2)
        case 3:
            gamesPlayedLabelText.text = String(statistics.statisticsExpertGamesPlayed)
            gamesCompletedLabelText.text = String(statistics.statisticExpertGamesCompleted)
            winRateLabelText.text = "\(String(statistics.statisticExpertWinRate)) %"
            bestWinStreakLabelText.text = String(statistics.statisticExpertBestWinStreak)
            bestTimeLabelText.text = time_int_to_string_bestTime(level: 3)
            averageTimeLabelText.text = time_int_to_string_averageTime(level: 3)
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
        
            gamesPlayedLabelText.text = "0"
            gamesCompletedLabelText.text = "0"
            winRateLabelText.text = "0 %"
            bestWinStreakLabelText.text = "0"
            bestTimeLabelText.text = "00:00"
            averageTimeLabelText.text = "00:00"
        
            variables.timeArray = [Int]()
            
            
            saveData()
        }
    
    
    func sizeElementStatistics () {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        switch screenWidth {
        case 375:
            if screenHeight == 667 {
                self.segmentedControl.frame = CGRect(x: 20, y: 80, width: 335, height: 32)
                
                self.gamesPlayedLabel.frame = CGRect(x: 5, y: 150, width: 365, height: 35)
                self.gamesCompletedLabel.frame = CGRect(x: 5, y: 185, width: 365, height: 35)
                self.winRateLabel.frame = CGRect(x: 5, y: 220, width: 365, height: 35)
                self.betWinStreakLabel.frame = CGRect(x: 5, y: 255, width: 365, height: 35)
                self.bestTimeLabel.frame = CGRect(x: 5, y: 290, width: 365, height: 35)
                self.averageTimeLabel.frame = CGRect(x: 5, y: 325, width: 365, height: 35)
                
                self.gamesPlayedLabelText.frame = CGRect(x: 285, y: 150, width: 80, height: 30)
                self.gamesCompletedLabelText.frame = CGRect(x: 285, y: 185, width: 80, height: 30)
                self.winRateLabelText.frame = CGRect(x: 285, y: 220, width: 80, height: 30)
                self.bestWinStreakLabelText.frame = CGRect(x: 285, y: 255, width: 80, height: 30)
                self.bestTimeLabelText.frame = CGRect(x: 285, y: 290, width: 80, height: 30)
                self.averageTimeLabelText.frame = CGRect(x: 285, y: 325, width: 80, height: 30)
                
                self.resetButtonOutlet.frame = CGRect(x: 87, y: 380, width: 200, height: 30)
                
            } else if screenHeight == 812 {
                
                self.segmentedControl.frame = CGRect(x: 20, y: 100, width: 335, height: 32)
                
                self.gamesPlayedLabel.frame = CGRect(x: 5, y: 160, width: 365, height: 35)
                self.gamesCompletedLabel.frame = CGRect(x: 5, y: 195, width: 365, height: 35)
                self.winRateLabel.frame = CGRect(x: 5, y: 230, width: 365, height: 35)
                self.betWinStreakLabel.frame = CGRect(x: 5, y: 265, width: 365, height: 35)
                self.bestTimeLabel.frame = CGRect(x: 5, y: 300, width: 365, height: 35)
                self.averageTimeLabel.frame = CGRect(x: 5, y: 335, width: 365, height: 35)
                
                self.gamesPlayedLabelText.frame = CGRect(x: 285, y: 160, width: 80, height: 30)
                self.gamesCompletedLabelText.frame = CGRect(x: 285, y: 195, width: 80, height: 30)
                self.winRateLabelText.frame = CGRect(x: 285, y: 230, width: 80, height: 30)
                self.bestWinStreakLabelText.frame = CGRect(x: 285, y: 265, width: 80, height: 30)
                self.bestTimeLabelText.frame = CGRect(x: 285, y: 300, width: 80, height: 30)
                self.averageTimeLabelText.frame = CGRect(x: 285, y: 335, width: 80, height: 30)
                
                self.resetButtonOutlet.frame = CGRect(x: 87, y: 390, width: 200, height: 30)
                
            } else {
                self.segmentedControl.frame = CGRect(x: 20, y: 120, width: 335, height: 32)

            }
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
        case 414:
            if screenHeight == 736 {
                
                self.segmentedControl.frame = CGRect(x: 50, y: 80, width: 314, height: 33)
                
                self.gamesPlayedLabel.frame = CGRect(x: 5, y: 140, width: 405, height: 35)
                self.gamesCompletedLabel.frame = CGRect(x: 5, y: 175, width: 405, height: 35)
                self.winRateLabel.frame = CGRect(x: 5, y: 210, width: 405, height: 35)
                self.betWinStreakLabel.frame = CGRect(x: 5, y: 245, width: 405, height: 35)
                self.bestTimeLabel.frame = CGRect(x: 5, y: 280, width: 405, height: 35)
                self.averageTimeLabel.frame = CGRect(x: 5, y: 315, width: 405, height: 35)
                
                self.gamesPlayedLabelText.frame = CGRect(x: 310, y: 140, width: 80, height: 30)
                self.gamesCompletedLabelText.frame = CGRect(x: 310, y: 175, width: 80, height: 30)
                self.winRateLabelText.frame = CGRect(x: 310, y: 210, width: 80, height: 30)
                self.bestWinStreakLabelText.frame = CGRect(x: 310, y: 245, width: 80, height: 30)
                self.bestTimeLabelText.frame = CGRect(x: 310, y: 280, width: 80, height: 30)
                self.averageTimeLabelText.frame = CGRect(x: 310, y: 315, width: 80, height: 30)
                
                self.resetButtonOutlet.frame = CGRect(x: 107, y: 370, width: 200, height: 30)
            } else if screenHeight == 896 {
                
                self.segmentedControl.frame = CGRect(x: 50, y: 100, width: 314, height: 33)
                
                self.gamesPlayedLabel.frame = CGRect(x: 5, y: 160, width: 405, height: 35)
                self.gamesCompletedLabel.frame = CGRect(x: 5, y: 195, width: 405, height: 35)
                self.winRateLabel.frame = CGRect(x: 5, y: 230, width: 405, height: 35)
                self.betWinStreakLabel.frame = CGRect(x: 5, y: 265, width: 405, height: 35)
                self.bestTimeLabel.frame = CGRect(x: 5, y: 300, width: 405, height: 35)
                self.averageTimeLabel.frame = CGRect(x: 5, y: 335, width: 405, height: 35)
                
                self.gamesPlayedLabelText.frame = CGRect(x: 310, y: 160, width: 80, height: 30)
                self.gamesCompletedLabelText.frame = CGRect(x: 310, y: 195, width: 80, height: 30)
                self.winRateLabelText.frame = CGRect(x: 310, y: 230, width: 80, height: 30)
                self.bestWinStreakLabelText.frame = CGRect(x: 310, y: 265, width: 80, height: 30)
                self.bestTimeLabelText.frame = CGRect(x: 310, y: 300, width: 80, height: 30)
                self.averageTimeLabelText.frame = CGRect(x: 310, y: 335, width: 80, height: 30)
                
                self.resetButtonOutlet.frame = CGRect(x: 107, y: 400, width: 200, height: 30)
            } else {
                
                self.segmentedControl.frame = CGRect(x: 50, y: 120, width: 314, height: 33)
                
                self.gamesPlayedLabel.frame = CGRect(x: 5, y: 180, width: 405, height: 35)
                self.gamesCompletedLabel.frame = CGRect(x: 5, y: 215, width: 405, height: 35)
                self.winRateLabel.frame = CGRect(x: 5, y: 250, width: 405, height: 35)
                self.betWinStreakLabel.frame = CGRect(x: 5, y: 285, width: 405, height: 35)
                self.bestTimeLabel.frame = CGRect(x: 5, y: 320, width: 405, height: 35)
                self.averageTimeLabel.frame = CGRect(x: 5, y: 355, width: 405, height: 35)
                
                self.gamesPlayedLabelText.frame = CGRect(x: 310, y: 180, width: 80, height: 30)
                self.gamesCompletedLabelText.frame = CGRect(x: 310, y: 215, width: 80, height: 30)
                self.winRateLabelText.frame = CGRect(x: 310, y: 250, width: 80, height: 30)
                self.bestWinStreakLabelText.frame = CGRect(x: 310, y: 285, width: 80, height: 30)
                self.bestTimeLabelText.frame = CGRect(x: 310, y: 320, width: 80, height: 30)
                self.averageTimeLabelText.frame = CGRect(x: 310, y: 355, width: 80, height: 30)
                
                self.resetButtonOutlet.frame = CGRect(x: 107, y: 420, width: 200, height: 30)
                
            }
            

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


