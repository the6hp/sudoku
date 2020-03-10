import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes


class MainViewController: UIViewController {
    
    
    
    

    @IBOutlet weak var resumeTimeLevel: UILabel!
    
    @IBOutlet weak var labelSettings: UILabel!
    @IBOutlet weak var imageSettings: UIImageView!
    
    @IBOutlet weak var labelStatistics: UILabel!
    @IBOutlet weak var imageStatistics: UIImageView!
    
    @IBOutlet weak var labelGame: UILabel!
    @IBOutlet weak var imageGame: UIImageView!
    
    @IBOutlet weak var labelResumeGame: UILabel!
    @IBOutlet weak var imageResumeGame: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        sizeElement()
        buttonMain()
        //Убрать нижную границу у нав бара
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //Убираем текст кнопки "Назад"
        self.navigationItem.backBarButtonItem?.title = ""
                
        //Красим заголовки навбара в черный
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        let MSAppCenter_Key = Bundle.init(for: AppDelegate.self).infoDictionary?["MSAppCenter_Key"] as! String
        MSAppCenter.start(MSAppCenter_Key, withServices:[
          MSCrashes.self
        ])

    }
    
    let softUIViewResumeGame = SoftUIView(frame: .init(x: 50, y: 440, width: 275, height: 60))
    let softUIViewGame = SoftUIView(frame: .init(x: 50, y: 520, width: 275, height: 60))
    let softUIViewStatistics = SoftUIView(frame: .init(x: 50, y: 600, width: 275, height: 60))
    let softUIViewSettings = SoftUIView(frame: .init(x: 50, y: 680, width: 275, height: 60))
    
    func buttonMain() {
        
        var levelGameLabel: String = ""
        var timeGameLabel: String = ""
        
        if variables.levelGame == 0 {
            levelGameLabel = NSLocalizedString("easy", comment: "")
        } else if variables.levelGame == 1 {
            levelGameLabel = NSLocalizedString("medium", comment: "")
        } else if variables.levelGame == 2 {
            levelGameLabel = NSLocalizedString("hard", comment: "")
        } else if variables.levelGame == 3 {
            levelGameLabel = NSLocalizedString("expert", comment: "")
        } else if variables.levelGame == 4 {
            levelGameLabel = NSLocalizedString("custom game", comment: "")
        }
        
        if variables.countSec < 10 && variables.countMin < 10 {
            timeGameLabel = "0\(variables.countMin):0\(variables.countSec)"
        } else if variables.countSec > 10 && variables.countMin < 10 {
            timeGameLabel = "0\(variables.countMin):\(variables.countSec)"
        } else if variables.countSec < 10 && variables.countMin > 10 {
            timeGameLabel = "\(variables.countMin):0\(variables.countSec)"
        } else if variables.countSec > 10 && variables.countMin > 10 {
            timeGameLabel = "\(variables.countMin):\(variables.countSec)"
        }
        
        
        resumeTimeLevel.text = "\(levelGameLabel) \(timeGameLabel)"
        
        labelResumeGame.text =  NSLocalizedString("continue", comment: "")
        labelResumeGame.font = labelSettings.font.withSize(30)
        
        labelSettings.text = NSLocalizedString("settings", comment: "")
        labelSettings.font = labelSettings.font.withSize(30)
        
        labelStatistics.text = NSLocalizedString("statistics", comment: "")
        labelStatistics.font = labelSettings.font.withSize(30)

        labelGame.text = NSLocalizedString("game", comment: "")
        labelGame.font = labelSettings.font.withSize(30)
        

        
        self.view.addSubview(softUIViewResumeGame)
        self.view.addSubview(softUIViewGame)
        self.view.addSubview(softUIViewStatistics)
        self.view.addSubview(softUIViewSettings)
        
        self.view.bringSubviewToFront(labelResumeGame)
        self.view.bringSubviewToFront(resumeTimeLevel)
        self.view.bringSubviewToFront(imageResumeGame)
        
        self.view.bringSubviewToFront(labelSettings)
        self.view.bringSubviewToFront(imageSettings)
        
        self.view.bringSubviewToFront(labelStatistics)
        self.view.bringSubviewToFront(imageStatistics)
        
        self.view.bringSubviewToFront(labelGame)
        self.view.bringSubviewToFront(imageGame)
        
        softUIViewSettings.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        softUIViewStatistics.addTarget(self, action: #selector(openStatistics), for: .touchUpInside)
        softUIViewGame.addTarget(self, action: #selector(openGame), for: .touchUpInside)
        softUIViewResumeGame.addTarget(self, action: #selector(continueGame), for: .touchUpInside)

        
        if variables.savedGame == true {
            softUIViewResumeGame.isHidden = false
            resumeTimeLevel.isHidden = false
            labelResumeGame.isHidden = false
            imageResumeGame.isHidden = false
        } else {
            softUIViewResumeGame.isHidden = true
            resumeTimeLevel.isHidden = true
            labelResumeGame.isHidden = true
            imageResumeGame.isHidden = true
        }
        
    }
    
    @objc func continueGame () {
        let newController = self.storyboard!.instantiateViewController(withIdentifier: "mainGameView")
        self.navigationController!.pushViewController(newController, animated : true)
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        MSAnalytics.trackEvent("Главная: Продолжить")
    }
    
    @objc func openGame () {
        let newController = self.storyboard!.instantiateViewController(withIdentifier: "gameView")
        self.navigationController!.pushViewController(newController, animated : true)
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        //Ананлитика
        MSAnalytics.trackEvent("Главная: Игра")
    }
    

    @objc func openStatistics () {
        let newController = self.storyboard!.instantiateViewController(withIdentifier: "statisticsView")
        self.navigationController!.pushViewController(newController, animated : true)
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        //Ананлитика
        MSAnalytics.trackEvent("Главная: Статистика")
    }
    
    @objc func openSettings () {
        let newController = self.storyboard!.instantiateViewController(withIdentifier: "settingsView")
        self.navigationController!.pushViewController(newController, animated : true)
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        //Ананлитика
        MSAnalytics.trackEvent("Главная: Настройки")
    }

    
    @IBOutlet weak var mainPic: UIImageView!
    
    
    func sizeElement () {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        switch screenWidth {
        case 375:
            if screenHeight == 812 {
                self.mainPic.frame = CGRect(x: 87, y: 140, width: 200, height: 200)
                
                self.labelSettings.frame = CGRect(x: 130, y: 680, width: 200, height: 60)
                self.imageSettings.frame = CGRect(x: 70, y: 690, width: 40, height: 40)
                
                self.labelStatistics.frame = CGRect(x: 130, y: 600, width: 200, height: 60)
                self.imageStatistics.frame = CGRect(x: 70, y: 610, width: 40, height: 40)

                self.labelGame.frame = CGRect(x: 170, y: 520, width: 200, height: 60)
                self.imageGame.frame = CGRect(x: 70, y: 530, width: 40, height: 40)
                
                self.labelResumeGame.frame = CGRect(x: 130, y: 440, width: 200, height: 40)
                self.resumeTimeLevel.frame = CGRect(x: 160, y: 480, width: 200, height: 15)
                self.imageResumeGame.frame = CGRect(x: 70, y: 450, width: 40, height: 40)

            } else if screenHeight == 667 {
                self.mainPic.frame = CGRect(x: 87, y: 90, width: 200, height: 200)
                
                self.labelSettings.frame = CGRect(x: 130, y: 585, width: 200, height: 60)
                self.imageSettings.frame = CGRect(x: 70, y: 595, width: 40, height: 40)
                
                self.labelStatistics.frame = CGRect(x: 130, y: 505, width: 200, height: 60)
                self.imageStatistics.frame = CGRect(x: 70, y: 515, width: 40, height: 40)

                self.labelGame.frame = CGRect(x: 170, y: 425, width: 200, height: 60)
                self.imageGame.frame = CGRect(x: 70, y: 435, width: 40, height: 40)
                
                self.labelResumeGame.frame = CGRect(x: 130, y: 345, width: 200, height: 40)
                self.resumeTimeLevel.frame = CGRect(x: 160, y: 385, width: 200, height: 15)
                self.imageResumeGame.frame = CGRect(x: 70, y: 355, width: 40, height: 40)
                
                self.softUIViewResumeGame.frame = CGRect(x: 50, y: 345, width: 275, height: 60)
                self.softUIViewGame.frame = CGRect(x: 50, y: 425, width: 275, height: 60)
                self.softUIViewStatistics.frame = CGRect(x: 50, y: 505, width: 275, height: 60)
                self.softUIViewSettings.frame = CGRect(x: 50, y: 585, width: 275, height: 60)
                
            }
        case 320:
            self.mainPic.frame = CGRect(x: 85, y: 60, width: 150, height: 150)
                        
            self.softUIViewResumeGame.frame = CGRect(x: 23, y: 240, width: 274, height: 60)
            self.softUIViewGame.frame = CGRect(x: 23, y: 320, width: 274, height: 60)
            self.softUIViewStatistics.frame = CGRect(x: 23, y: 400, width: 274, height: 60)
            self.softUIViewSettings.frame = CGRect(x: 23, y: 480, width: 274, height: 60)
            
            self.labelSettings.frame = CGRect(x: 113, y: 480, width: 200, height: 60)
            self.imageSettings.frame = CGRect(x: 43, y: 490, width: 40, height: 40)
            
            self.labelStatistics.frame = CGRect(x: 113, y: 400, width: 200, height: 60)
            self.imageStatistics.frame = CGRect(x: 43, y: 410, width: 40, height: 40)

            self.labelGame.frame = CGRect(x: 133, y: 320, width: 200, height: 60)
            self.imageGame.frame = CGRect(x: 43, y: 330, width: 40, height: 40)
            
            self.labelResumeGame.frame = CGRect(x: 108, y: 240, width: 200, height: 40)
            self.resumeTimeLevel.frame = CGRect(x: 133, y: 280, width: 200, height: 15)
            self.imageResumeGame.frame = CGRect(x: 43, y: 250, width: 40, height: 40)
            
        case 414:
            if screenHeight == 736 {
                self.mainPic.frame = CGRect(x: 107, y: 100, width: 200, height: 200)
                self.resumeTimeLevel.frame = CGRect(x: 132, y: 467, width: 150, height: 40)
                
                self.softUIViewResumeGame.frame = CGRect(x: 70, y: 360, width: 274, height: 60)
                self.softUIViewGame.frame = CGRect(x: 70, y: 440, width: 274, height: 60)
                self.softUIViewStatistics.frame = CGRect(x: 70, y: 520, width: 274, height: 60)
                self.softUIViewSettings.frame = CGRect(x: 70, y: 600, width: 274, height: 60)
                
                self.labelSettings.frame = CGRect(x: 160, y: 600, width: 200, height: 60)
                self.imageSettings.frame = CGRect(x: 90, y: 610, width: 40, height: 40)
                
                self.labelStatistics.frame = CGRect(x: 160, y: 520, width: 200, height: 60)
                self.imageStatistics.frame = CGRect(x: 90, y: 530, width: 40, height: 40)

                self.labelGame.frame = CGRect(x: 190, y: 440, width: 200, height: 60)
                self.imageGame.frame = CGRect(x: 90, y: 450, width: 40, height: 40)
                
                self.labelResumeGame.frame = CGRect(x: 155, y: 360, width: 200, height: 40)
                self.resumeTimeLevel.frame = CGRect(x: 180, y: 400, width: 200, height: 15)
                self.imageResumeGame.frame = CGRect(x: 90, y: 370, width: 40, height: 40)
                
            } else {
                self.resumeTimeLevel.frame = CGRect(x: 132, y: 595, width: 150, height: 40)
                
                self.softUIViewResumeGame.frame = CGRect(x: 70, y: 520, width: 274, height: 60)
                self.softUIViewGame.frame = CGRect(x: 70, y: 600, width: 274, height: 60)
                self.softUIViewStatistics.frame = CGRect(x: 70, y: 680, width: 274, height: 60)
                self.softUIViewSettings.frame = CGRect(x: 70, y: 760, width: 274, height: 60)
                
                self.labelSettings.frame = CGRect(x: 160, y: 760, width: 200, height: 60)
                self.imageSettings.frame = CGRect(x: 90, y: 770, width: 40, height: 40)
                
                self.labelStatistics.frame = CGRect(x: 160, y: 680, width: 200, height: 60)
                self.imageStatistics.frame = CGRect(x: 90, y: 690, width: 40, height: 40)

                self.labelGame.frame = CGRect(x: 190, y: 600, width: 200, height: 60)
                self.imageGame.frame = CGRect(x: 90, y: 610, width: 40, height: 40)
                
                self.labelResumeGame.frame = CGRect(x: 155, y: 520, width: 200, height: 40)
                self.resumeTimeLevel.frame = CGRect(x: 180, y: 560, width: 200, height: 15)
                self.imageResumeGame.frame = CGRect(x: 90, y: 530, width: 40, height: 40)
                
            }
        default:
            break
        }

    }
    
}

