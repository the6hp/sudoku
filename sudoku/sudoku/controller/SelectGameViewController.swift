import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

class SelectGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionSelectGameView.dataSource = self
        collectionSelectGameView.delegate = self
                
        segmentListGame.setTitle(NSLocalizedString("segment_easy_level", comment: ""), forSegmentAt: 0)
        segmentListGame.setTitle(NSLocalizedString("segment_medium_level", comment: ""), forSegmentAt: 1)
        segmentListGame.setTitle(NSLocalizedString("segment_hard_level", comment: ""), forSegmentAt: 2)
        segmentListGame.setTitle(NSLocalizedString("segment_expert_level", comment: ""), forSegmentAt: 3)
        
        //Убираем текст кнопки "Назад"
        self.navigationItem.backBarButtonItem?.title = ""
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBOutlet weak var collectionSelectGameView: UICollectionView!
    @IBOutlet weak var segmentListGame: UISegmentedControl!
    
    
    @IBAction func segmentActionListGame(_ sender: Any) {
        switch segmentListGame.selectedSegmentIndex
               {
               case 0:
                listArray.defoultListGameLevel = 0
                collectionSelectGameView.reloadData()
                variables.selectedDifficulty = 0
                variables.levelGame = 0
               case 1:
                listArray.defoultListGameLevel = 1
                collectionSelectGameView.reloadData()
                variables.selectedDifficulty = 1
                variables.levelGame = 1
               case 2:
                listArray.defoultListGameLevel = 2
                collectionSelectGameView.reloadData()
                variables.selectedDifficulty = 2
                variables.levelGame = 2
               case 3:
                listArray.defoultListGameLevel = 3
                collectionSelectGameView.reloadData()
                variables.selectedDifficulty = 3
                variables.levelGame = 3
               default:
                   break
               }
            }
}


