//Экран выбора сложности игры

import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

class GameViewController: UIViewController {
    
    @IBOutlet weak var labelEasyGame: UILabel!
    @IBOutlet weak var labelAverageGame: UILabel!
    @IBOutlet weak var labelHardGame: UILabel!
    @IBOutlet weak var labelExpertGame: UILabel!
    @IBOutlet weak var labelCustomGame: UILabel!
    @IBOutlet weak var labelCountCustomGame: UILabel!
    @IBOutlet weak var labelTitleLevel: UILabel!
    @IBOutlet weak var labelTitleCustomGame: UILabel!
    @IBOutlet weak var labelMinus: UILabel!
    @IBOutlet weak var labelPlus: UILabel!
    @IBOutlet weak var descriptionCustomGame: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sizeElement ()
        //Убрать нижную границу у нав бара
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //Убираем текст кнопки "Назад"
        self.navigationItem.backBarButtonItem?.title = ""
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        let MSAppCenter_Key = Bundle.init(for: AppDelegate.self).infoDictionary?["MSAppCenter_Key"] as! String
        MSAppCenter.start(MSAppCenter_Key, withServices:[
          MSCrashes.self
        ])
        
        self.navigationItem.title?  = NSLocalizedString("level", comment: "")
        
        loadData()
        buttonDesign()
    }
    
    @IBAction func performUnwindSegueOperation (_ sender: UIStoryboardSegue) {
        guard sender.source is GameViewController else { return }
    }
        
    @objc func plusCount() {
        if variables.customGameNumber >= 0 && variables.customGameNumber < 81 {
            variables.customGameNumber += 1
            labelCountCustomGame.text = "\(variables.customGameNumber)"
            saveData()
        }
    }
    
    @objc func minusCount() {
        if variables.customGameNumber > 1 && variables.customGameNumber <= 81 {
            variables.customGameNumber -= 1
            labelCountCustomGame.text = "\(variables.customGameNumber)"
            saveData()
        }
    }
    
    @objc func customGameButton() {
            //Таптик отклик
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
            
            self.tabBarController?.tabBar.isHidden = true
            mainArray.testArray = mainArray.defaultArray
            random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 4, numCount: variables.customGameNumber)
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
    
   @objc func easyGameButton() {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 0, numCount: 0)
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsEasyGamesPlayed += 1
        statistics_fill_all(level: 0)
        variables.countError = 0
        variables.levelGame = 0
        variables.countSec = 0
        variables.countMin = 0
        mainArray.oldCancelArray = [[]]
    
        saveData()
        
        MSAnalytics.trackEvent("Выбор сложности: Лёгкий")
        
        let newController = self.storyboard!.instantiateViewController(withIdentifier: "mainGameView")
        self.navigationController!.pushViewController(newController, animated : true)
    }
    
    @objc func averageGameButton() {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 1, numCount: 0)
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsAverageGamesPlayed += 1
        statistics_fill_all(level: 1)
        variables.countError = 0
        variables.levelGame = 1
        variables.countSec = 0
        variables.countMin = 0
        mainArray.oldCancelArray = [[]]

        saveData()
        
        MSAnalytics.trackEvent("Выбор сложности: Средний")

        let newController = self.storyboard!.instantiateViewController(withIdentifier: "mainGameView")
        self.navigationController!.pushViewController(newController, animated : true)
    }

    @objc func hardGameButton() {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 2, numCount: 0)
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsHardGamesPlayed += 1
        statistics_fill_all(level: 2)
        variables.countError = 0
        variables.levelGame = 2
        variables.countSec = 0
        variables.countMin = 0
        mainArray.oldCancelArray = [[]]

        saveData()
        
        MSAnalytics.trackEvent("Выбор сложности: Сложный")

        let newController = self.storyboard!.instantiateViewController(withIdentifier: "mainGameView")
        self.navigationController!.pushViewController(newController, animated : true)
    }
  
    @objc func expertGameButton() {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 3, numCount: 0)
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsExpertGamesPlayed += 1
        statistics_fill_all(level: 3)
        variables.countError = 0
        variables.levelGame = 3
        variables.countSec = 0
        variables.countMin = 0
        mainArray.oldCancelArray = [[]]

        saveData()
        
        MSAnalytics.trackEvent("Выбор сложности: Эксперт")
        let newController = self.storyboard!.instantiateViewController(withIdentifier: "mainGameView")
        self.navigationController!.pushViewController(newController, animated : true)
    }
    
    func random_level () {
        let a = Int.random(in: 1..<10)
        let b = Int.random(in: 1..<100)
        let c = Int.random(in: 1..<100)
        let d = Int.random(in: 1..<100)
        let e = Int.random(in: 1..<100)
        var a_a: Int = 0
        var b_b: Int = 0
        var c_c: Int = 0
        var d_d: Int = 0
        var e_e: Int = 0
        
        repeat {
            mainArray.allNumbers = transposing(array: mainArray.baseAllNumbers)
            a_a += 1
        } while a_a < a
        
        repeat {
            mainArray.allNumbers = swap_rows_area_all(array: mainArray.allNumbers)
            b_b += 1
        } while b_b < b
        
        repeat {
            mainArray.allNumbers = swap_rows_small_all(array: mainArray.allNumbers)
            c_c += 1
        } while c_c < c
        
        repeat {
            mainArray.allNumbers = swap_colums_area_all(array: mainArray.allNumbers)
            d_d += 1
        } while d_d < d
        
        repeat {
            mainArray.allNumbers = swap_colums_small_all(array: mainArray.allNumbers)
            e_e += 1
        } while e_e < e
    }
    
    
    let softUIViewEasyGame = SoftUIView(frame: .init(x: 50, y: 440, width: 275, height: 60))
    let softUIViewAverageGame = SoftUIView(frame: .init(x: 50, y: 520, width: 275, height: 60))
    let softUIViewHardGame = SoftUIView(frame: .init(x: 50, y: 600, width: 275, height: 60))
    let softUIViewExpertGame = SoftUIView(frame: .init(x: 50, y: 680, width: 275, height: 60))

    let plusView = SoftUIView(frame: .init(x: 150, y: 265, width: 50, height: 50))
    let minusView = SoftUIView(frame: .init(x: 40, y: 265, width: 50, height: 50))
    let playCustomGame = SoftUIView(frame: .init(x: 215, y: 260, width: 120, height: 60))
    
    func buttonDesign () {
        
        labelTitleLevel.text = NSLocalizedString("level_of_difficulty", comment: "")
        labelTitleLevel.font = labelTitleLevel.font.withSize(25)
        labelTitleLevel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

        labelTitleCustomGame.text = NSLocalizedString("create_your_game", comment: "")
        labelTitleCustomGame.font = labelTitleCustomGame.font.withSize(25)
        labelTitleCustomGame.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        descriptionCustomGame.text = NSLocalizedString("number_of_free_cells", comment: "")
        descriptionCustomGame.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        descriptionCustomGame.font = descriptionCustomGame.font.withSize(12)


        labelPlus.font = labelPlus.font.withSize(30)
        labelMinus.font = labelMinus.font.withSize(30)

        labelCountCustomGame.text = "\(variables.customGameNumber)"
        labelCountCustomGame.font = labelEasyGame.font.withSize(30)

        labelEasyGame.text = NSLocalizedString("easy", comment: "")
        labelEasyGame.font = labelEasyGame.font.withSize(30)
        
        labelAverageGame.text = NSLocalizedString("medium", comment: "")
        labelAverageGame.font = labelAverageGame.font.withSize(30)
        
        labelHardGame.text = NSLocalizedString("hard", comment: "")
        labelHardGame.font = labelHardGame.font.withSize(30)

        labelExpertGame.text = NSLocalizedString("expert", comment: "")
        labelExpertGame.font = labelExpertGame.font.withSize(30)
        
        labelCustomGame.text = NSLocalizedString("play", comment: "")
        labelCustomGame.font = labelCustomGame.font.withSize(30)
        
        plusView.addTarget(self, action: #selector(plusCount), for: .touchUpInside)
        plusView.cornerRadius = 30
        self.view.addSubview(plusView)
        self.view.bringSubviewToFront(plusView)
        
        minusView.addTarget(self, action: #selector(minusCount), for: .touchUpInside)
        minusView.cornerRadius = 30
        self.view.addSubview(minusView)
        
        self.view.addSubview(playCustomGame)
        self.view.bringSubviewToFront(labelPlus)
        self.view.bringSubviewToFront(labelMinus)
        
        self.view.addSubview(softUIViewEasyGame)
        self.view.addSubview(softUIViewAverageGame)
        self.view.addSubview(softUIViewHardGame)
        self.view.addSubview(softUIViewExpertGame)

        self.view.bringSubviewToFront(labelEasyGame)
        self.view.bringSubviewToFront(labelAverageGame)
        self.view.bringSubviewToFront(labelHardGame)
        self.view.bringSubviewToFront(labelExpertGame)
        self.view.bringSubviewToFront(labelCustomGame)
        
        playCustomGame.addTarget(self, action: #selector(customGameButton), for: .touchUpInside)
        softUIViewEasyGame.addTarget(self, action: #selector(easyGameButton), for: .touchUpInside)
        softUIViewAverageGame.addTarget(self, action: #selector(averageGameButton), for: .touchUpInside)
        softUIViewHardGame.addTarget(self, action: #selector(hardGameButton), for: .touchUpInside)
        softUIViewExpertGame.addTarget(self, action: #selector(expertGameButton), for: .touchUpInside)
        
    }
    
    func sizeElement () {
          let screenWidth = UIScreen.main.bounds.width
          let screenHeight = UIScreen.main.bounds.height
          switch screenWidth {
          case 375:
              if screenHeight == 812 {
                
                self.labelEasyGame.frame = CGRect(x: 50, y: 440, width: 275, height: 60)
                self.labelAverageGame.frame = CGRect(x: 50, y: 520, width: 275, height: 60)
                self.labelHardGame.frame = CGRect(x: 50, y: 600, width: 275, height: 60)
                self.labelExpertGame.frame = CGRect(x: 50, y: 680, width: 275, height: 60)
                self.labelCustomGame.frame = CGRect(x: 230, y: 260, width: 100, height: 60)
                self.labelCountCustomGame.frame = CGRect(x: 95, y: 265, width: 50, height: 50)
                self.labelTitleLevel.frame = CGRect(x: 50, y: 380, width: 275, height: 50)
                self.labelTitleCustomGame.frame = CGRect(x: 50, y: 210, width: 275, height: 50)
                self.labelMinus.frame = CGRect(x: 40, y: 265, width: 50, height: 50)
                self.labelPlus.frame = CGRect(x: 150, y: 265, width: 50, height: 50)
                self.descriptionCustomGame.frame = CGRect(x: 40, y: 325, width: 250, height: 20)
                
              } else if screenHeight == 667 {
                
                self.softUIViewEasyGame.frame = CGRect(x: 50, y: 340, width: 275, height: 60)
                self.softUIViewAverageGame.frame = CGRect(x: 50, y: 420, width: 275, height: 60)
                self.softUIViewHardGame.frame = CGRect(x: 50, y: 500, width: 275, height: 60)
                self.softUIViewExpertGame.frame = CGRect(x: 50, y: 580, width: 275, height: 60)
                
                self.plusView.frame = CGRect(x: 150, y: 165, width: 50, height: 50)
                self.minusView.frame = CGRect(x: 40, y: 165, width: 50, height: 50)
                self.playCustomGame.frame = CGRect(x: 215, y: 160, width: 120, height: 60)
                
                self.labelEasyGame.frame = CGRect(x: 50, y: 340, width: 275, height: 60)
                self.labelAverageGame.frame = CGRect(x: 50, y: 420, width: 275, height: 60)
                self.labelHardGame.frame = CGRect(x: 50, y: 500, width: 275, height: 60)
                self.labelExpertGame.frame = CGRect(x: 50, y: 580, width: 275, height: 60)
                self.labelCustomGame.frame = CGRect(x: 230, y: 160, width: 100, height: 60)
                self.labelCountCustomGame.frame = CGRect(x: 95, y: 165, width: 50, height: 50)
                self.labelTitleLevel.frame = CGRect(x: 50, y: 280, width: 275, height: 50)
                self.labelTitleCustomGame.frame = CGRect(x: 50, y: 110, width: 275, height: 50)
                self.labelMinus.frame = CGRect(x: 40, y: 165, width: 50, height: 50)
                self.labelPlus.frame = CGRect(x: 150, y: 165, width: 50, height: 50)
                self.descriptionCustomGame.frame = CGRect(x: 40, y: 225, width: 250, height: 20)
            
              }
          case 414:
            if screenHeight == 896 {
                
                self.softUIViewEasyGame.frame = CGRect(x: 70, y: 520, width: 274, height: 60)
                self.softUIViewAverageGame.frame = CGRect(x: 70, y: 600, width: 274, height: 60)
                self.softUIViewHardGame.frame = CGRect(x: 70, y: 680, width: 274, height: 60)
                self.softUIViewExpertGame.frame = CGRect(x: 70, y: 760, width: 274, height: 60)
                
                self.plusView.frame = CGRect(x: 170, y: 315, width: 50, height: 50)
                self.minusView.frame = CGRect(x: 60, y: 315, width: 50, height: 50)
                self.playCustomGame.frame = CGRect(x: 235, y: 310, width: 120, height: 60)
                
                self.labelEasyGame.frame = CGRect(x: 70, y: 520, width: 274, height: 60)
                self.labelAverageGame.frame = CGRect(x: 70, y: 600, width: 274, height: 60)
                self.labelHardGame.frame = CGRect(x: 70, y: 680, width: 274, height: 60)
                self.labelExpertGame.frame = CGRect(x: 70, y: 760, width: 274, height: 60)
                
                self.labelCustomGame.frame = CGRect(x: 250, y: 310, width: 100, height: 60)
                self.labelCountCustomGame.frame = CGRect(x: 115, y: 315, width: 50, height: 50)
                self.labelTitleLevel.frame = CGRect(x: 50, y: 460, width: 314, height: 50)
                self.labelTitleCustomGame.frame = CGRect(x: 50, y: 260, width: 314, height: 50)
                self.labelMinus.frame = CGRect(x: 60, y: 315, width: 50, height: 50)
                self.labelPlus.frame = CGRect(x: 170, y: 315, width: 50, height: 50)
                self.descriptionCustomGame.frame = CGRect(x: 60, y: 375, width: 250, height: 20)
                
            } else if screenHeight == 736 {
                
                self.softUIViewEasyGame.frame = CGRect(x: 70, y: 360, width: 274, height: 60)
                self.softUIViewAverageGame.frame = CGRect(x: 70, y: 440, width: 274, height: 60)
                self.softUIViewHardGame.frame = CGRect(x: 70, y: 520, width: 274, height: 60)
                self.softUIViewExpertGame.frame = CGRect(x: 70, y: 600, width: 274, height: 60)
                
                self.plusView.frame = CGRect(x: 170, y: 155, width: 50, height: 50)
                self.minusView.frame = CGRect(x: 60, y: 155, width: 50, height: 50)
                self.playCustomGame.frame = CGRect(x: 235, y: 150, width: 120, height: 60)
                
                self.labelEasyGame.frame = CGRect(x: 70, y: 360, width: 274, height: 60)
                self.labelAverageGame.frame = CGRect(x: 70, y: 440, width: 274, height: 60)
                self.labelHardGame.frame = CGRect(x: 70, y: 520, width: 274, height: 60)
                self.labelExpertGame.frame = CGRect(x: 70, y: 600, width: 274, height: 60)
                
                self.labelCustomGame.frame = CGRect(x: 250, y: 150, width: 100, height: 60)
                self.labelCountCustomGame.frame = CGRect(x: 115, y: 155, width: 50, height: 50)
                self.labelTitleLevel.frame = CGRect(x: 50, y: 300, width: 314, height: 50)
                self.labelTitleCustomGame.frame = CGRect(x: 50, y: 100, width: 314, height: 50)
                self.labelMinus.frame = CGRect(x: 60, y: 155, width: 50, height: 50)
                self.labelPlus.frame = CGRect(x: 170, y: 155, width: 50, height: 50)
                self.descriptionCustomGame.frame = CGRect(x: 60, y: 215, width: 250, height: 20)
                
            }
          case 320:
            
            self.softUIViewEasyGame.frame = CGRect(x: 28, y: 265, width: 264, height: 60)
            self.softUIViewAverageGame.frame = CGRect(x: 28, y: 340, width: 264, height: 60)
            self.softUIViewHardGame.frame = CGRect(x: 28, y: 415, width: 264, height: 60)
            self.softUIViewExpertGame.frame = CGRect(x: 28, y: 490, width: 264, height: 60)
            
            self.plusView.frame = CGRect(x: 123, y: 115, width: 50, height: 50)
            self.minusView.frame = CGRect(x: 13, y: 115, width: 50, height: 50)
            self.playCustomGame.frame = CGRect(x: 188, y: 110, width: 120, height: 60)
            
            self.labelEasyGame.frame = CGRect(x: 28, y: 265, width: 264, height: 60)
            self.labelAverageGame.frame = CGRect(x: 28, y: 340, width: 264, height: 60)
            self.labelHardGame.frame = CGRect(x: 28, y: 415, width: 264, height: 60)
            self.labelExpertGame.frame = CGRect(x: 28, y: 490, width: 264, height: 60)
            
            self.labelCustomGame.frame = CGRect(x: 203, y: 110, width: 100, height: 60)
            self.labelCountCustomGame.frame = CGRect(x: 68, y: 115, width: 50, height: 50)
            self.labelTitleLevel.frame = CGRect(x: 3, y: 210, width: 314, height: 50)
            self.labelTitleCustomGame.frame = CGRect(x: 3, y: 60, width: 314, height: 50)
            self.labelMinus.frame = CGRect(x: 13, y: 115, width: 50, height: 50)
            self.labelPlus.frame = CGRect(x: 123, y: 115, width: 50, height: 50)
            self.descriptionCustomGame.frame = CGRect(x: 13, y: 175, width: 250, height: 20)
            
          default:
              break
          }
      }
    
}
