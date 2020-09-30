import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes


class MainViewController: UIViewController {

    @IBOutlet weak var resumeTimeLevel: UILabel!
    @IBOutlet weak var imageSettings: UIImageView!
    @IBOutlet weak var imageStatistics: UIImageView!
    @IBOutlet weak var labelGame: UILabel!
    @IBOutlet weak var imageGame: UIImageView!
    @IBOutlet weak var labelResumeGame: UILabel!
    @IBOutlet weak var imageResumeGame: UIImageView!
    @IBOutlet weak var labelFastGame: UILabel!
    @IBOutlet weak var imageFastGame: UIImageView!
    
    
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
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 1)
        
        let MSAppCenter_Key = Bundle.init(for: AppDelegate.self).infoDictionary?["MSAppCenter_Key"] as! String
        MSAppCenter.start(MSAppCenter_Key, withServices:[
          MSCrashes.self
        ])

    }
    
    let softUIViewResumeGame = SoftUIView(frame: .init(x: 50, y: 380, width: 275, height: 60))
    let softUIViewGame = SoftUIView(frame: .init(x: 50, y: 460, width: 275, height: 60))
    let softUIViewFastGame = SoftUIView(frame: .init(x: 50, y: 540, width: 275, height: 60))
    let softUIViewStatistics = SoftUIView(frame: .init(x: 205, y: 720, width: 55, height: 55))
    let softUIViewSettings = SoftUIView(frame: .init(x: 270, y: 720, width: 55, height: 55))
    
    
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
        labelResumeGame.font = labelResumeGame.font.withSize(30)
        
        labelGame.text = NSLocalizedString("game", comment: "")
        labelGame.font = labelGame.font.withSize(30)
        
        labelFastGame.text = NSLocalizedString("fastGame", comment: "")
        labelFastGame.font = labelGame.font.withSize(30)

        
        self.view.addSubview(softUIViewResumeGame)
        self.view.addSubview(softUIViewGame)
        self.view.addSubview(softUIViewStatistics)
        self.view.addSubview(softUIViewSettings)
        self.view.addSubview(softUIViewFastGame)
        
        self.view.bringSubviewToFront(labelResumeGame)
        self.view.bringSubviewToFront(resumeTimeLevel)
        self.view.bringSubviewToFront(imageResumeGame)
        self.view.bringSubviewToFront(imageSettings)
        self.view.bringSubviewToFront(imageStatistics)
        self.view.bringSubviewToFront(labelGame)
        self.view.bringSubviewToFront(imageGame)
        self.view.bringSubviewToFront(labelFastGame)
        self.view.bringSubviewToFront(imageFastGame)
        
        softUIViewSettings.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        softUIViewStatistics.addTarget(self, action: #selector(openStatistics), for: .touchUpInside)
        softUIViewGame.addTarget(self, action: #selector(openGame), for: .touchUpInside)
        softUIViewFastGame.addTarget(self, action: #selector(fastGame), for: .touchUpInside)
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
    
        @objc func fastGame() {
                //Таптик отклик
                let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
                impactFeedbackgenerator.prepare()
                impactFeedbackgenerator.impactOccurred()
                
                self.tabBarController?.tabBar.isHidden = true
            
                let itemCount = Int.random(in: 38..<66)  //раньше было var
    
                mainArray.testArray = mainArray.defaultArray
                random_level_all()
                mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 4, numCount: itemCount)
                fill_array_all()
                variables.savedGame = true
                statistics.statisticsEasyGamesPlayed += 1
                statistics_fill_all(level: 0)
                variables.countError = 0
                variables.levelGame = 4
                variables.countSec = 0
                variables.countMin = 0
                mainArray.oldCancelArray = [[]]
            
                saveData()
                
                MSAnalytics.trackEvent("Выбор сложности: Своя игра")
                
                let newController = self.storyboard!.instantiateViewController(withIdentifier: "mainGameView")
                self.navigationController!.pushViewController(newController, animated : true)
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
        print(screenWidth)
        print(screenHeight)
        
        switch screenWidth {
        case 375:
            if screenHeight == 812 {
                self.mainPic.frame = CGRect(x: 87, y: 120, width: 200, height: 200)
                
                self.imageSettings.frame = CGRect(x: 277, y: 727, width: 40, height: 40)
                
                self.imageStatistics.frame = CGRect(x: 212, y: 727, width: 40, height: 40)
                
                self.labelGame.frame = CGRect(x: 70, y: 460, width: 275, height: 60)
                self.imageGame.frame = CGRect(x: 70, y: 470, width: 40, height: 40)
                
                self.labelFastGame.frame = CGRect(x: 65, y: 540, width: 275, height: 60)
                self.imageFastGame.frame = CGRect(x: 65, y: 550, width: 40, height: 40)
                
                self.labelResumeGame.frame = CGRect(x: 130, y: 380, width: 200, height: 40)
                self.resumeTimeLevel.frame = CGRect(x: 160, y: 420, width: 200, height: 15)
                self.imageResumeGame.frame = CGRect(x: 70, y: 390, width: 40, height: 40)

            } else if screenHeight == 667 {
                self.mainPic.frame = CGRect(x: 87, y: 90, width: 200, height: 200)
                
                self.imageSettings.frame = CGRect(x: 317, y: 602, width: 40, height: 40)
                self.softUIViewSettings.frame = CGRect(x: 310, y: 595, width: 55, height: 55)
                
                self.imageStatistics.frame = CGRect(x: 252, y: 602, width: 40, height: 40)
                self.softUIViewStatistics.frame = CGRect(x: 245, y: 595, width: 55, height: 55)

                self.labelGame.frame = CGRect(x: 110, y: 425, width: 200, height: 60)
                self.imageGame.frame = CGRect(x: 70, y: 435, width: 40, height: 40)
                self.softUIViewGame.frame = CGRect(x: 50, y: 425, width: 275, height: 60)

                self.labelFastGame.frame = CGRect(x: 65, y: 505, width: 275, height: 60)
                self.imageFastGame.frame = CGRect(x: 65, y: 515, width: 40, height: 40)
                self.softUIViewFastGame.frame = CGRect(x: 50, y: 505, width: 275, height: 60)
                
                self.labelResumeGame.frame = CGRect(x: 130, y: 345, width: 200, height: 40)
                self.resumeTimeLevel.frame = CGRect(x: 160, y: 385, width: 200, height: 15)
                self.imageResumeGame.frame = CGRect(x: 70, y: 355, width: 40, height: 40)
                self.softUIViewResumeGame.frame = CGRect(x: 50, y: 345, width: 275, height: 60)
                
            }
        case 320:
            self.mainPic.frame = CGRect(x: 85, y: 60, width: 150, height: 150)
                        
            self.softUIViewResumeGame.frame = CGRect(x: 23, y: 240, width: 274, height: 60)
            self.softUIViewGame.frame = CGRect(x: 23, y: 320, width: 274, height: 60)
            self.labelGame.frame = CGRect(x: 83, y: 320, width: 200, height: 60)
            self.imageGame.frame = CGRect(x: 43, y: 330, width: 40, height: 40)
            
            self.labelFastGame.frame = CGRect(x: 83, y: 400, width: 200, height: 60)
            self.imageFastGame.frame = CGRect(x: 43, y: 410, width: 40, height: 40)
            self.softUIViewFastGame.frame = CGRect(x: 23, y: 400, width: 275, height: 60)
            
            self.softUIViewStatistics.frame = CGRect(x: 194, y: 483, width: 60, height: 60)
            self.imageStatistics.frame = CGRect(x: 200, y: 490, width: 40, height: 40)

            
            self.softUIViewSettings.frame = CGRect(x: 254, y: 483, width: 60, height: 60)
            self.imageSettings.frame = CGRect(x: 260, y: 490, width: 40, height: 40)
            
            
            self.labelResumeGame.frame = CGRect(x: 108, y: 240, width: 200, height: 40)
            self.resumeTimeLevel.frame = CGRect(x: 113, y: 280, width: 200, height: 15)
            self.imageResumeGame.frame = CGRect(x: 43, y: 250, width: 40, height: 40)
            
        case 414:
            if screenHeight == 736 {
                self.mainPic.frame = CGRect(x: 107, y: 100, width: 200, height: 200)

                self.imageSettings.frame = CGRect(x: 337, y: 652, width: 40, height: 40)
                self.softUIViewSettings.frame = CGRect(x: 330, y: 645, width: 55, height: 55)
                
                self.imageStatistics.frame = CGRect(x: 272, y: 654, width: 40, height: 40)
                self.softUIViewStatistics.frame = CGRect(x: 265, y: 645, width: 55, height: 55)

                self.labelGame.frame = CGRect(x: 130, y: 435, width: 200, height: 60)
                self.imageGame.frame = CGRect(x: 90, y: 445, width: 40, height: 40)
                self.softUIViewGame.frame = CGRect(x: 70, y: 435, width: 275, height: 60)

                self.labelFastGame.frame = CGRect(x: 85, y: 515, width: 275, height: 60)
                self.imageFastGame.frame = CGRect(x: 85, y: 525, width: 40, height: 40)
                self.softUIViewFastGame.frame = CGRect(x: 70, y: 515, width: 275, height: 60)
                
                self.labelResumeGame.frame = CGRect(x: 150, y: 355, width: 200, height: 40)
                self.resumeTimeLevel.frame = CGRect(x: 180, y: 395, width: 200, height: 15)
                self.imageResumeGame.frame = CGRect(x: 90, y: 355, width: 40, height: 40)
                self.softUIViewResumeGame.frame = CGRect(x: 70, y: 355, width: 275, height: 60)
                
            } else {
                self.imageSettings.frame = CGRect(x: 337, y: 812, width: 40, height: 40)
                self.softUIViewSettings.frame = CGRect(x: 330, y: 805, width: 55, height: 55)
                
                self.imageStatistics.frame = CGRect(x: 272, y: 812, width: 40, height: 40)
                self.softUIViewStatistics.frame = CGRect(x: 265, y: 805, width: 55, height: 55)

                self.labelGame.frame = CGRect(x: 130, y: 525, width: 200, height: 60)
                self.imageGame.frame = CGRect(x: 90, y: 535, width: 40, height: 40)
                self.softUIViewGame.frame = CGRect(x: 70, y: 525, width: 275, height: 60)

                self.labelFastGame.frame = CGRect(x: 85, y: 605, width: 275, height: 60)
                self.imageFastGame.frame = CGRect(x: 85, y: 615, width: 40, height: 40)
                self.softUIViewFastGame.frame = CGRect(x: 70, y: 605, width: 275, height: 60)
                
                self.labelResumeGame.frame = CGRect(x: 150, y: 445, width: 200, height: 40)
                self.resumeTimeLevel.frame = CGRect(x: 180, y: 485, width: 200, height: 15)
                self.imageResumeGame.frame = CGRect(x: 90, y: 455, width: 40, height: 40)
                self.softUIViewResumeGame.frame = CGRect(x: 70, y: 445, width: 275, height: 60)
                
            }
        default:
            break
        }

    }
    
}

