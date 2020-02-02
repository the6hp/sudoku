import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes


class MainViewController: UIViewController {

    
    
    @IBOutlet weak var mainViewGameButton: UIButton!
    @IBOutlet weak var mainviewStatisticButton: UIButton!
    @IBOutlet weak var mainViewSettingsButton: UIButton!
    @IBOutlet weak var mainViewResumeGameButton: UIButton!
    @IBOutlet weak var resumeTimeLevel: UILabel!
    
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
        
        MSAppCenter.start("e5cf9bb1-f536-43e6-b099-0c2dfea36306", withServices:[
          MSCrashes.self
        ])

    }
    
    func buttonMain() {
        mainViewGameButton.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 0.7479398545)
        mainViewGameButton.layer.cornerRadius = 25
        mainViewGameButton.layer.borderWidth = 0
        mainViewGameButton.layer.borderColor = #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1)
            
        mainviewStatisticButton.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 0.7479398545)
        mainviewStatisticButton.layer.cornerRadius = 25
        mainviewStatisticButton.layer.borderWidth = 0
        mainviewStatisticButton.layer.borderColor = #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1)
        
        mainViewSettingsButton.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        mainViewSettingsButton.layer.cornerRadius = 25
        mainViewSettingsButton.layer.borderWidth = 0
        mainViewSettingsButton.layer.borderColor = #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1)
        
        
        if variables.savedGame == true {
            mainViewResumeGameButton.isHidden = false
            resumeTimeLevel.isHidden = false
        } else {
            mainViewResumeGameButton.isHidden = true
            resumeTimeLevel.isHidden = true
        }
        
        var levelGameLabel: String = ""
        var timeGameLabel: String = ""
        
        if variables.levelGame == 0 {
            levelGameLabel = "Легкий"
        } else if variables.levelGame == 1 {
            levelGameLabel = "Средний"
        } else if variables.levelGame == 2 {
            levelGameLabel = "Сложный"
        } else if variables.levelGame == 3 {
            levelGameLabel = "Эксперт"
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
        
        
        mainViewResumeGameButton.backgroundColor = #colorLiteral(red: 0.3882352941, green: 0.6470588235, blue: 1, alpha: 1)
        mainViewResumeGameButton.layer.cornerRadius = 25
        mainViewResumeGameButton.layer.borderWidth = 0.25
        mainViewResumeGameButton.layer.borderColor = #colorLiteral(red: 0.4078431373, green: 0.5568627451, blue: 0.8901960784, alpha: 1)
        mainViewResumeGameButton.titleLabel?.font = UIFont(name: "", size: 12)
        mainViewResumeGameButton.setTitle("Продолжить\n", for: .normal)
        resumeTimeLevel.text = "\(levelGameLabel) \(timeGameLabel)"
    }

    @IBAction func continueGameButton(_ sender: Any) {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        MSAnalytics.trackEvent("Главная: Продолжить")
    }
    
    @IBAction func gameButton(_ sender: Any) {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        MSAnalytics.trackEvent("Главная: Игра")
    }
    
    
    @IBAction func statisticsButtom(_ sender: Any) {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        MSAnalytics.trackEvent("Главная: Сиатистика")

    }
    
    @IBAction func settingsButton(_ sender: Any) {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        MSAnalytics.trackEvent("Главная: Настройки")

    }
    
    
    
    @IBOutlet weak var mainPic: UIImageView!
    
    
    func sizeElement () {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        print("Ширина: ",  screenWidth,"Высота: ",  screenHeight)
        switch screenWidth {
        case 375:
            if screenHeight == 812 {
                self.mainPic.frame = CGRect(x: 87, y: 140, width: 200, height: 200)
            } else if screenHeight == 667 {
                self.mainPic.frame = CGRect(x: 87, y: 90, width: 200, height: 200)
                self.resumeTimeLevel.frame = CGRect(x: 110, y: 400, width: 155, height: 40)
            }
        case 320:
            self.mainPic.frame = CGRect(x: 85, y: 70, width: 150, height: 150)
            self.resumeTimeLevel.frame = CGRect(x: 85, y: 300, width: 150, height: 40)
        case 414:
            if screenHeight == 736 {
                self.mainPic.frame = CGRect(x: 107, y: 100, width: 200, height: 200)
                self.resumeTimeLevel.frame = CGRect(x: 132, y: 467, width: 150, height: 40)
            } else {
                self.resumeTimeLevel.frame = CGRect(x: 132, y: 595, width: 150, height: 40)
            }
        default:
            break
        }
        
        
        
        
    }

    
    
    
}

