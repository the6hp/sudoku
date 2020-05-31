import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import StoreKit

class PopUpViewController: UIViewController {

    
    @IBOutlet weak var MessageView: UIView!
    @IBOutlet weak var labelTitleEndGame: UILabel!
    @IBOutlet weak var closeButtonEndGamePopUp: UIButton!
    @IBOutlet weak var levelLabelEndGame: UILabel!
    @IBOutlet weak var timeLabelEndGame: UILabel!
    
    enum AppStoreReviewManager {
      static func requestReviewIfAppropriate() {
      }
    }
    
    override func viewDidLoad() {
                
        closeButtonEndGamePopUp.setTitle(NSLocalizedString("closeButtonTitle", comment: ""), for: .normal)
        
        super.viewDidLoad()
        sizeElementEndGamePopUp ()
        //Сгругление углов поп-апа
        MessageView.layer.cornerRadius = 24
        textLabel ()
        //прозрачность фона
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        moveIn()
        variables.countMin = 0
        variables.countSec = 0
        saveData()
        loadData()
        customBorder()
        
        let MSAppCenter_Key = Bundle.init(for: AppDelegate.self).infoDictionary?["MSAppCenter_Key"] as! String
        MSAppCenter.start(MSAppCenter_Key, withServices:[
          MSCrashes.self
        ])
                
    }
    
    var softUIViewMessage = SoftUIView(frame: .init(x: 75, y: 250, width: 225, height: 200))
    
    func customBorder() {
        self.view.addSubview(softUIViewMessage)
        self.view.sendSubviewToBack(softUIViewMessage)
    }
    
    
    
    @IBAction func popUpClose(_ sender: Any) {
        
        if store.countGame  == 2 {
            SKStoreReviewController.requestReview()
            MSAnalytics.trackEvent("Показано окно оценки приложения")
            store.countGame += 1
        } else {
            store.countGame += 1
        }
                
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        self.view.removeFromSuperview()
        
        variables.countMin = 0
        variables.countSec = 0
        saveData()
                
        openMainView()
        moveOut()
    }
    
    
    
    //Анимация появления
    func moveIn() {
         self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
         self.view.alpha = 0.0
         
         UIView.animate(withDuration: 0.24) {
             self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
             self.view.alpha = 1.0
         }
     }
     
    //Анимация исчезновения
     func moveOut() {
         UIView.animate(withDuration: 0.24, animations: {
             self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
             self.view.alpha = 0.0
         }) { _ in
             self.view.removeFromSuperview()
         }
     }
    
    //Переход на главный экран после окончания игры
    func openMainView () {

        let newController = self.storyboard!.instantiateViewController(withIdentifier: "mainView")

        //the identifier above comes from storyboard
        self.navigationController!.pushViewController(newController, animated : true)
        
    }
    
    
    
    
    func textLabel () {
        
        if variables.countError > 2 {
            labelTitleEndGame.text = NSLocalizedString("pop_game_over", comment: "")
        } else {
            labelTitleEndGame.text = NSLocalizedString("pop_game_end", comment: "")
        }
        
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
            levelGameLabel = NSLocalizedString("pop_custom_level", comment: "")
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
        
        levelLabelEndGame.text = "\(NSLocalizedString("pop_level", comment: "")) \(levelGameLabel)"
        timeLabelEndGame.text = "\(NSLocalizedString("pop_time", comment: "")) \(timeGameLabel)"
        
        MSAnalytics.trackEvent("Время игры", withProperties: ["Время текущей игры" : timeGameLabel])
        
        
        //Сохраняем время для использования на экране выбора игры
        if variables.countError < 2 {
            if variables.selectedDifficulty == 0 {
                listArray.listEasyGame[variables.selectedLevel][0][1] = variables.countMin
                listArray.listEasyGame[variables.selectedLevel][0][2] = variables.countSec
            } else if variables.selectedDifficulty == 1 {
                listArray.listAverageGame[variables.selectedLevel][0][1] = variables.countMin
                listArray.listAverageGame[variables.selectedLevel][0][2] = variables.countSec
            } else if variables.selectedDifficulty == 2 {
                listArray.listHardGame[variables.selectedLevel][0][1] = variables.countMin
                listArray.listHardGame[variables.selectedLevel][0][2] = variables.countSec
            } else if variables.selectedDifficulty == 3 {
                listArray.listExpertGame[variables.selectedLevel][0][1] = variables.countMin
                listArray.listExpertGame[variables.selectedLevel][0][2] = variables.countSec
            }
        }
        
    }
    
    
    
    func sizeElementEndGamePopUp () {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        switch screenWidth {
        case 375:
            self.MessageView.frame = CGRect(x: 75, y: 250, width: 225, height: 200)
            self.labelTitleEndGame.frame = CGRect(x: 50, y: 20, width: 125, height: 30)
            self.levelLabelEndGame.frame = CGRect(x: 35, y: 70, width: 180, height: 30)
            self.timeLabelEndGame.frame = CGRect(x: 35, y: 100, width: 180, height: 30)
            self.closeButtonEndGamePopUp.frame = CGRect(x: 38, y: 150, width: 150, height: 30)
            
            self.softUIViewMessage = SoftUIView(frame: .init(x: 75, y: 250, width: 225, height: 200))
        case 320:
            self.MessageView.frame = CGRect(x: 50, y: 150, width: 220, height: 200)
            self.labelTitleEndGame.frame = CGRect(x: 50, y: 20, width: 125, height: 30)
            self.levelLabelEndGame.frame = CGRect(x: 35, y: 70, width: 180, height: 30)
            self.timeLabelEndGame.frame = CGRect(x: 35, y: 100, width: 180, height: 30)
            self.closeButtonEndGamePopUp.frame = CGRect(x: 38, y: 150, width: 150, height: 30)
            
            self.softUIViewMessage = SoftUIView(frame: .init(x: 50, y: 150, width: 220, height: 200))
        case 414:
            self.MessageView.frame = CGRect(x: 95, y: 230, width: 225, height: 200)
            self.labelTitleEndGame.frame = CGRect(x: 50, y: 20, width: 125, height: 30)
            self.levelLabelEndGame.frame = CGRect(x: 35, y: 70, width: 180, height: 30)
            self.timeLabelEndGame.frame = CGRect(x: 35, y: 100, width: 180, height: 30)
            self.closeButtonEndGamePopUp.frame = CGRect(x: 38, y: 150, width: 150, height: 30)
            
            self.softUIViewMessage = SoftUIView(frame: .init(x: 95, y: 230, width: 225, height: 200))
        default:
            break
        }
        
        
    }
    

}
