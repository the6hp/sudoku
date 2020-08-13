import UIKit
import AVFoundation
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

class ViewController: UIViewController, AVAudioPlayerDelegate {

    
    //Звук тапа по кнопке
    let tapSound = URL(fileURLWithPath: Bundle.main.path(forResource: "tap", ofType: "m4a")!)
    var audioPlayer = AVAudioPlayer()
    
    func timerObserver () {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(startTimer), name: NSNotification.Name(rawValue: "startTimerValue"), object: nil)
            
    }

    @objc func startTimer (notification:NSNotification) {
        timerSec()
        variables.hiddenCell = false
        collectionView.reloadData()
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    //------------------------------------------------------//

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        timerSec()
        variables.savedGame = true
        sizeViewButton()
        errorLabelCount()
        
        timerObserver()
        //Добавление правой кнопки в навбаре
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Настройки", style: .plain, target: self, action: #selector(testButton))
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //Убираем текст кнопки "Назад"
        self.navigationItem.backBarButtonItem?.title = ""
        
        self.navigationItem.title?  = NSLocalizedString("game", comment: "")

        // Показываем текущую сложность
        levelDifficulty()
        
        //Блокируется ли экран при бездействии
        if settings.autolockScreen == true {
            UIApplication.shared.isIdleTimerDisabled = false
        } else if settings.autolockScreen == false {
            UIApplication.shared.isIdleTimerDisabled = true
        }
        
        //Показывать таймер или нет
        if settings.timer == true {
            labelTimer.isHidden = false
            stopGameButtonOutlet.isHidden = false
        } else if settings.timer == false {
            labelTimer.isHidden = true
            stopGameButtonOutlet.isHidden = true
        }
        
        let MSAppCenter_Key = Bundle.init(for: AppDelegate.self).infoDictionary?["MSAppCenter_Key"] as! String
        MSAppCenter.start(MSAppCenter_Key, withServices:[
          MSCrashes.self
        ])
        
        
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(panHandler(recognizer:)))
        collectionView.addGestureRecognizer(pan)
        
        cancelButtonOutletLabel.text = NSLocalizedString("undo", comment: "")
        removeButtonOutletLabel.text = NSLocalizedString("erase", comment: "")
        noteButtonOutletLabel.text = NSLocalizedString("notes", comment: "")
        helpButtonOutletLabel.text = NSLocalizedString("hint", comment: "")
        
        saveData()
    }

    @IBAction func stopGameButton(_ sender: Any) {
        StopGame()
        timerS.invalidate()
        variables.hiddenCell = true
        collectionView.reloadData()
    }
    
    @IBOutlet weak var stopGameButtonOutlet: UIButton!
    @IBOutlet weak var cancelButtonOutletLabel: UILabel!
    @IBOutlet weak var removeButtonOutletLabel: UILabel!
    @IBOutlet weak var noteButtonOutletLabel: UILabel!
    @IBOutlet weak var helpButtonOutletLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var mainButton_1_Outlet: UIButton!
    @IBOutlet weak var mainButton_2_Outlet: UIButton!
    @IBOutlet weak var mainButton_3_Outlet: UIButton!
    @IBOutlet weak var mainButton_4_Outlet: UIButton!
    @IBOutlet weak var mainButton_5_Outlet: UIButton!
    @IBOutlet weak var mainButton_6_Outlet: UIButton!
    @IBOutlet weak var mainButton_7_Outlet: UIButton!
    @IBOutlet weak var mainButton_8_Outlet: UIButton!
    @IBOutlet weak var mainButton_9_Outlet: UIButton!
    @IBOutlet weak var levelDifficultyLabel: UILabel!
    
    
    
    //------------------------------------------------------//
    // Показ уровня сложности
    //------------------------------------------------------//
    
    func levelDifficulty () {
        if variables.levelGame == 0 {
        levelDifficultyLabel.text = NSLocalizedString("easy", comment: "")
        } else if variables.levelGame == 1 {
        levelDifficultyLabel.text = NSLocalizedString("medium", comment: "")
        } else if variables.levelGame == 2 {
        levelDifficultyLabel.text = NSLocalizedString("hard", comment: "")
        } else if variables.levelGame == 3 {
        levelDifficultyLabel.text = NSLocalizedString("expert", comment: "")
        } else {
            levelDifficultyLabel.text = ""
        }
    }
    

    //------------------------------------------------------//
    // Кнопка с цифрой "1"
    //------------------------------------------------------//

    
    @IBAction func mainButton_1(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        if variables.selectCell != nil {
            
            
            resetting_the_selection_all()
            if variables.selectCell != nil {
            add_cancel_array_all(Number: variables.selectCell![1])
            }
            if variables.changeButtonNote == 0 {
                if variables.selectCell != nil {
                    let a = variables.selectCell![1]
                    clear_help_all(number: a)
                    if mainArray.testArray[a][0] == "" {
                        mainArray.testArray[a][0] = "1"
                        mainArray.testArray[a][2] = "2"
                    } else if mainArray.testArray[a][0] == "1" && mainArray.testArray[a][2] == "2"  {
                        mainArray.testArray[a][0] = ""
                    } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                        mainArray.testArray[a][0] = "1"
                    }
                }
            } else if variables.changeButtonNote == 1 && mainArray.testArray[variables.selectCell![1]][0] == "" {
                let a = variables.selectCell![1]
                if variables.selectCell != nil && mainArray.testArray[a][4] == "" {
                    mainArray.testArray[a][4] = "1"
                } else if variables.selectCell != nil && mainArray.testArray[a][4] == "1" {
                    mainArray.testArray[a][4] = ""
                    mainArray.testArray[a][0] = ""
                }
            }
            
            delete_note_all(number: variables.selectCell![1])

            same_number_all()
            
            if settings.autocheckError == true {
                error_number_all() //красим ячейку с ошибкой
            }
            
            
        }
        
        if hide_used_numbers_all(num: "1") == 1 {
            mainButton_1_Outlet.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        } else if hide_used_numbers_all(num: "1") == 0 {
            mainButton_1_Outlet.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
        
       
        if settings.sound == true {
            do {
                 audioPlayer = try AVAudioPlayer(contentsOf: tapSound)
                 audioPlayer.play()
            } catch {
               // couldn't load file :(
            }
        }
        errorLabelCount()

        collectionView.reloadData()
        if end_game_all() == true {
            if variables.levelGame == 0 {
                statistics.statisticEasyGamesCompleted += 1
                statistics.statisticEasyBestWinStreak += 1
                best_average_time_all(level: 0)
            } else if variables.levelGame == 1 {
                statistics.statisticAverageGamesCompleted += 1
                statistics.statisticAverageBestWinStreak += 1
                best_average_time_all(level: 1)
            } else if variables.levelGame == 2 {
                statistics.statisticHardGamesCompleted += 1
                statistics.statisticHardBestWinStreak += 1
                best_average_time_all(level: 2)
            } else if variables.levelGame == 3 {
                statistics.statisticExpertGamesCompleted += 1
                statistics.statisticExpertBestWinStreak += 1
                best_average_time_all(level: 3)
            }
            
            statistics_fill_all(level: variables.levelGame)
            variables.savedGame = false

            popUpEndGame()
        }
        
        if variables.countError > 2 {
            
            if variables.levelGame == 0 {
                 statistics.statisticEasyBestWinStreak = 0
             } else if variables.levelGame == 1 {
                 statistics.statisticAverageBestWinStreak = 0
             } else if variables.levelGame == 2 {
                 statistics.statisticHardBestWinStreak = 0
             } else if variables.levelGame == 3 {
                 statistics.statisticExpertBestWinStreak = 0
             }
            variables.savedGame = false
            
            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "2"
    //------------------------------------------------------//

    @IBAction func mainButton_2(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        
        if variables.selectCell != nil {
            
            resetting_the_selection_all()
            if variables.selectCell != nil {
            add_cancel_array_all(Number: variables.selectCell![1])
            }
             if variables.changeButtonNote == 0 {
                       if variables.selectCell != nil {
                           let a = variables.selectCell![1]
                           clear_help_all(number: a)
                           if mainArray.testArray[a][0] == "" {
                               mainArray.testArray[a][0] = "2"
                               mainArray.testArray[a][2] = "2"
                           } else if mainArray.testArray[a][0] == "2" && mainArray.testArray[a][2] == "2"  {
                               mainArray.testArray[a][0] = ""
                           } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                               mainArray.testArray[a][0] = "2"
                           }
                       }
                   } else if variables.changeButtonNote == 1 && mainArray.testArray[variables.selectCell![1]][0] == "" {
                       let a = variables.selectCell![1]
                       if variables.selectCell != nil && mainArray.testArray[a][5] == "" {
                           mainArray.testArray[a][5] = "2"
                       } else if variables.selectCell != nil && mainArray.testArray[a][5] == "2" {
                           mainArray.testArray[a][5] = ""
                           mainArray.testArray[a][0] = ""
                       }
                   }
            
            delete_note_all(number: variables.selectCell![1])
            
            same_number_all()
            
            if settings.autocheckError == true {
                error_number_all() //красим ячейку с ошибкой
            }
            
            if settings.sound == true {
                do {
                     audioPlayer = try AVAudioPlayer(contentsOf: tapSound)
                     audioPlayer.play()
                } catch {
                   // couldn't load file :(
                }
            }

            
            
        }
        errorLabelCount()

        collectionView.reloadData()
        if end_game_all() == true {
            if variables.levelGame == 0 {
                statistics.statisticEasyGamesCompleted += 1
                statistics.statisticEasyBestWinStreak += 1
                best_average_time_all(level: 0)
            } else if variables.levelGame == 1 {
                statistics.statisticAverageGamesCompleted += 1
                statistics.statisticAverageBestWinStreak += 1
                best_average_time_all(level: 1)
            } else if variables.levelGame == 2 {
                statistics.statisticHardGamesCompleted += 1
                statistics.statisticHardBestWinStreak += 1
                best_average_time_all(level: 2)
            } else if variables.levelGame == 3 {
                statistics.statisticExpertGamesCompleted += 1
                statistics.statisticExpertBestWinStreak += 1
                best_average_time_all(level: 3)
            }
            
            statistics_fill_all(level: variables.levelGame)
            variables.savedGame = false

            popUpEndGame()
        }
        
        if variables.countError > 2 {
            
            if variables.levelGame == 0 {
                 statistics.statisticEasyBestWinStreak = 0
             } else if variables.levelGame == 1 {
                 statistics.statisticAverageBestWinStreak = 0
             } else if variables.levelGame == 2 {
                 statistics.statisticHardBestWinStreak = 0
             } else if variables.levelGame == 3 {
                 statistics.statisticExpertBestWinStreak = 0
             }
            variables.savedGame = false

            popUpEndGame()
        }
        
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "3"
    //------------------------------------------------------//

    @IBAction func mainButton_3(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        if variables.selectCell != nil {
            

            resetting_the_selection_all()

            if variables.selectCell != nil {
            add_cancel_array_all(Number: variables.selectCell![1])
            }
            if variables.changeButtonNote == 0 {
                       if variables.selectCell != nil {
                           let a = variables.selectCell![1]
                           clear_help_all(number: a)
                           if mainArray.testArray[a][0] == "" {
                               mainArray.testArray[a][0] = "3"
                               mainArray.testArray[a][2] = "2"
                           } else if mainArray.testArray[a][0] == "3" && mainArray.testArray[a][2] == "2"  {
                               mainArray.testArray[a][0] = ""
                           } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                               mainArray.testArray[a][0] = "3"
                           }
                       }
                   } else if variables.changeButtonNote == 1 && mainArray.testArray[variables.selectCell![1]][0] == "" {
                       let a = variables.selectCell![1]
                       if variables.selectCell != nil && mainArray.testArray[a][6] == "" {
                           mainArray.testArray[a][6] = "3"
                       } else if variables.selectCell != nil && mainArray.testArray[a][6] == "3" {
                           mainArray.testArray[a][6] = ""
                           mainArray.testArray[a][0] = ""
                       }
                   }
            
            delete_note_all(number: variables.selectCell![1])

            
            same_number_all()
            
            if settings.autocheckError == true {
                error_number_all() //красим ячейку с ошибкой
            }
            
            
            
            
        }
        
        if settings.sound == true {
            do {
                 audioPlayer = try AVAudioPlayer(contentsOf: tapSound)
                 audioPlayer.play()
            } catch {
               // couldn't load file :(
            }
        }

        
        
        errorLabelCount()

        collectionView.reloadData()
        
        if end_game_all() == true {
            
            if variables.levelGame == 0 {
                statistics.statisticEasyGamesCompleted += 1
                statistics.statisticEasyBestWinStreak += 1
                best_average_time_all(level: 0)
            } else if variables.levelGame == 1 {
                statistics.statisticAverageGamesCompleted += 1
                statistics.statisticAverageBestWinStreak += 1
                best_average_time_all(level: 1)
            } else if variables.levelGame == 2 {
                statistics.statisticHardGamesCompleted += 1
                statistics.statisticHardBestWinStreak += 1
                best_average_time_all(level: 2)
            } else if variables.levelGame == 3 {
                statistics.statisticExpertGamesCompleted += 1
                statistics.statisticExpertBestWinStreak += 1
                best_average_time_all(level: 3)
            }
            
            statistics_fill_all(level: variables.levelGame)
            variables.savedGame = false
            popUpEndGame()
        }
        
        if variables.countError > 2 {
            
            if variables.levelGame == 0 {
                 statistics.statisticEasyBestWinStreak = 0
             } else if variables.levelGame == 1 {
                 statistics.statisticAverageBestWinStreak = 0
             } else if variables.levelGame == 2 {
                 statistics.statisticHardBestWinStreak = 0
             } else if variables.levelGame == 3 {
                 statistics.statisticExpertBestWinStreak = 0
             }
            variables.savedGame = false
            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "4"
    //------------------------------------------------------//

    @IBAction func mainButton_4(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        if variables.selectCell != nil {
            

            
            resetting_the_selection_all()

            if variables.selectCell != nil {
            add_cancel_array_all(Number: variables.selectCell![1])
            }
            if variables.changeButtonNote == 0 {
                       if variables.selectCell != nil {
                           let a = variables.selectCell![1]
                           clear_help_all(number: a)
                           if mainArray.testArray[a][0] == "" {
                               mainArray.testArray[a][0] = "4"
                               mainArray.testArray[a][2] = "2"
                           } else if mainArray.testArray[a][0] == "4" && mainArray.testArray[a][2] == "2"  {
                               mainArray.testArray[a][0] = ""
                           } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                               mainArray.testArray[a][0] = "4"
                           }
                       }
                   } else if variables.changeButtonNote == 1 && mainArray.testArray[variables.selectCell![1]][0] == "" {
                       let a = variables.selectCell![1]
                       if variables.selectCell != nil && mainArray.testArray[a][7] == "" {
                           mainArray.testArray[a][7] = "4"
                       } else if variables.selectCell != nil && mainArray.testArray[a][7] == "4" {
                           mainArray.testArray[a][7] = ""
                           mainArray.testArray[a][0] = ""
                       }
                   }
            
            delete_note_all(number: variables.selectCell![1])

            same_number_all()
            
            if settings.autocheckError == true {
                error_number_all() //красим ячейку с ошибкой
            }
            
            
            
            
        }
        
        
        if settings.sound == true {
            do {
                 audioPlayer = try AVAudioPlayer(contentsOf: tapSound)
                 audioPlayer.play()
            } catch {
               // couldn't load file :(
            }
        }

        
        
        errorLabelCount()

        collectionView.reloadData()
        if end_game_all() == true {
            if variables.levelGame == 0 {
                statistics.statisticEasyGamesCompleted += 1
                statistics.statisticEasyBestWinStreak += 1
                best_average_time_all(level: 0)
            } else if variables.levelGame == 1 {
                statistics.statisticAverageGamesCompleted += 1
                statistics.statisticAverageBestWinStreak += 1
                best_average_time_all(level: 1)
            } else if variables.levelGame == 2 {
                statistics.statisticHardGamesCompleted += 1
                statistics.statisticHardBestWinStreak += 1
                best_average_time_all(level: 2)
            } else if variables.levelGame == 3 {
                statistics.statisticExpertGamesCompleted += 1
                statistics.statisticExpertBestWinStreak += 1
                best_average_time_all(level: 3)
            }
            
            statistics_fill_all(level: variables.levelGame)
            variables.savedGame = false

            popUpEndGame()
        }
        
        if variables.countError > 2 {
            
            if variables.levelGame == 0 {
                 statistics.statisticEasyBestWinStreak = 0
             } else if variables.levelGame == 1 {
                 statistics.statisticAverageBestWinStreak = 0
             } else if variables.levelGame == 2 {
                 statistics.statisticHardBestWinStreak = 0
             } else if variables.levelGame == 3 {
                 statistics.statisticExpertBestWinStreak = 0
             }
            variables.savedGame = false

            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "5"
    //------------------------------------------------------//

    @IBAction func mainButton_5(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        
        if variables.selectCell != nil {
            
            

            
            resetting_the_selection_all()

            if variables.selectCell != nil {
            add_cancel_array_all(Number: variables.selectCell![1])
            }
            if variables.changeButtonNote == 0 {
                       if variables.selectCell != nil {
                           let a = variables.selectCell![1]
                           clear_help_all(number: a)
                           if mainArray.testArray[a][0] == "" {
                               mainArray.testArray[a][0] = "5"
                               mainArray.testArray[a][2] = "2"
                           } else if mainArray.testArray[a][0] == "5" && mainArray.testArray[a][2] == "2"  {
                               mainArray.testArray[a][0] = ""
                           } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                               mainArray.testArray[a][0] = "5"
                           }
                       }
                   } else if variables.changeButtonNote == 1 && mainArray.testArray[variables.selectCell![1]][0] == "" {
                       let a = variables.selectCell![1]
                       if variables.selectCell != nil && mainArray.testArray[a][8] == "" {
                           mainArray.testArray[a][8] = "5"
                       } else if variables.selectCell != nil && mainArray.testArray[a][8] == "5" {
                           mainArray.testArray[a][8] = ""
                           mainArray.testArray[a][0] = ""
                       }
                   }
            
            delete_note_all(number: variables.selectCell![1])

            same_number_all()
            
            if settings.autocheckError == true {
                error_number_all() //красим ячейку с ошибкой
            }
            
            
            
        }
        
        if settings.sound == true {
            do {
                 audioPlayer = try AVAudioPlayer(contentsOf: tapSound)
                 audioPlayer.play()
            } catch {
               // couldn't load file :(
            }
        }

        errorLabelCount()
        

        collectionView.reloadData()
        if end_game_all() == true {
            if variables.levelGame == 0 {
                statistics.statisticEasyGamesCompleted += 1
                statistics.statisticEasyBestWinStreak += 1
                best_average_time_all(level: 0)
            } else if variables.levelGame == 1 {
                statistics.statisticAverageGamesCompleted += 1
                statistics.statisticAverageBestWinStreak += 1
                best_average_time_all(level: 1)
            } else if variables.levelGame == 2 {
                statistics.statisticHardGamesCompleted += 1
                statistics.statisticHardBestWinStreak += 1
                best_average_time_all(level: 2)
            } else if variables.levelGame == 3 {
                statistics.statisticExpertGamesCompleted += 1
                statistics.statisticExpertBestWinStreak += 1
                best_average_time_all(level: 3)
            }
            
            statistics_fill_all(level: variables.levelGame)
            variables.savedGame = false

            popUpEndGame()
        }
        
        if variables.countError > 2 {
            
            if variables.levelGame == 0 {
                 statistics.statisticEasyBestWinStreak = 0
             } else if variables.levelGame == 1 {
                 statistics.statisticAverageBestWinStreak = 0
             } else if variables.levelGame == 2 {
                 statistics.statisticHardBestWinStreak = 0
             } else if variables.levelGame == 3 {
                 statistics.statisticExpertBestWinStreak = 0
             }
            variables.savedGame = false

            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "6"
    //------------------------------------------------------//

    @IBAction func mainButton_6(_ sender: Any) {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        
        if variables.selectCell != nil {
            
            

            
            resetting_the_selection_all()

            if variables.selectCell != nil {
            add_cancel_array_all(Number: variables.selectCell![1])
            }
            if variables.changeButtonNote == 0 {
                       if variables.selectCell != nil {
                           let a = variables.selectCell![1]
                           clear_help_all(number: a)
                           if mainArray.testArray[a][0] == "" {
                               mainArray.testArray[a][0] = "6"
                               mainArray.testArray[a][2] = "2"
                           } else if mainArray.testArray[a][0] == "6" && mainArray.testArray[a][2] == "2"  {
                               mainArray.testArray[a][0] = ""
                           } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                               mainArray.testArray[a][0] = "6"
                           }
                       }
                   } else if variables.changeButtonNote == 1 && mainArray.testArray[variables.selectCell![1]][0] == "" {
                       let a = variables.selectCell![1]
                       if variables.selectCell != nil && mainArray.testArray[a][9] == "" {
                           mainArray.testArray[a][9] = "6"
                       } else if variables.selectCell != nil && mainArray.testArray[a][9] == "6" {
                           mainArray.testArray[a][9] = ""
                           mainArray.testArray[a][0] = ""
                       }
                   }
            
            same_number_all()
            
            delete_note_all(number: variables.selectCell![1])

            if settings.autocheckError == true {
                error_number_all() //красим ячейку с ошибкой
            }
            
            
            
            
        }
        
        if settings.sound == true {
            do {
                 audioPlayer = try AVAudioPlayer(contentsOf: tapSound)
                 audioPlayer.play()
            } catch {
               // couldn't load file :(
            }
        }

        
        errorLabelCount()
        
        
        collectionView.reloadData()
        if end_game_all() == true {
            if variables.levelGame == 0 {
                statistics.statisticEasyGamesCompleted += 1
                statistics.statisticEasyBestWinStreak += 1
                best_average_time_all(level: 0)
            } else if variables.levelGame == 1 {
                statistics.statisticAverageGamesCompleted += 1
                statistics.statisticAverageBestWinStreak += 1
                best_average_time_all(level: 1)
            } else if variables.levelGame == 2 {
                statistics.statisticHardGamesCompleted += 1
                statistics.statisticHardBestWinStreak += 1
                best_average_time_all(level: 2)
            } else if variables.levelGame == 3 {
                statistics.statisticExpertGamesCompleted += 1
                statistics.statisticExpertBestWinStreak += 1
                best_average_time_all(level: 3)
            }
            
            statistics_fill_all(level: variables.levelGame)
            variables.savedGame = false

            popUpEndGame()
        }
        
        if variables.countError > 2 {
            
            if variables.levelGame == 0 {
                 statistics.statisticEasyBestWinStreak = 0
             } else if variables.levelGame == 1 {
                 statistics.statisticAverageBestWinStreak = 0
             } else if variables.levelGame == 2 {
                 statistics.statisticHardBestWinStreak = 0
             } else if variables.levelGame == 3 {
                 statistics.statisticExpertBestWinStreak = 0
             }
            variables.savedGame = false

            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "7"
    //------------------------------------------------------//

    @IBAction func mainButton_7(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        if variables.selectCell != nil {
            
            

            
            resetting_the_selection_all()

            if variables.selectCell != nil {
            add_cancel_array_all(Number: variables.selectCell![1])
            }
            if variables.changeButtonNote == 0 {
                       if variables.selectCell != nil {
                           let a = variables.selectCell![1]
                           clear_help_all(number: a)
                           if mainArray.testArray[a][0] == "" {
                               mainArray.testArray[a][0] = "7"
                               mainArray.testArray[a][2] = "2"
                           } else if mainArray.testArray[a][0] == "7" && mainArray.testArray[a][2] == "2"  {
                               mainArray.testArray[a][0] = ""
                           } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                               mainArray.testArray[a][0] = "7"
                           }
                       }
                   } else if variables.changeButtonNote == 1 && mainArray.testArray[variables.selectCell![1]][0] == "" {
                       let a = variables.selectCell![1]
                       if variables.selectCell != nil && mainArray.testArray[a][10] == "" {
                           mainArray.testArray[a][10] = "7"
                       } else if variables.selectCell != nil && mainArray.testArray[a][10] == "7" {
                           mainArray.testArray[a][10] = ""
                           mainArray.testArray[a][0] = ""
                       }
                   }
            
            delete_note_all(number: variables.selectCell![1])

            same_number_all()
            
            if settings.autocheckError == true {
                error_number_all() //красим ячейку с ошибкой
            }
            
            
            
        }
        if settings.sound == true {
            do {
                 audioPlayer = try AVAudioPlayer(contentsOf: tapSound)
                 audioPlayer.play()
            } catch {
               // couldn't load file :(
            }
        }

        errorLabelCount()

        collectionView.reloadData()
        if end_game_all() == true {
            if variables.levelGame == 0 {
                statistics.statisticEasyGamesCompleted += 1
                statistics.statisticEasyBestWinStreak += 1
                best_average_time_all(level: 0)
            } else if variables.levelGame == 1 {
                statistics.statisticAverageGamesCompleted += 1
                statistics.statisticAverageBestWinStreak += 1
                best_average_time_all(level: 1)
            } else if variables.levelGame == 2 {
                statistics.statisticHardGamesCompleted += 1
                statistics.statisticHardBestWinStreak += 1
                best_average_time_all(level: 2)
            } else if variables.levelGame == 3 {
                statistics.statisticExpertGamesCompleted += 1
                statistics.statisticExpertBestWinStreak += 1
                best_average_time_all(level: 3)
            }
            
            statistics_fill_all(level: variables.levelGame)
            variables.savedGame = false

            popUpEndGame()
        }
        
        if variables.countError > 2 {
            
            if variables.levelGame == 0 {
                 statistics.statisticEasyBestWinStreak = 0
             } else if variables.levelGame == 1 {
                 statistics.statisticAverageBestWinStreak = 0
             } else if variables.levelGame == 2 {
                 statistics.statisticHardBestWinStreak = 0
             } else if variables.levelGame == 3 {
                 statistics.statisticExpertBestWinStreak = 0
             }
            variables.savedGame = false

            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "8"
    //------------------------------------------------------//

    @IBAction func mainButton_8(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        if variables.selectCell != nil {
            
            

            
            resetting_the_selection_all()

            if variables.selectCell != nil {
            add_cancel_array_all(Number: variables.selectCell![1])
            }
            if variables.changeButtonNote == 0 {
                       if variables.selectCell != nil {
                           let a = variables.selectCell![1]
                           clear_help_all(number: a)
                           if mainArray.testArray[a][0] == "" {
                               mainArray.testArray[a][0] = "8"
                               mainArray.testArray[a][2] = "2"
                           } else if mainArray.testArray[a][0] == "8" && mainArray.testArray[a][2] == "2"  {
                               mainArray.testArray[a][0] = ""
                           } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                               mainArray.testArray[a][0] = "8"
                           }
                       }
                   } else if variables.changeButtonNote == 1 && mainArray.testArray[variables.selectCell![1]][0] == "" {
                       let a = variables.selectCell![1]
                       if variables.selectCell != nil && mainArray.testArray[a][11] == "" {
                           mainArray.testArray[a][11] = "8"
                       } else if variables.selectCell != nil && mainArray.testArray[a][11] == "8" {
                           mainArray.testArray[a][11] = ""
                           mainArray.testArray[a][0] = ""
                       }
                   }
            
            delete_note_all(number: variables.selectCell![1])

            same_number_all()
            
            if settings.autocheckError == true {
                error_number_all() //красим ячейку с ошибкой
            }
        }
        
        if settings.sound == true {
            do {
                 audioPlayer = try AVAudioPlayer(contentsOf: tapSound)
                 audioPlayer.play()
            } catch {
               // couldn't load file :(
            }
        }
        errorLabelCount()

        collectionView.reloadData()
        if end_game_all() == true {
            if variables.levelGame == 0 {
                statistics.statisticEasyGamesCompleted += 1
                statistics.statisticEasyBestWinStreak += 1
                best_average_time_all(level: 0)
            } else if variables.levelGame == 1 {
                statistics.statisticAverageGamesCompleted += 1
                statistics.statisticAverageBestWinStreak += 1
                best_average_time_all(level: 1)
            } else if variables.levelGame == 2 {
                statistics.statisticHardGamesCompleted += 1
                statistics.statisticHardBestWinStreak += 1
                best_average_time_all(level: 2)
            } else if variables.levelGame == 3 {
                statistics.statisticExpertGamesCompleted += 1
                statistics.statisticExpertBestWinStreak += 1
                best_average_time_all(level: 3)
            }
            
            statistics_fill_all(level: variables.levelGame)
            variables.savedGame = false

            popUpEndGame()
        }
        
        if variables.countError > 2 {
            
            if variables.levelGame == 0 {
                 statistics.statisticEasyBestWinStreak = 0
             } else if variables.levelGame == 1 {
                 statistics.statisticAverageBestWinStreak = 0
             } else if variables.levelGame == 2 {
                 statistics.statisticHardBestWinStreak = 0
             } else if variables.levelGame == 3 {
                 statistics.statisticExpertBestWinStreak = 0
             }
            variables.savedGame = false

            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "9"
    //------------------------------------------------------//

    @IBAction func mainButton_9(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        if variables.selectCell != nil {
            
            

            
            resetting_the_selection_all()

            if variables.selectCell != nil {
            add_cancel_array_all(Number: variables.selectCell![1])
            }
            if variables.changeButtonNote == 0 {
                       if variables.selectCell != nil {
                           let a = variables.selectCell![1]
                           clear_help_all(number: a)
                           if mainArray.testArray[a][0] == "" {
                               mainArray.testArray[a][0] = "9"
                               mainArray.testArray[a][2] = "2"
                           } else if mainArray.testArray[a][0] == "9" && mainArray.testArray[a][2] == "2"  {
                               mainArray.testArray[a][0] = ""
                           } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                               mainArray.testArray[a][0] = "9"
                           }
                       }
                   } else if variables.changeButtonNote == 1 && mainArray.testArray[variables.selectCell![1]][0] == "" {
                       let a = variables.selectCell![1]
                       if variables.selectCell != nil && mainArray.testArray[a][12] == "" {
                           mainArray.testArray[a][12] = "9"
                       } else if variables.selectCell != nil && mainArray.testArray[a][12] == "9" {
                           mainArray.testArray[a][12] = ""
                           mainArray.testArray[a][0] = ""
                       }
                   }
            
            delete_note_all(number: variables.selectCell![1])

            same_number_all()
            
            if settings.autocheckError == true {
                error_number_all() //красим ячейку с ошибкой
            }
            
            
            
        }
        
        if settings.sound == true {
            do {
                 audioPlayer = try AVAudioPlayer(contentsOf: tapSound)
                 audioPlayer.play()
            } catch {
               // couldn't load file :(
            }
        }

        
        errorLabelCount()
        

        collectionView.reloadData()
        if end_game_all() == true {
            if variables.levelGame == 0 {
                statistics.statisticEasyGamesCompleted += 1
                statistics.statisticEasyBestWinStreak += 1
                best_average_time_all(level: 0)
            } else if variables.levelGame == 1 {
                statistics.statisticAverageGamesCompleted += 1
                statistics.statisticAverageBestWinStreak += 1
                best_average_time_all(level: 1)
            } else if variables.levelGame == 2 {
                statistics.statisticHardGamesCompleted += 1
                statistics.statisticHardBestWinStreak += 1
                best_average_time_all(level: 2)
            } else if variables.levelGame == 3 {
                statistics.statisticExpertGamesCompleted += 1
                statistics.statisticExpertBestWinStreak += 1
                best_average_time_all(level: 3)
            }
            
            statistics_fill_all(level: variables.levelGame)
            variables.savedGame = false

            popUpEndGame()
        }
        
        if variables.countError > 2 {
            
            if variables.levelGame == 0 {
                 statistics.statisticEasyBestWinStreak = 0
             } else if variables.levelGame == 1 {
                 statistics.statisticAverageBestWinStreak = 0
             } else if variables.levelGame == 2 {
                 statistics.statisticHardBestWinStreak = 0
             } else if variables.levelGame == 3 {
                 statistics.statisticExpertBestWinStreak = 0
             }
            variables.savedGame = false

            popUpEndGame()
        }
        
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка "Отменить"
    //------------------------------------------------------//

    
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    @IBAction func cancelButton(_ sender: Any) {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        if variables.selectCell != nil {
            cancel_all()
        }
        
        
            collectionView.reloadData()
            saveData()
        MSAnalytics.trackEvent("Кнопки: Отмена")

    }
    
    //------------------------------------------------------//
    //Кнопка "Удалить"
    //------------------------------------------------------//

    @IBOutlet weak var removeButtonOutlet: UIButton!
    @IBAction func removeButton(_ sender: Any) {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        if variables.selectCell?[1] != nil {
            let a = variables.selectCell![1]
            if a != nil && mainArray.testArray[a][2] == "2" {
                mainArray.testArray[a][0] = ""

                collectionView.reloadData()
                saveData()
            }
            if a != nil && mainArray.testArray[a][3] == "1" {
                mainArray.testArray[a][4] = ""
                mainArray.testArray[a][5] = ""
                mainArray.testArray[a][6] = ""
                mainArray.testArray[a][7] = ""
                mainArray.testArray[a][8] = ""
                mainArray.testArray[a][9] = ""
                mainArray.testArray[a][10] = ""
                mainArray.testArray[a][11] = ""
                mainArray.testArray[a][12] = ""
                
                collectionView.reloadData()
                saveData()
            }
            
        }
        
        MSAnalytics.trackEvent("Кнопки: Удалить")

    }
    
    //------------------------------------------------------//
    //Кнопка "Заметка"
    //------------------------------------------------------//

    @IBOutlet weak var noteButtonOutlet: UIButton!
    @IBAction func noteButton(_ sender: Any) {
        if variables.changeButtonNote == 0 {
            (sender as AnyObject).setBackgroundImage(UIImage(named: "pencil-2"), for: UIControl.State.normal)
            variables.changeButtonNote = 1
        } else {
            (sender as AnyObject).setBackgroundImage(UIImage(named: "pencil"), for: UIControl.State.normal)
            variables.changeButtonNote = 0
        }
        
        MSAnalytics.trackEvent("Кнопки: Заметка")

    }
    
    //------------------------------------------------------//
    //Кнопка "Подсказка"
    //------------------------------------------------------//

    @IBOutlet weak var helpButtonOutlet: UIButton!
    @IBAction func helpButton(_ sender: Any) {
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        help_all()
        
        if end_game_all() == true {
            if variables.levelGame == 0 {
                statistics.statisticEasyGamesCompleted += 1
                statistics.statisticEasyBestWinStreak += 1
                best_average_time_all(level: 0)
            } else if variables.levelGame == 1 {
                statistics.statisticAverageGamesCompleted += 1
                statistics.statisticAverageBestWinStreak += 1
                best_average_time_all(level: 1)
            } else if variables.levelGame == 2 {
                statistics.statisticHardGamesCompleted += 1
                statistics.statisticHardBestWinStreak += 1
                best_average_time_all(level: 2)
            } else if variables.levelGame == 3 {
                statistics.statisticExpertGamesCompleted += 1
                statistics.statisticExpertBestWinStreak += 1
                best_average_time_all(level: 3)
            }
            
            statistics_fill_all(level: variables.levelGame)
            variables.savedGame = false

            popUpEndGame()
        }
        
        MSAnalytics.trackEvent("Кнопки: Подсказка")

        if variables.selectCell != nil {
            delete_note_all(number: variables.selectCell![1])
        }
        
        saveData()
        collectionView.reloadData()
    }
    
    
    //------------------------------------------------------//
    //Таймер
    //------------------------------------------------------//

    @IBOutlet weak var labelTimer: UILabel!
    var counterS = variables.countSec
    var counterM = variables.countMin
    var timerS = Timer()

    @objc func timerAction() {
        
        if counterS >= 59 && counterM < 10 {
            counterM += 1
            labelTimer.text = "0\(counterM):00"
            counterS = 0
        } else if counterS >= 59 && counterM >= 10 {
            counterM += 1
            labelTimer.text = "\(counterM):00"
            counterS = 0
        } else if counterS < 10 && counterM < 10 {
            labelTimer.text = "0\(counterM):0\(counterS)"
            counterS += 1
        } else if counterS < 10 && counterM > 9 {
            labelTimer.text = "\(counterM):0\(counterS)"
            counterS += 1
        } else if counterS >= 10 && counterM < 10 {
            labelTimer.text = "0\(counterM):\(counterS)"
            counterS += 1
        } else if counterS >= 10 && counterM >= 10 {
            labelTimer.text = "\(counterM):\(counterS)"
            counterS += 1
        }
        
        variables.countMin = counterM
        variables.countSec = counterS
        saveData()
     }
    func timerSec () {
        timerS.invalidate()
        counterS = variables.countSec
        timerS = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    

    //------------------------------------------------------//


}



    //------------------------------------------------------//
    //Создание и заполнение ячеек игрового поля
    //------------------------------------------------------//

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainArray.testArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MainCollectionViewCell {
        
            
           note_count_add_or_remove()
            
            itemCell.nameLabel.font = UIFont.systemFont(ofSize: 25)
            
            if mainArray.testArray[indexPath.row][3] == "0" {
                itemCell.nameLabel.text = mainArray.testArray[indexPath.row][0]
                itemCell.miniNameLabel_1.text = ""
                itemCell.miniNameLabel_2.text = ""
                itemCell.miniNameLabel_3.text = ""
                itemCell.miniNameLabel_4.text = ""
                itemCell.miniNameLabel_5.text = ""
                itemCell.miniNameLabel_6.text = ""
                itemCell.miniNameLabel_7.text = ""
                itemCell.miniNameLabel_8.text = ""
                itemCell.miniNameLabel_9.text = ""
            }  else {
                itemCell.nameLabel.text = ""
                itemCell.miniNameLabel_1.text = mainArray.testArray[indexPath.row][4]
                itemCell.miniNameLabel_2.text = mainArray.testArray[indexPath.row][5]
                itemCell.miniNameLabel_3.text = mainArray.testArray[indexPath.row][6]
                itemCell.miniNameLabel_4.text = mainArray.testArray[indexPath.row][7]
                itemCell.miniNameLabel_5.text = mainArray.testArray[indexPath.row][8]
                itemCell.miniNameLabel_6.text = mainArray.testArray[indexPath.row][9]
                itemCell.miniNameLabel_7.text = mainArray.testArray[indexPath.row][10]
                itemCell.miniNameLabel_8.text = mainArray.testArray[indexPath.row][11]
                itemCell.miniNameLabel_9.text = mainArray.testArray[indexPath.row][12]

            }

 //Скрытие ячеек при паузе
            
            if variables.hiddenCell == true {
                itemCell.nameLabel.text = ""
                itemCell.miniNameLabel_1.text = ""
                itemCell.miniNameLabel_2.text = ""
                itemCell.miniNameLabel_3.text = ""
                itemCell.miniNameLabel_4.text = ""
                itemCell.miniNameLabel_5.text = ""
                itemCell.miniNameLabel_6.text = ""
                itemCell.miniNameLabel_7.text = ""
                itemCell.miniNameLabel_8.text = ""
                itemCell.miniNameLabel_9.text = ""
            }
            
            
//Кастомные границы ячейки
// 0 - нет границ 1 - нижная 2 - правая 3 - нижная и правая 4 - верхная и левая 5 - верхная 6 - левая 7 - верхная и правая 8 - левая и нижная
           //   let miniBorderColor: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
            var miniBorderColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
              if mainArray.borderArray[indexPath.row] == 0 {
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: miniBorderColor, thickness: 0.3)
              } else if mainArray.borderArray[indexPath.row] == 1 {
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 1)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: miniBorderColor, thickness: 0.3)
              } else if mainArray.borderArray[indexPath.row] == 2 {
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: UIColor.black, thickness: 1)
              } else if mainArray.borderArray[indexPath.row] == 3 {
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 1)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: UIColor.black, thickness: 1)
              } else if mainArray.borderArray[indexPath.row] == 4 {
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.black, thickness: 1)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: UIColor.black, thickness: 1)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: miniBorderColor, thickness: 0.3)
              } else if mainArray.borderArray[indexPath.row] == 5 {
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.black, thickness: 1)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: miniBorderColor, thickness: 0.3)
              } else if mainArray.borderArray[indexPath.row] == 6 {
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: UIColor.black, thickness: 1)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: miniBorderColor, thickness: 0.3)
              } else if mainArray.borderArray[indexPath.row] == 7 {
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.black, thickness: 1)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: UIColor.black, thickness: 1)
              } else if mainArray.borderArray[indexPath.row] == 8 {
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: miniBorderColor, thickness: 0.3)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 1)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: UIColor.black, thickness: 1)
                  itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: miniBorderColor, thickness: 0.3)
              }


           
            
            //Заполнение цветом ячеек
            
            if mainArray.testArray[indexPath.row][1] == "1" {
                if settings.nightMode == false {
                    itemCell.layer.backgroundColor = variables.color1
                } else {
                    itemCell.layer.backgroundColor = variables.color1night
                }
            } else if mainArray.testArray[indexPath.row][1] == "2" {
                if settings.nightMode == false {
                    itemCell.layer.backgroundColor = variables.color2
                } else {
                    itemCell.layer.backgroundColor = variables.color2night
                }
            } else if mainArray.testArray[indexPath.row][1] == "3" {
                if settings.nightMode == false {
                    itemCell.layer.backgroundColor = variables.color3
                } else {
                    itemCell.layer.backgroundColor = variables.color3night
                }
            } else if mainArray.testArray[indexPath.row][1] == "4" {
                if settings.nightMode == false {
                    itemCell.layer.backgroundColor = variables.color4
                } else {
                    itemCell.layer.backgroundColor = variables.color4night
                }
            } else if mainArray.testArray[indexPath.row][1] == "5" {
                if settings.nightMode == false {
                    itemCell.layer.backgroundColor = variables.color7
                } else {
                    itemCell.layer.backgroundColor = variables.color7night
                }
            }

            //Цвет текста

            if mainArray.testArray[indexPath.row][2] == "1" {
                if settings.nightMode == false {
                    itemCell.nameLabel.textColor = variables.color5
                } else {
                    itemCell.nameLabel.textColor = variables.color5night
                }
            } else if mainArray.testArray[indexPath.row][2] == "2" {
                    if settings.nightMode == false {
                        itemCell.nameLabel.textColor = variables.color6
                    } else {
                        itemCell.nameLabel.textColor = variables.color6night
                    }
        }

            let screenWidth = UIScreen.main.bounds.width

            let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 0
            layout?.minimumInteritemSpacing = 0


            switch screenWidth {
            case 375:
                layout?.itemSize.width = 40
                layout?.itemSize.height = 40
                collectionView.frame.size.width = 360
                collectionView.frame.size.height = 360
                itemCell.nameLabel.font.withSize(35)
            case 320:
                layout?.itemSize.width = 33
                layout?.itemSize.height = 33
                collectionView.frame.size.width = 297
                collectionView.frame.size.height = 297
                itemCell.nameLabel.font.withSize(18)
                itemCell.miniNameLabel_1.font.withSize(5)
                itemCell.miniNameLabel_2.font.withSize(5)
                itemCell.miniNameLabel_3.font.withSize(5)
                itemCell.miniNameLabel_4.font.withSize(5)
                itemCell.miniNameLabel_5.font.withSize(5)
                itemCell.miniNameLabel_6.font.withSize(5)
                itemCell.miniNameLabel_7.font.withSize(5)
                itemCell.miniNameLabel_8.font.withSize(5)
                itemCell.miniNameLabel_9.font.withSize(5)

                itemCell.miniNameLabel_1.frame = CGRect(x: 0, y: 0, width: 11, height: 11)
                itemCell.miniNameLabel_2.frame = CGRect(x: 11, y: 0, width: 11, height: 11)
                itemCell.miniNameLabel_3.frame = CGRect(x: 22, y: 0, width: 11, height: 11)
                itemCell.miniNameLabel_4.frame = CGRect(x: 0, y: 11, width: 11, height: 11)
                itemCell.miniNameLabel_5.frame = CGRect(x: 11, y: 11, width: 11, height: 11)
                itemCell.miniNameLabel_6.frame = CGRect(x: 22, y: 11, width: 11, height: 11)
                itemCell.miniNameLabel_7.frame = CGRect(x: 0, y: 22, width: 11, height: 11)
                itemCell.miniNameLabel_8.frame = CGRect(x: 11, y: 22, width: 11, height: 11)
                itemCell.miniNameLabel_9.frame = CGRect(x: 22, y: 22, width: 11, height: 11)

                itemCell.nameLabel.frame.size.width = 33
                itemCell.nameLabel.frame.size.height = 33
            case 414:
                layout?.itemSize.width = 40
                layout?.itemSize.height = 40
                collectionView.frame.size.width = 360
                collectionView.frame.size.height = 360
                itemCell.nameLabel.font.withSize(30)
            default:
                   break
            }
            return itemCell

        }

        
        return UICollectionViewCell()
    }
    
    
    //------------------------------------------------------//
    //Действие при тапе по ячейке новое
    //------------------------------------------------------//


    @IBAction private func panHandler(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            print("panHundler began")
            
            //   Таптик отклик
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
            
                let path = collectionView.indexPathForItem(at: recognizer.location(in: collectionView))

                if path != nil {
                    variables.selectCell = path //получаем адрес выделенной ячейки

                //Красим выделенную ячейку
                let a = variables.selectCell![1]
                var i = 0
                repeat {
                    if i != a {
                        mainArray.testArray[i][1] = "1"
                    } else {
                        mainArray.testArray[a][1] = "2"
                    }
                        i += 1
                } while i <= 80

                //Закрашиваем области
                select_line_and_area_all(number: a) //выделяем сектор, линии по горизонтале и вертикале
                same_number_all()
                collectionView.reloadData()
                saveData()
            }
            
        case .changed:
            
            let path = collectionView.indexPathForItem(at: recognizer.location(in: collectionView))
          //  print("path: ", path)

            if path != nil {
                variables.selectCell = path //получаем адрес выделенной ячейки
                //Красим выделенную ячейку
                let a = variables.selectCell![1]
                var i = 0
                    repeat {
                        if i != a {
                            mainArray.testArray[i][1] = "1"
                        } else {
                            mainArray.testArray[a][1] = "2"
                        }
                            i += 1
                    } while i <= 80
                
                //Закрашиваем области
                select_line_and_area_all(number: a) //выделяем сектор, линии по горизонтале и вертикале
                same_number_all()
                collectionView.reloadData()
                saveData()
            }
  
        case .ended:
            print("panHundler ended")
        default:
            print("panHundler any other state")
        }
    }
    
    
    //------------------------------------------------------//
    //Действие при тапе по ячейке
    //------------------------------------------------------//
    //didSelectItemAt didHighlightItemAt
    
    func collectionView (_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        //   Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        

            variables.selectCell = indexPath //получаем адрес выделенной ячейки

            //Красим выделенную ячейку
            let a = variables.selectCell![1]
            var i = 0
            repeat {
                if i != a {
                    mainArray.testArray[i][1] = "1"
                } else {
                    mainArray.testArray[a][1] = "2"
                }
                    i += 1
            } while i <= 80

            //Закрашиваем области
            select_line_and_area_all(number: a) //выделяем сектор, линии по горизонтале и вертикале
            same_number_all()
            collectionView.reloadData()
            saveData()
    }
        
    //------------------------------------------------------//


    
    
    
    
    
    //------------------------------------------------------//
    //Создание поп-апа при завершении игры
    //------------------------------------------------------//

    
    func popUpEndGame() {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpVCid") as! PopUpViewController //Мы получаем ссылку на PopUpViewController, причем получаем ссылку мы при помощи метода, который обращается к StoryBoard и находит контроллер, у которого идентификатор popUpVCid.
        self.addChild(popUpVC) //Добавляем полученный контроллер PopUpViewController в качестве дочернего к ViewController
        popUpVC.view.frame = self.view.frame  // Размеры View нового контроллера мы устанавливаем равными размера View текущего контроллера.
        self.view.addSubview(popUpVC.view) //Непосредственно выводим на экран то,  как отображается PopUpViewController. Т.е. добавляем View PopUpViewController в стек той кучи View, которые уже есть.
        popUpVC.didMove(toParent: self) //Вызываем метод делегата, чтобы сообщить всем делегатам, о том, что контроллер мы отобразили.
        MSAnalytics.trackEvent("Игра завершена")
        mainArray.oldCancelArray = [[]]
    }
    
    //------------------------------------------------------//

    func StopGame() {
        let popUpStop = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpStopid") as! StopGameViewController //Мы получаем ссылку на PopUpViewController, причем получаем ссылку мы при помощи метода, который обращается к StoryBoard и находит контроллер, у которого идентификатор popUpVCid.
        self.addChild(popUpStop) //Добавляем полученный контроллер PopUpViewController в качестве дочернего к ViewController
        popUpStop.view.frame = self.view.frame  // Размеры View нового контроллера мы устанавливаем равными размера View текущего контроллера.
        self.view.addSubview(popUpStop.view) //Непосредственно выводим на экран то,  как отображается PopUpViewController. Т.е. добавляем View PopUpViewController в стек той кучи View, которые уже есть.
        popUpStop.didMove(toParent: self) //Вызываем метод делегата, чтобы сообщить всем делегатам, о том, что контроллер мы отобразили.
        }

    func errorLabelCount () {
        errorLabel.text = "\(NSLocalizedString("error_label", comment: "")) \(variables.countError)/3"
        if settings.errorLimit == true {
            errorLabel.isHidden = false
        } else if settings.errorLimit == false {
            errorLabel.isHidden = true
        }
        
    }
    
    
    
    func sizeViewButton () {
        errorLabel.text = NSLocalizedString("error_label", comment: "")
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        switch screenWidth {
        case 375: //6
            if screenHeight == 667 { //6
                self.errorLabel.frame = CGRect(x: 127, y: 70, width: 120, height: 20)
                self.labelTimer.frame = CGRect(x: 285, y: 70, width: 120, height: 20)
                self.stopGameButtonOutlet.frame = CGRect(x: 340, y: 73, width: 15, height: 15)
                self.collectionView.frame = CGRect(x: 7, y: 95, width: 360, height: 360) // Игровое поле
                self.levelDifficultyLabel.frame = CGRect(x: 17, y: 70, width: 120, height: 20)
                
                self.cancelButtonOutlet.frame = CGRect(x: 47, y: 470, width: 35, height: 35) // Кнопка "Отменить"
                self.removeButtonOutlet.frame = CGRect(x: 129, y: 470, width: 35, height: 35) // Кнопка "Удалить"
                self.noteButtonOutlet.frame = CGRect(x: 211, y: 470, width: 35, height: 35)
                self.helpButtonOutlet.frame = CGRect(x: 293, y: 470, width: 35, height: 35)
                
                self.cancelButtonOutletLabel.frame = CGRect(x: 28, y: 512, width: 77, height: 40)
                self.removeButtonOutletLabel.frame = CGRect(x: 108, y: 512, width: 77, height: 40)
                self.noteButtonOutletLabel.frame = CGRect(x: 189, y: 512, width: 77, height: 40)
                self.helpButtonOutletLabel.frame = CGRect(x: 273, y: 512, width: 77, height: 40)
                
                self.mainButton_1_Outlet.frame = CGRect(x: 3, y: 555, width: 41, height: 60)
                self.mainButton_2_Outlet.frame = CGRect(x: 44, y: 555, width: 41, height: 60)
                self.mainButton_3_Outlet.frame = CGRect(x: 85, y: 555, width: 41, height: 60)
                self.mainButton_4_Outlet.frame = CGRect(x: 126, y: 555, width: 41, height: 60)
                self.mainButton_5_Outlet.frame = CGRect(x: 167, y: 555, width: 41, height: 60)
                self.mainButton_6_Outlet.frame = CGRect(x: 208, y: 555, width: 41, height: 60)
                self.mainButton_7_Outlet.frame = CGRect(x: 249, y: 555, width: 41, height: 60)
                self.mainButton_8_Outlet.frame = CGRect(x: 290, y: 555, width: 41, height: 60)
                self.mainButton_9_Outlet.frame = CGRect(x: 331, y: 555, width: 41, height: 60)
                
            } else if screenHeight == 812 { //X

                self.errorLabel.frame = CGRect(x: 120, y: 90, width: 135, height: 20)
                self.labelTimer.frame = CGRect(x: 295, y: 90, width: 120, height: 20)
                self.stopGameButtonOutlet.frame = CGRect(x: 350, y: 93, width: 15, height: 15)
                
                self.mainButton_1_Outlet.frame = CGRect(x: 3, y: 595, width: 41, height: 60)
                self.mainButton_2_Outlet.frame = CGRect(x: 44, y: 595, width: 41, height: 60)
                self.mainButton_3_Outlet.frame = CGRect(x: 85, y: 595, width: 41, height: 60)
                self.mainButton_4_Outlet.frame = CGRect(x: 126, y: 595, width: 41, height: 60)
                self.mainButton_5_Outlet.frame = CGRect(x: 167, y: 595, width: 41, height: 60)
                self.mainButton_6_Outlet.frame = CGRect(x: 208, y: 595, width: 41, height: 60)
                self.mainButton_7_Outlet.frame = CGRect(x: 249, y: 595, width: 41, height: 60)
                self.mainButton_8_Outlet.frame = CGRect(x: 290, y: 595, width: 41, height: 60)
                self.mainButton_9_Outlet.frame = CGRect(x: 331, y: 595, width: 41, height: 60)
            } else {
                self.cancelButtonOutlet.frame = CGRect(x: 27, y: 508, width: 40, height: 40)

            }
        case 320: //SE
            self.collectionView.frame = CGRect(x: 10, y: 95, width: 297, height: 297) // Игровое поле
            
            self.cancelButtonOutlet.frame = CGRect(x: 25, y: 410, width: 40, height: 40) // Кнопка "Отменить"
            self.removeButtonOutlet.frame = CGRect(x: 102, y: 410, width: 40, height: 40) // Кнопка "Удалить"
            self.noteButtonOutlet.frame = CGRect(x: 180, y: 410, width: 40, height: 40)
            self.helpButtonOutlet.frame = CGRect(x: 260, y: 410, width: 40, height: 40)
            
            self.cancelButtonOutletLabel.frame = CGRect(x: 0, y: 445, width: 100, height: 40)
            self.removeButtonOutletLabel.frame = CGRect(x: 78, y: 445, width: 100, height: 40)
            self.noteButtonOutletLabel.frame = CGRect(x: 155, y: 445, width: 100, height: 40)
            self.helpButtonOutletLabel.frame = CGRect(x: 230, y: 445, width: 100, height: 40)
            
            self.mainButton_1_Outlet.frame = CGRect(x: 0, y: 490, width: 40, height: 40)
            self.mainButton_2_Outlet.frame = CGRect(x: 35, y: 490, width: 40, height: 40)
            self.mainButton_3_Outlet.frame = CGRect(x: 70, y: 490, width: 40, height: 40)
            self.mainButton_4_Outlet.frame = CGRect(x: 105, y: 490, width: 40, height: 40)
            self.mainButton_5_Outlet.frame = CGRect(x: 140, y: 490, width: 40, height: 40)
            self.mainButton_6_Outlet.frame = CGRect(x: 175, y: 490, width: 40, height: 40)
            self.mainButton_7_Outlet.frame = CGRect(x: 210, y: 490, width: 40, height: 40)
            self.mainButton_8_Outlet.frame = CGRect(x: 245, y: 490, width: 40, height: 40)
            self.mainButton_9_Outlet.frame = CGRect(x: 280, y: 490, width: 40, height: 40)
        case 414:
            if screenHeight == 736 { //7 plus
                self.errorLabel.frame = CGRect(x: 147, y: 70, width: 120, height: 20)
                self.labelTimer.frame = CGRect(x: 330, y: 70, width: 120, height: 20)
                self.stopGameButtonOutlet.frame = CGRect(x: 390, y: 73, width: 15, height: 15)
                self.levelDifficultyLabel.frame = CGRect(x: 17, y: 70, width: 120, height: 20)

                
                self.collectionView.frame = CGRect(x: 27, y: 100, width: 360, height: 360) // Игровое поле
                
                self.cancelButtonOutlet.frame = CGRect(x: 70, y: 485, width: 35, height: 35) // Кнопка "Отменить"
                self.removeButtonOutlet.frame = CGRect(x: 153, y: 485, width: 38, height: 38) // Кнопка "Удалить"
                self.noteButtonOutlet.frame = CGRect(x: 235, y: 485, width: 35, height: 35)
                self.helpButtonOutlet.frame = CGRect(x: 315, y: 485, width: 35, height: 35)
                
                self.cancelButtonOutletLabel.frame = CGRect(x: 40, y: 527, width: 100, height: 40)
                self.removeButtonOutletLabel.frame = CGRect(x: 125, y: 527, width: 100, height: 40)
                self.noteButtonOutletLabel.frame = CGRect(x: 205, y: 527, width: 100, height: 40)
                self.helpButtonOutletLabel.frame = CGRect(x: 286, y: 527, width: 100, height: 40)
                
                self.mainButton_1_Outlet.frame = CGRect(x: 25, y: 578, width: 40, height: 40)
                self.mainButton_2_Outlet.frame = CGRect(x: 65, y: 578, width: 40, height: 40)
                self.mainButton_3_Outlet.frame = CGRect(x: 105, y: 578, width: 40, height: 40)
                self.mainButton_4_Outlet.frame = CGRect(x: 145, y: 578, width: 40, height: 40)
                self.mainButton_5_Outlet.frame = CGRect(x: 185, y: 578, width: 40, height: 40)
                self.mainButton_6_Outlet.frame = CGRect(x: 225, y: 578, width: 40, height: 40)
                self.mainButton_7_Outlet.frame = CGRect(x: 265, y: 578, width: 40, height: 40)
                self.mainButton_8_Outlet.frame = CGRect(x: 305, y: 578, width: 40, height: 40)
                self.mainButton_9_Outlet.frame = CGRect(x: 345, y: 578, width: 40, height: 40)
                
            } else if screenHeight == 896 { //XS Max

                self.collectionView.frame = CGRect(x: 27, y: 125, width: 360, height: 360)

                self.cancelButtonOutlet.frame = CGRect(x: 67, y: 505, width: 40, height: 40) // Кнопка "Отменить"
                self.removeButtonOutlet.frame = CGRect(x: 150, y: 505, width: 40, height: 40) // Кнопка "Удалить"
                self.noteButtonOutlet.frame = CGRect(x: 235, y: 505, width: 40, height: 40)
                self.helpButtonOutlet.frame = CGRect(x: 315, y: 505, width: 40, height: 40)
                
                self.cancelButtonOutletLabel.frame = CGRect(x: 42, y: 547, width: 100, height: 40)
                self.removeButtonOutletLabel.frame = CGRect(x: 122, y: 547, width: 100, height: 40)
                self.noteButtonOutletLabel.frame = CGRect(x: 200, y: 547, width: 100, height: 40)
                self.helpButtonOutletLabel.frame = CGRect(x: 285, y: 547, width: 100, height: 40)
                
                self.mainButton_1_Outlet.frame = CGRect(x: 25, y: 600, width: 40, height: 40)
                self.mainButton_2_Outlet.frame = CGRect(x: 65, y: 600, width: 40, height: 40)
                self.mainButton_3_Outlet.frame = CGRect(x: 105, y: 600, width: 40, height: 40)
                self.mainButton_4_Outlet.frame = CGRect(x: 145, y: 600, width: 40, height: 40)
                self.mainButton_5_Outlet.frame = CGRect(x: 185, y: 600, width: 40, height: 40)
                self.mainButton_6_Outlet.frame = CGRect(x: 225, y: 600, width: 40, height: 40)
                self.mainButton_7_Outlet.frame = CGRect(x: 265, y: 600, width: 40, height: 40)
                self.mainButton_8_Outlet.frame = CGRect(x: 305, y: 600, width: 40, height: 40)
                self.mainButton_9_Outlet.frame = CGRect(x: 345, y: 600, width: 40, height: 40)
                
            } else {
                self.collectionView.frame = CGRect(x: 27, y: 125, width: 360, height: 360)

            }
            
            
        default:
            break
        }
        collectionView.reloadData()
    }
    
}


