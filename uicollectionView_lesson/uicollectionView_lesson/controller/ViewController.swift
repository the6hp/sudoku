import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func test_button(_ sender: Any) {
        fill_array_all()
        collectionView.reloadData()
        saveData()
    }

    //------------------------------------------------------//
    //Кнопка с цифрой "1"
    //------------------------------------------------------//

    @IBAction func mainButton_1(_ sender: Any) {
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
        } else {
            let a = variables.selectCell![1]
            if variables.selectCell != nil && mainArray.testArray[a][4] == "" {
                mainArray.testArray[a][4] = "1"
            } else if variables.selectCell != nil && mainArray.testArray[a][4] == "1" {
                mainArray.testArray[a][4] = ""
                mainArray.testArray[a][0] = ""
            }
        }
        same_number_all()
        collectionView.reloadData()
        if end_game_all() == true {
            popUpEndGame()
        }
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "2"
    //------------------------------------------------------//

    @IBAction func mainButton_2(_ sender: Any) {
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
               } else {
                   let a = variables.selectCell![1]
                   if variables.selectCell != nil && mainArray.testArray[a][5] == "" {
                       mainArray.testArray[a][5] = "2"
                   } else if variables.selectCell != nil && mainArray.testArray[a][5] == "2" {
                       mainArray.testArray[a][5] = ""
                       mainArray.testArray[a][0] = ""
                   }
               }
        same_number_all()
        collectionView.reloadData()
        if end_game_all() == true {
            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "3"
    //------------------------------------------------------//

    @IBAction func mainButton_3(_ sender: Any) {
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
               } else {
                   let a = variables.selectCell![1]
                   if variables.selectCell != nil && mainArray.testArray[a][6] == "" {
                       mainArray.testArray[a][6] = "3"
                   } else if variables.selectCell != nil && mainArray.testArray[a][6] == "3" {
                       mainArray.testArray[a][6] = ""
                       mainArray.testArray[a][0] = ""
                   }
               }
        same_number_all()
        collectionView.reloadData()
        if end_game_all() == true {
            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "4"
    //------------------------------------------------------//

    @IBAction func mainButton_4(_ sender: Any) {
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
               } else {
                   let a = variables.selectCell![1]
                   if variables.selectCell != nil && mainArray.testArray[a][7] == "" {
                       mainArray.testArray[a][7] = "4"
                   } else if variables.selectCell != nil && mainArray.testArray[a][7] == "4" {
                       mainArray.testArray[a][7] = ""
                       mainArray.testArray[a][0] = ""
                   }
               }
        same_number_all()
        collectionView.reloadData()
        if end_game_all() == true {
            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "5"
    //------------------------------------------------------//

    @IBAction func mainButton_5(_ sender: Any) {
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
               } else {
                   let a = variables.selectCell![1]
                   if variables.selectCell != nil && mainArray.testArray[a][8] == "" {
                       mainArray.testArray[a][8] = "5"
                   } else if variables.selectCell != nil && mainArray.testArray[a][8] == "5" {
                       mainArray.testArray[a][8] = ""
                       mainArray.testArray[a][0] = ""
                   }
               }
        same_number_all()
        collectionView.reloadData()
        if end_game_all() == true {
            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "6"
    //------------------------------------------------------//

    @IBAction func mainButton_6(_ sender: Any) {
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
               } else {
                   let a = variables.selectCell![1]
                   if variables.selectCell != nil && mainArray.testArray[a][9] == "" {
                       mainArray.testArray[a][9] = "6"
                   } else if variables.selectCell != nil && mainArray.testArray[a][9] == "6" {
                       mainArray.testArray[a][9] = ""
                       mainArray.testArray[a][0] = ""
                   }
               }
        same_number_all()
        collectionView.reloadData()
        if end_game_all() == true {
            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "7"
    //------------------------------------------------------//

    @IBAction func mainButton_7(_ sender: Any) {
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
               } else {
                   let a = variables.selectCell![1]
                   if variables.selectCell != nil && mainArray.testArray[a][10] == "" {
                       mainArray.testArray[a][10] = "7"
                   } else if variables.selectCell != nil && mainArray.testArray[a][10] == "7" {
                       mainArray.testArray[a][10] = ""
                       mainArray.testArray[a][0] = ""
                   }
               }
        same_number_all()
        collectionView.reloadData()
        if end_game_all() == true {
            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "8"
    //------------------------------------------------------//

    @IBAction func mainButton_8(_ sender: Any) {
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
               } else {
                   let a = variables.selectCell![1]
                   if variables.selectCell != nil && mainArray.testArray[a][11] == "" {
                       mainArray.testArray[a][11] = "8"
                   } else if variables.selectCell != nil && mainArray.testArray[a][11] == "8" {
                       mainArray.testArray[a][11] = ""
                       mainArray.testArray[a][0] = ""
                   }
               }
        same_number_all()
        collectionView.reloadData()
        if end_game_all() == true {
            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка с цифрой "9"
    //------------------------------------------------------//

    @IBAction func mainButton_9(_ sender: Any) {
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
               } else {
                   let a = variables.selectCell![1]
                   if variables.selectCell != nil && mainArray.testArray[a][12] == "" {
                       mainArray.testArray[a][12] = "9"
                   } else if variables.selectCell != nil && mainArray.testArray[a][12] == "9" {
                       mainArray.testArray[a][12] = ""
                       mainArray.testArray[a][0] = ""
                   }
               }
        same_number_all()
        collectionView.reloadData()
        if end_game_all() == true {
            popUpEndGame()
        }
        saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка "Отменить"
    //------------------------------------------------------//

    @IBAction func cancelButton(_ sender: Any) {
            cancel_all()
            collectionView.reloadData()
            saveData()
    }
    
    //------------------------------------------------------//
    //Кнопка "Удалить"
    //------------------------------------------------------//

    @IBAction func removeButton(_ sender: Any) {
        if variables.selectCell?[1] != nil {
            let a = variables.selectCell![1]
            if a != nil && mainArray.testArray[a][2] == "2" {
                mainArray.testArray[a][0] = ""
                collectionView.reloadData()
                saveData()
            }
        }
    }
    
    //------------------------------------------------------//
    //Кнопка "Заметка"
    //------------------------------------------------------//

    @IBAction func noteButton(_ sender: Any) {
        if variables.changeButtonNote == 0 {
            (sender as AnyObject).setBackgroundImage(UIImage(named: "pencil-on"), for: UIControl.State.normal)
            variables.changeButtonNote = 1
        } else {
            (sender as AnyObject).setBackgroundImage(UIImage(named: "pencil_off"), for: UIControl.State.normal)
            variables.changeButtonNote = 0
        }
    }
    
    //------------------------------------------------------//
    //Кнопка "Подсказка"
    //------------------------------------------------------//

    @IBAction func helpButton(_ sender: Any) {
    }
    
    
    //------------------------------------------------------//
    //Таймер
    //------------------------------------------------------//

    @IBOutlet weak var labelTimer: UILabel!
    var counterS = 0
    var counterM = 0
    var timerS = Timer()
    @objc func timerAction() {
        if counterS >= 59 && counterM < 10 {
            counterM += 1
            labelTimer.text = "0\(counterM):00"
            timerSec()
        } else if counterS >= 59 && counterM >= 10 {
            counterM += 1
            labelTimer.text = "\(counterM):00"
            timerSec()
        } else if counterS < 10 {
            labelTimer.text = "0\(counterM):0\(counterS)"
            counterS += 1
        } else if counterS >= 10 {
            labelTimer.text = "0\(counterM):\(counterS)"
            counterS += 1
        }
     }
    func timerSec () {
        timerS.invalidate()
        counterS = 0
        timerS = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    //------------------------------------------------------//

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        timerSec()
        variables.savedGame = true
        saveData()
    }
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

            //Кастомные границы ячейки
   
            if mainArray.borderArray[indexPath.row] == 0 {
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.black, thickness: 0.3)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 0.3)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: UIColor.black, thickness: 0.3)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: UIColor.black, thickness: 0.3)
            } else if mainArray.borderArray[indexPath.row] == 1 {
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.black, thickness: 0.3)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 1)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: UIColor.black, thickness: 0.3)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: UIColor.black, thickness: 0.3)
            } else if mainArray.borderArray[indexPath.row] == 2 {
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.black, thickness: 0.3)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 0.3)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: UIColor.black, thickness: 0.3)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: UIColor.black, thickness: 1)
            } else if mainArray.borderArray[indexPath.row] == 3 {
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.black, thickness: 0.3)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 1)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.left, color: UIColor.black, thickness: 0.3)
                itemCell.nameLabel.layer.addBorder(edge: UIRectEdge.right, color: UIColor.black, thickness: 1)
            }
            
            //Заполнение цветом ячеек
            
            if mainArray.testArray[indexPath.row][1] == "1" {
                itemCell.layer.backgroundColor = variables.color1
            } else if mainArray.testArray[indexPath.row][1] == "2" {
                itemCell.layer.backgroundColor = variables.color2
            } else if mainArray.testArray[indexPath.row][1] == "3" {
                itemCell.layer.backgroundColor = variables.color3
            } else if mainArray.testArray[indexPath.row][1] == "4" {
                itemCell.layer.backgroundColor = variables.color4
            }
                        
            //Цвет текста
            
            if mainArray.testArray[indexPath.row][2] == "1" {
                itemCell.nameLabel.textColor = variables.color5
            } else if mainArray.testArray[indexPath.row][2] == "2" {
                itemCell.nameLabel.textColor = variables.color6
            }
    
            
            
            return itemCell
        }

        return UICollectionViewCell()
    }
    
    //------------------------------------------------------//

    
    
    func change_color () {
        collectionView.reloadData()
        collectionView.cellForItem(at: IndexPath.init(row: 1, section: 0))?.backgroundColor = UIColor.init(red: 79, green: 158, blue: 236, alpha: 1.0)
        saveData()
    }
    
    
    
    //------------------------------------------------------//
    //Действие при тапе по ячейке
    //------------------------------------------------------//

    func collectionView (_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            variables.selectCell = indexPath //получаем адрес выделенной ячейки
            print(variables.selectCell![1])
        
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
            
            //Закрашиваем областя
            select_line_and_area_all(number: a)
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
    }
    
    //------------------------------------------------------//

    
    
    
}
