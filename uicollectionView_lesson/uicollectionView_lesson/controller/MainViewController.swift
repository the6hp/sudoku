import UIKit

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
    }
    
    func buttonMain() {
        mainViewGameButton.backgroundColor = .clear
        mainViewGameButton.layer.cornerRadius = 25
        mainViewGameButton.layer.borderWidth = 0.25
        mainViewGameButton.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        mainviewStatisticButton.backgroundColor = .clear
        mainviewStatisticButton.layer.cornerRadius = 25
        mainviewStatisticButton.layer.borderWidth = 0.25
        mainviewStatisticButton.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        mainViewSettingsButton.backgroundColor = .clear
        mainViewSettingsButton.layer.cornerRadius = 25
        mainViewSettingsButton.layer.borderWidth = 0.25
        mainViewSettingsButton.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        
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
        
        
        
        
        
        
        mainViewResumeGameButton.backgroundColor = #colorLiteral(red: 0.4078431373, green: 0.5568627451, blue: 0.8901960784, alpha: 1)
        mainViewResumeGameButton.layer.cornerRadius = 25
        mainViewResumeGameButton.layer.borderWidth = 0
        mainViewResumeGameButton.layer.borderColor = #colorLiteral(red: 0.4078431373, green: 0.5568627451, blue: 0.8901960784, alpha: 1)
        mainViewResumeGameButton.titleLabel?.font = UIFont(name: "", size: 12)
        mainViewResumeGameButton.setTitle("Продолжить\n", for: .normal)
        resumeTimeLevel.text = "\(levelGameLabel) \(timeGameLabel)"
    }

    @IBAction func continueGameButton(_ sender: Any) {
        fill_array_all()
    }
    

    
    @IBOutlet weak var mainPic: UIImageView!
    
    
    func sizeElement () {
        let screenWidth = UIScreen.main.bounds.width
        switch screenWidth {
        case 375:
            self.mainPic.frame = CGRect(x: 87, y: 140, width: 200, height: 200)
        case 320:
            self.mainPic.frame = CGRect(x: 85, y: 70, width: 150, height: 150)
            self.resumeTimeLevel.frame = CGRect(x: 85, y: 300, width: 150, height: 40)
        case 414:
            self.resumeTimeLevel.frame = CGRect(x: 132, y: 595, width: 150, height: 40)
        default:
            break
        }
        
        
        
        
    }

    
    
    
}
