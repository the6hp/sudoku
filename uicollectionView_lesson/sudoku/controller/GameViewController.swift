//Экран выбора сложности игры

import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var easyButtonGameView: UIButton!
    @IBOutlet weak var averageButtonGameView: UIButton!
    @IBOutlet weak var hardButtonGameView: UIButton!
    @IBOutlet weak var expertButtonGameView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSelectGame()
        //Убрать нижную границу у нав бара
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //Убираем текст кнопки "Назад"
        self.navigationItem.backBarButtonItem?.title = ""
    }
    
    @IBAction func easyGameButton(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 0)
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsEasyGamesPlayed += 1
        statistics_fill_all(level: 0)
        variables.countError = 0
        variables.levelGame = 0
        variables.countSec = 0
        variables.countMin = 0
        saveData()
    }
    
    @IBAction func averageGameButton(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 1)
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsAverageGamesPlayed += 1
        statistics_fill_all(level: 1)
        variables.countError = 0
        variables.levelGame = 1
        variables.countSec = 0
        variables.countMin = 0
        saveData()
    }
    
    @IBAction func hardGameButton(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 2)
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsHardGamesPlayed += 1
        statistics_fill_all(level: 2)
        variables.countError = 0
        variables.levelGame = 2
        variables.countSec = 0
        variables.countMin = 0
        saveData()
    }
    
    @IBAction func expertGameButton(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
     //   mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 3)
        mainArray.allNumbers_text = ["1", "2", "", "4", "5", "6", "7", "8", "9", "4", "5", "6", "7", "8", "9", "1", "2", "3", "7", "8", "9", "1", "2", "3", "4", "5", "6", "2", "3", "4", "5", "6", "7", "8", "9", "1", "5", "6", "7", "8", "9", "1", "2", "3", "4", "8", "9", "1", "2", "3", "4", "5", "6", "7", "3", "4", "5", "6", "7", "8", "9", "1", "2", "6", "7", "8", "9", "1", "2", "3", "4", "5", "9", "1", "2", "3", "4", "5", "6", "7", "8"]
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsExpertGamesPlayed += 1
        statistics_fill_all(level: 3)
        variables.countError = 0
        variables.levelGame = 3
        variables.countSec = 0
        variables.countMin = 0
        saveData()
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
    
    
    
    
    func buttonSelectGame () {
        easyButtonGameView.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 0.7479398545)
        easyButtonGameView.layer.cornerRadius = 25
        easyButtonGameView.layer.borderWidth = 0
        easyButtonGameView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        averageButtonGameView.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 0.7479398545)
        averageButtonGameView.layer.cornerRadius = 25
        averageButtonGameView.layer.borderWidth = 0
        averageButtonGameView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        hardButtonGameView.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 0.7479398545)
        hardButtonGameView.layer.cornerRadius = 25
        hardButtonGameView.layer.borderWidth = 0
        hardButtonGameView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        expertButtonGameView.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 0.7479398545)
        expertButtonGameView.layer.cornerRadius = 25
        expertButtonGameView.layer.borderWidth = 0
        expertButtonGameView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
}
