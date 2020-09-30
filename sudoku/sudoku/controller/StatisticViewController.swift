import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

class StatisticViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sizeElementStatistics()
  //      changeBorder()
        startStatistics()
        
        self.navigationItem.title?  = NSLocalizedString("statistics", comment: "")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22.0)]

        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let MSAppCenter_Key = Bundle.init(for: AppDelegate.self).infoDictionary?["MSAppCenter_Key"] as! String
        MSAppCenter.start(MSAppCenter_Key, withServices:[
          MSCrashes.self
        ])
    }
    
    @IBOutlet weak var gamesPlayedLabel: UILabel!
    @IBOutlet weak var gamesCompletedLabel: UILabel!
    @IBOutlet weak var winRateLabel: UILabel!
    @IBOutlet weak var betWinStreakLabel: UILabel!
    @IBOutlet weak var bestTimeLabel: UILabel!
    @IBOutlet weak var averageTimeLabel: UILabel!
    
    @IBOutlet weak var gamesTitleLabel: UILabel!
    @IBOutlet weak var timeTitleLabel: UILabel!
    
    @IBOutlet weak var gamesPlayedLabelText: UILabel!
    @IBOutlet weak var gamesCompletedLabelText: UILabel!
    @IBOutlet weak var winRateLabelText: UILabel!
    @IBOutlet weak var bestWinStreakLabelText: UILabel!
    @IBOutlet weak var bestTimeLabelText: UILabel!
    @IBOutlet weak var averageTimeLabelText: UILabel!
    
    @IBOutlet weak var gamesPlayedIcon: UIImageView!
    @IBOutlet weak var gamesCompletedIcon: UIImageView!
    @IBOutlet weak var winRateIcon: UIImageView!
    @IBOutlet weak var winStreakIcon: UIImageView!
    @IBOutlet weak var bestTimeIcon: UIImageView!
    @IBOutlet weak var averageTimeIcon: UIImageView!
    
    
    
    func startStatistics () {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        
        segmentedControl.setTitle(NSLocalizedString("segment_easy_level", comment: ""), forSegmentAt: 0)
        segmentedControl.setTitle(NSLocalizedString("segment_medium_level", comment: ""), forSegmentAt: 1)
        segmentedControl.setTitle(NSLocalizedString("segment_hard_level", comment: ""), forSegmentAt: 2)
        segmentedControl.setTitle(NSLocalizedString("segment_expert_level", comment: ""), forSegmentAt: 3)

        gamesTitleLabel.text = NSLocalizedString("gamesTitleLabel", comment: "")
        timeTitleLabel.text = NSLocalizedString("timeTitleLabel", comment: "")
        
        gamesPlayedLabel.text = NSLocalizedString("games_played", comment: "")
        gamesCompletedLabel.text = NSLocalizedString("games_completed", comment: "")
        winRateLabel.text = NSLocalizedString("win_rate", comment: "")
        betWinStreakLabel.text = NSLocalizedString("best_win_streak", comment: "")
        bestTimeLabel.text = NSLocalizedString("best_time", comment: "")
        averageTimeLabel.text = NSLocalizedString("average_time", comment: "")
        resetButtonOutlet.setTitle(NSLocalizedString("reset_statistics", comment: ""), for: .normal)
        
        
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
                
                self.gamesTitleLabel.frame = CGRect(x: 0, y: 130, width: 375, height: 35)
                self.timeTitleLabel.frame = CGRect(x: 0, y: 320, width: 375, height: 35)
                
                self.gamesPlayedIcon.frame = CGRect(x: 6, y: 177, width: 22, height: 22)
                self.gamesCompletedIcon.frame = CGRect(x: 5, y: 210, width: 25, height: 25)
                self.winRateIcon.frame = CGRect(x: 2, y: 243, width: 32, height: 32)
                self.winStreakIcon.frame = CGRect(x: 5, y: 280, width: 25, height: 25)
                self.bestTimeIcon.frame = CGRect(x: 3, y: 362, width: 30, height: 30)
                self.averageTimeIcon.frame = CGRect(x: 6, y: 400, width: 22, height: 22)
                
                self.gamesPlayedLabel.frame = CGRect(x: 43, y: 170, width: 365, height: 35)
                self.gamesCompletedLabel.frame = CGRect(x: 43, y: 205, width: 365, height: 35)
                self.winRateLabel.frame = CGRect(x: 43, y: 240, width: 365, height: 35)
                self.betWinStreakLabel.frame = CGRect(x: 43, y: 275, width: 365, height: 35)
                self.bestTimeLabel.frame = CGRect(x: 43, y: 360, width: 365, height: 35)
                self.averageTimeLabel.frame = CGRect(x: 43, y: 395, width: 365, height: 35)
                
                self.gamesPlayedLabelText.frame = CGRect(x: 285, y: 170, width: 80, height: 30)
                self.gamesCompletedLabelText.frame = CGRect(x: 285, y: 205, width: 80, height: 30)
                self.winRateLabelText.frame = CGRect(x: 285, y: 240, width: 80, height: 30)
                self.bestWinStreakLabelText.frame = CGRect(x: 285, y: 275, width: 80, height: 30)
                self.bestTimeLabelText.frame = CGRect(x: 285, y: 360, width: 80, height: 30)
                self.averageTimeLabelText.frame = CGRect(x: 285, y: 395, width: 80, height: 30)
                
                self.resetButtonOutlet.frame = CGRect(x: 87, y: 620, width: 200, height: 30)
                
            } else if screenHeight == 812 {
                
                self.segmentedControl.frame = CGRect(x: 20, y: 100, width: 335, height: 32)
                
                self.gamesTitleLabel.frame = CGRect(x: 0, y: 150, width: 375, height: 35)
                self.timeTitleLabel.frame = CGRect(x: 0, y: 385, width: 375, height: 35)
                
                self.gamesPlayedLabel.frame = CGRect(x: 55, y: 195, width: 365, height: 35)
                self.gamesCompletedLabel.frame = CGRect(x: 55, y: 240, width: 365, height: 35)
                self.winRateLabel.frame = CGRect(x: 55, y: 285, width: 365, height: 35)
                self.betWinStreakLabel.frame = CGRect(x: 55, y: 330, width: 365, height: 35)
                self.bestTimeLabel.frame = CGRect(x: 55, y: 435, width: 365, height: 35)
                self.averageTimeLabel.frame = CGRect(x: 55, y: 490, width: 365, height: 35)
                
                self.gamesPlayedLabelText.frame = CGRect(x: 285, y: 195, width: 80, height: 30)
                self.gamesCompletedLabelText.frame = CGRect(x: 285, y: 240, width: 80, height: 30)
                self.winRateLabelText.frame = CGRect(x: 285, y: 285, width: 80, height: 30)
                self.bestWinStreakLabelText.frame = CGRect(x: 285, y: 330, width: 80, height: 30)
                self.bestTimeLabelText.frame = CGRect(x: 285, y: 435, width: 80, height: 30)
                self.averageTimeLabelText.frame = CGRect(x: 285, y: 490, width: 80, height: 30)
                
                
                self.gamesPlayedIcon.frame = CGRect(x: 10, y: 198, width: 25, height: 25)
                self.gamesCompletedIcon.frame = CGRect(x: 10, y: 243, width: 30, height: 30)
                self.winRateIcon.frame = CGRect(x: 5, y: 282, width: 40, height: 40)
                self.winStreakIcon.frame = CGRect(x: 10, y: 330, width: 30, height: 30)
                self.bestTimeIcon.frame = CGRect(x: 5, y: 435, width: 40, height: 40)
                self.averageTimeIcon.frame = CGRect(x: 10, y: 490, width: 30, height: 30)
                
                
                self.resetButtonOutlet.frame = CGRect(x: 87, y: 750, width: 200, height: 30)
                
            } else {
                self.segmentedControl.frame = CGRect(x: 20, y: 120, width: 335, height: 32)

            }
        case 320:
            self.segmentedControl.frame = CGRect(x: 5, y: 80, width: 310, height: 33)
            
            self.gamesTitleLabel.frame = CGRect(x: 0, y: 130, width: 320, height: 35)
            self.timeTitleLabel.frame = CGRect(x: 0, y: 315, width: 320, height: 35)
            
            self.gamesPlayedIcon.frame = CGRect(x: 6, y: 178, width: 22, height: 22)
            self.gamesCompletedIcon.frame = CGRect(x: 5, y: 210, width: 25, height: 25)
            self.winRateIcon.frame = CGRect(x: 2, y: 242, width: 32, height: 32)
            self.winStreakIcon.frame = CGRect(x: 5, y: 280, width: 25, height: 25)
            self.bestTimeIcon.frame = CGRect(x: 3, y: 357, width: 30, height: 30)
            self.averageTimeIcon.frame = CGRect(x: 6, y: 397, width: 22, height: 22)
            
            self.gamesPlayedLabel.frame = CGRect(x: 45, y: 170, width: 310, height: 35)
            self.gamesCompletedLabel.frame = CGRect(x: 45, y: 205, width: 310, height: 35)
            self.winRateLabel.frame = CGRect(x: 45, y: 240, width: 310, height: 35)
            self.betWinStreakLabel.frame = CGRect(x: 45, y: 275, width: 310, height: 35)
            self.bestTimeLabel.frame = CGRect(x: 45, y: 355, width: 310, height: 35)
            self.averageTimeLabel.frame = CGRect(x: 45, y: 390, width: 310, height: 35)
            
            self.gamesPlayedLabelText.frame = CGRect(x: 230, y: 170, width: 80, height: 30)
            self.gamesCompletedLabelText.frame = CGRect(x: 230, y: 205, width: 80, height: 30)
            self.winRateLabelText.frame = CGRect(x: 230, y: 240, width: 80, height: 30)
            self.bestWinStreakLabelText.frame = CGRect(x: 230, y: 275, width: 80, height: 30)
            self.bestTimeLabelText.frame = CGRect(x: 230, y: 355, width: 80, height: 30)
            self.averageTimeLabelText.frame = CGRect(x: 230, y: 390, width: 80, height: 30)
            
            self.resetButtonOutlet.frame = CGRect(x: 60, y: 510, width: 200, height: 30)
        case 414:
            if screenHeight == 736 {
                
                self.segmentedControl.frame = CGRect(x: 50, y: 80, width: 314, height: 33)
                
                self.gamesTitleLabel.frame = CGRect(x: 0, y: 150, width: 375, height: 35)
                self.timeTitleLabel.frame = CGRect(x: 0, y: 340, width: 375, height: 35)
                
                self.gamesPlayedIcon.frame = CGRect(x: 6, y: 197, width: 22, height: 22)
                self.gamesCompletedIcon.frame = CGRect(x: 5, y: 230, width: 25, height: 25)
                self.winRateIcon.frame = CGRect(x: 2, y: 263, width: 32, height: 32)
                self.winStreakIcon.frame = CGRect(x: 5, y: 300, width: 25, height: 25)
                self.bestTimeIcon.frame = CGRect(x: 3, y: 382, width: 30, height: 30)
                self.averageTimeIcon.frame = CGRect(x: 6, y: 420, width: 22, height: 22)
                
                self.gamesPlayedLabel.frame = CGRect(x: 48, y: 190, width: 365, height: 35)
                self.gamesCompletedLabel.frame = CGRect(x: 48, y: 225, width: 365, height: 35)
                self.winRateLabel.frame = CGRect(x: 48, y: 260, width: 365, height: 35)
                self.betWinStreakLabel.frame = CGRect(x: 48, y: 295, width: 365, height: 35)
                self.bestTimeLabel.frame = CGRect(x: 48, y: 380, width: 365, height: 35)
                self.averageTimeLabel.frame = CGRect(x: 48, y: 415, width: 365, height: 35)
                
                self.gamesPlayedLabelText.frame = CGRect(x: 315, y: 190, width: 80, height: 30)
                self.gamesCompletedLabelText.frame = CGRect(x: 315, y: 225, width: 80, height: 30)
                self.winRateLabelText.frame = CGRect(x: 315, y: 260, width: 80, height: 30)
                self.bestWinStreakLabelText.frame = CGRect(x: 315, y: 295, width: 80, height: 30)
                self.bestTimeLabelText.frame = CGRect(x: 315, y: 380, width: 80, height: 30)
                self.averageTimeLabelText.frame = CGRect(x: 315, y: 405, width: 80, height: 30)
                
                self.resetButtonOutlet.frame = CGRect(x: 107, y: 660, width: 200, height: 30)
                
            } else if screenHeight == 896 {
                
                self.segmentedControl.frame = CGRect(x: 50, y: 100, width: 314, height: 33)
                
                self.gamesTitleLabel.frame = CGRect(x: 0, y: 170, width: 375, height: 35)
                self.timeTitleLabel.frame = CGRect(x: 0, y: 360, width: 375, height: 35)
                
                self.gamesPlayedIcon.frame = CGRect(x: 6, y: 217, width: 22, height: 22)
                self.gamesCompletedIcon.frame = CGRect(x: 5, y: 250, width: 25, height: 25)
                self.winRateIcon.frame = CGRect(x: 2, y: 283, width: 32, height: 32)
                self.winStreakIcon.frame = CGRect(x: 5, y: 320, width: 25, height: 25)
                self.bestTimeIcon.frame = CGRect(x: 3, y: 402, width: 30, height: 30)
                self.averageTimeIcon.frame = CGRect(x: 6, y: 440, width: 22, height: 22)
                
                self.gamesPlayedLabel.frame = CGRect(x: 48, y: 210, width: 365, height: 35)
                self.gamesCompletedLabel.frame = CGRect(x: 48, y: 245, width: 365, height: 35)
                self.winRateLabel.frame = CGRect(x: 48, y: 280, width: 365, height: 35)
                self.betWinStreakLabel.frame = CGRect(x: 48, y: 315, width: 365, height: 35)
                self.bestTimeLabel.frame = CGRect(x: 48, y: 400, width: 365, height: 35)
                self.averageTimeLabel.frame = CGRect(x: 48, y: 435, width: 365, height: 35)
                
                self.gamesPlayedLabelText.frame = CGRect(x: 315, y: 210, width: 80, height: 30)
                self.gamesCompletedLabelText.frame = CGRect(x: 315, y: 245, width: 80, height: 30)
                self.winRateLabelText.frame = CGRect(x: 315, y: 280, width: 80, height: 30)
                self.bestWinStreakLabelText.frame = CGRect(x: 315, y: 315, width: 80, height: 30)
                self.bestTimeLabelText.frame = CGRect(x: 315, y: 400, width: 80, height: 30)
                self.averageTimeLabelText.frame = CGRect(x: 315, y: 425, width: 80, height: 30)
                
                self.resetButtonOutlet.frame = CGRect(x: 107, y: 820, width: 200, height: 30)
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