extension SelectGameViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if listArray.defoultListGameLevel == 0 {
            return listArray.listEasyGame.count
        } else if listArray.defoultListGameLevel == 1 {
            return listArray.listAverageGame.count
        } else if listArray.defoultListGameLevel == 2 {
            return listArray.listHardGame.count
        } else if listArray.defoultListGameLevel == 3 {
            return listArray.listExpertGame.count
        } else {
            return listArray.listEasyGame.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCellSelectGame = collectionView.dequeueReusableCell(withReuseIdentifier: "selectGameCell", for: indexPath) as? SelectGameCollectionViewCell {
            
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            
            let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 10
            layout?.minimumInteritemSpacing = 1
            
            layout?.itemSize.width = 80
            layout?.itemSize.height = 80
            
            itemCellSelectGame.selectGameCellLabel.frame.size.width = 80
            itemCellSelectGame.selectGameCellLabel.frame.size.height = 80
            
            
            if listArray.defoultListGameLevel == 0 {
                itemCellSelectGame.selectGameCellLabel.text = String(listArray.listEasyGame[indexPath.row][0][0])
            } else if listArray.defoultListGameLevel == 1 {
                itemCellSelectGame.selectGameCellLabel.text = String(listArray.listAverageGame[indexPath.row][0][0])
            } else if listArray.defoultListGameLevel == 2 {
                itemCellSelectGame.selectGameCellLabel.text = String(listArray.listHardGame[indexPath.row][0][0])
            } else if listArray.defoultListGameLevel == 3 {
                itemCellSelectGame.selectGameCellLabel.text = String(listArray.listExpertGame[indexPath.row][0][0])
            }
            
            
            var timeGameLabel: String = ""
            
            if variables.selectedDifficulty == 0 {
                if listArray.listEasyGame[indexPath.row][0][1] == 0 && listArray.listEasyGame[indexPath.row][0][2] == 0 {
                    timeGameLabel = ""
                } else if listArray.listEasyGame[indexPath.row][0][2] < 10 && listArray.listEasyGame[indexPath.row][0][1] < 10 {
                    timeGameLabel = "0\(listArray.listEasyGame[indexPath.row][0][1]):0\(listArray.listEasyGame[indexPath.row][0][2])"
                } else if listArray.listEasyGame[indexPath.row][0][2] > 10 && listArray.listEasyGame[indexPath.row][0][1] < 10 {
                    timeGameLabel = "0\(listArray.listEasyGame[indexPath.row][0][1]):\(listArray.listEasyGame[indexPath.row][0][2])"
                } else if listArray.listEasyGame[indexPath.row][0][2] < 10 && listArray.listEasyGame[indexPath.row][0][1] > 10 {
                    timeGameLabel = "\(listArray.listEasyGame[indexPath.row][0][1]):0\(listArray.listEasyGame[indexPath.row][0][2])"
                } else if listArray.listEasyGame[indexPath.row][0][2] > 10 && listArray.listEasyGame[indexPath.row][0][1] > 10 {
                    timeGameLabel = "\(listArray.listEasyGame[indexPath.row][0][1]):\(listArray.listEasyGame[indexPath.row][0][2])"
                }
            } else if variables.selectedDifficulty == 1 {
                if listArray.listAverageGame[indexPath.row][0][1] == 0 && listArray.listAverageGame[indexPath.row][0][2] == 0 {
                timeGameLabel = ""
                } else if listArray.listAverageGame[indexPath.row][0][2] < 10 && listArray.listAverageGame[indexPath.row][0][1] < 10 {
                    timeGameLabel = "0\(listArray.listAverageGame[indexPath.row][0][1]):0\(listArray.listAverageGame[indexPath.row][0][2])"
                } else if listArray.listAverageGame[indexPath.row][0][2] > 10 && listArray.listAverageGame[indexPath.row][0][1] < 10 {
                    timeGameLabel = "0\(listArray.listAverageGame[indexPath.row][0][1]):\(listArray.listAverageGame[indexPath.row][0][2])"
                } else if listArray.listAverageGame[indexPath.row][0][2] < 10 && listArray.listAverageGame[indexPath.row][0][1] > 10 {
                    timeGameLabel = "\(listArray.listAverageGame[indexPath.row][0][1]):0\(listArray.listAverageGame[indexPath.row][0][2])"
                } else if listArray.listAverageGame[indexPath.row][0][2] > 10 && listArray.listAverageGame[indexPath.row][0][1] > 10 {
                    timeGameLabel = "\(listArray.listAverageGame[indexPath.row][0][1]):\(listArray.listAverageGame[indexPath.row][0][2])"
                }
            } else if variables.selectedDifficulty == 2 {
                if listArray.listHardGame[indexPath.row][0][1] == 0 && listArray.listHardGame[indexPath.row][0][2] == 0 {
                timeGameLabel = ""
                } else if listArray.listHardGame[indexPath.row][0][2] < 10 && listArray.listHardGame[indexPath.row][0][1] < 10 {
                    timeGameLabel = "0\(listArray.listHardGame[indexPath.row][0][1]):0\(listArray.listHardGame[indexPath.row][0][2])"
                } else if listArray.listHardGame[indexPath.row][0][2] > 10 && listArray.listHardGame[indexPath.row][0][1] < 10 {
                    timeGameLabel = "0\(listArray.listHardGame[indexPath.row][0][1]):\(listArray.listHardGame[indexPath.row][0][2])"
                } else if listArray.listHardGame[indexPath.row][0][2] < 10 && listArray.listHardGame[indexPath.row][0][1] > 10 {
                    timeGameLabel = "\(listArray.listHardGame[indexPath.row][0][1]):0\(listArray.listHardGame[indexPath.row][0][2])"
                } else if listArray.listHardGame[indexPath.row][0][2] > 10 && listArray.listHardGame[indexPath.row][0][1] > 10 {
                    timeGameLabel = "\(listArray.listHardGame[indexPath.row][0][1]):\(listArray.listHardGame[indexPath.row][0][2])"
                }
            } else if variables.selectedDifficulty == 3 {
                if listArray.listExpertGame[indexPath.row][0][1] == 0 && listArray.listExpertGame[indexPath.row][0][2] == 0 {
                timeGameLabel = ""
                } else if listArray.listExpertGame[indexPath.row][0][2] < 10 && listArray.listExpertGame[indexPath.row][0][1] < 10 {
                    timeGameLabel = "0\(listArray.listExpertGame[indexPath.row][0][1]):0\(listArray.listExpertGame[indexPath.row][0][2])"
                } else if listArray.listExpertGame[indexPath.row][0][2] > 10 && listArray.listExpertGame[indexPath.row][0][1] < 10 {
                    timeGameLabel = "0\(listArray.listExpertGame[indexPath.row][0][1]):\(listArray.listExpertGame[indexPath.row][0][2])"
                } else if listArray.listExpertGame[indexPath.row][0][2] < 10 && listArray.listExpertGame[indexPath.row][0][1] > 10 {
                    timeGameLabel = "\(listArray.listExpertGame[indexPath.row][0][1]):0\(listArray.listExpertGame[indexPath.row][0][2])"
                } else if listArray.listExpertGame[indexPath.row][0][2] > 10 && listArray.listExpertGame[indexPath.row][0][1] > 10 {
                    timeGameLabel = "\(listArray.listExpertGame[indexPath.row][0][1]):\(listArray.listExpertGame[indexPath.row][0][2])"
                }
            }
    
            
            itemCellSelectGame.selectGameTimeLabel.text = timeGameLabel
            
            
            
            itemCellSelectGame.layer.borderWidth = 2
            itemCellSelectGame.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            itemCellSelectGame.layer.cornerRadius = 15
            
            collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            return itemCellSelectGame
        }
        return SelectGameCollectionViewCell()
    }
    
    
    //------------------------------------------------------//
    //Действие при тапе по ячейке
    //------------------------------------------------------//

    func collectionView (_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        //   Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
                
        self.tabBarController?.tabBar.isHidden = true
        
        variables.selectedLevel = indexPath.row
        
        //Сбрасываем всё
        mainArray.testArray = mainArray.defaultArray

        
        if variables.selectedDifficulty == 0 {
            //Подставляем массив решенного поля
            mainArray.endArray = listArray.listEasyGame[indexPath.row][2]
            //Переводим в string значения нерешенного поля
            mainArray.allNumbers_text = int_to_string_all(array: listArray.listEasyGame[indexPath.row][1])
        } else if variables.selectedDifficulty == 1 {
            mainArray.endArray = listArray.listAverageGame[indexPath.row][2]
            mainArray.allNumbers_text = int_to_string_all(array: listArray.listAverageGame[indexPath.row][1])
        } else if variables.selectedDifficulty == 2 {
            mainArray.endArray = listArray.listHardGame[indexPath.row][2]
            mainArray.allNumbers_text = int_to_string_all(array: listArray.listHardGame[indexPath.row][1])
        } else if variables.selectedDifficulty == 3 {
            mainArray.endArray = listArray.listExpertGame[indexPath.row][2]
            mainArray.allNumbers_text = int_to_string_all(array: listArray.listExpertGame[indexPath.row][1])
        }

        
        delete_0_all()
        
        //Перемещаем все значения поля в mainArray.testArray
        fill_array_all()
        
        variables.savedGame = true
        statistics.statisticsEasyGamesPlayed += 1
        statistics_fill_all(level: 0)
        variables.countError = 0
        variables.countSec = 0
        variables.countMin = 0
        mainArray.oldCancelArray = [[]]
        
        saveData()
        
        MSAnalytics.trackEvent("Выбор игры из списка")
            
        let newController = self.storyboard!.instantiateViewController(withIdentifier: "mainGameView")
        self.navigationController!.pushViewController(newController, animated : true)

    }
        
    //------------------------------------------------------//
    
}



