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
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 0)
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsEasyGamesPlayed += 1
        variables.countError = 0
        saveData()
    }
    
    @IBAction func averageGameButton(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 1)
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsAverageGamesPlayed += 1
        variables.countError = 0

        saveData()
    }
    
    @IBAction func hardGameButton(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 2)
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsHardGamesPlayed += 1
        variables.countError = 0

        saveData()
    }
    
    @IBAction func expertGameButton(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = true
        mainArray.testArray = mainArray.defaultArray
        random_level()
        mainArray.allNumbers_text = new_remove_all(array: mainArray.allNumbers, difficulty: 3)
        fill_array_all()
        variables.savedGame = true
        statistics.statisticsExpertGamesPlayed += 1
        variables.countError = 0

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
        easyButtonGameView.backgroundColor = .clear
        easyButtonGameView.layer.cornerRadius = 25
        easyButtonGameView.layer.borderWidth = 1
        easyButtonGameView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        averageButtonGameView.backgroundColor = .clear
        averageButtonGameView.layer.cornerRadius = 25
        averageButtonGameView.layer.borderWidth = 1
        averageButtonGameView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        hardButtonGameView.backgroundColor = .clear
        hardButtonGameView.layer.cornerRadius = 25
        hardButtonGameView.layer.borderWidth = 1
        hardButtonGameView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        expertButtonGameView.backgroundColor = .clear
        expertButtonGameView.layer.cornerRadius = 25
        expertButtonGameView.layer.borderWidth = 1
        expertButtonGameView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
