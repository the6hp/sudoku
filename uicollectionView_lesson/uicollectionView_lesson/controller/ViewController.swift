import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
        
    var place = IndexPath(item: 14, section: 0)
    
    @IBAction func test_button(_ sender: Any) {
    }
    
    @IBAction func mainButton_1(_ sender: Any) {
        if variables.selectCell != nil {
            let a = variables.selectCell![1]
            if mainArray.testArray[a][0] == "" {
                mainArray.testArray[a][0] = "1"
                mainArray.testArray[a][2] = "2"
                collectionView.reloadData()
            } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                mainArray.testArray[a][0] = "1"
                collectionView.reloadData()
            }
        }
        if end_game_all() == true {
            popUpEndGame()
        }
    }
    @IBAction func mainButton_2(_ sender: Any) {
                if variables.selectCell != nil {
            let a = variables.selectCell![1]
            if mainArray.testArray[a][0] == "" {
                mainArray.testArray[a][0] = "2"
                mainArray.testArray[a][2] = "2"
                collectionView.reloadData()
            } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                mainArray.testArray[a][0] = "2"
                collectionView.reloadData()
            }
        }
        if end_game_all() == true {
            popUpEndGame()
        }
    }
    @IBAction func mainButton_3(_ sender: Any) {
               if variables.selectCell != nil {
            let a = variables.selectCell![1]
            if mainArray.testArray[a][0] == "" {
                mainArray.testArray[a][0] = "3"
                mainArray.testArray[a][2] = "2"
                collectionView.reloadData()
            } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                mainArray.testArray[a][0] = "3"
                collectionView.reloadData()
            }
        }
        if end_game_all() == true {
            popUpEndGame()
        }
    }
    @IBAction func mainButton_4(_ sender: Any) {
               if variables.selectCell != nil {
            let a = variables.selectCell![1]
            if mainArray.testArray[a][0] == "" {
                mainArray.testArray[a][0] = "4"
                mainArray.testArray[a][2] = "2"
                collectionView.reloadData()
            } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                mainArray.testArray[a][0] = "4"
                collectionView.reloadData()
            }
        }
        if end_game_all() == true {
            popUpEndGame()
        }
    }
    @IBAction func mainButton_5(_ sender: Any) {
               if variables.selectCell != nil {
            let a = variables.selectCell![1]
            if mainArray.testArray[a][0] == "" {
                mainArray.testArray[a][0] = "5"
                mainArray.testArray[a][2] = "2"
                collectionView.reloadData()
            } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                mainArray.testArray[a][0] = "5"
                collectionView.reloadData()
            }
        }
        if end_game_all() == true {
            popUpEndGame()
        }
    }
    @IBAction func mainButton_6(_ sender: Any) {
               if variables.selectCell != nil {
            let a = variables.selectCell![1]
            if mainArray.testArray[a][0] == "" {
                mainArray.testArray[a][0] = "6"
                mainArray.testArray[a][2] = "2"
                collectionView.reloadData()
            } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                mainArray.testArray[a][0] = "6"
                collectionView.reloadData()
            }
        }
        if end_game_all() == true {
            popUpEndGame()
        }
    }
    @IBAction func mainButton_7(_ sender: Any) {
               if variables.selectCell != nil {
            let a = variables.selectCell![1]
            if mainArray.testArray[a][0] == "" {
                mainArray.testArray[a][0] = "7"
                mainArray.testArray[a][2] = "2"
                collectionView.reloadData()
            } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                mainArray.testArray[a][0] = "7"
                collectionView.reloadData()
            }
        }
        if end_game_all() == true {
            popUpEndGame()
        }
    }
    @IBAction func mainButton_8(_ sender: Any) {
               if variables.selectCell != nil {
            let a = variables.selectCell![1]
            if mainArray.testArray[a][0] == "" {
                mainArray.testArray[a][0] = "8"
                mainArray.testArray[a][2] = "2"
                collectionView.reloadData()
            } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                mainArray.testArray[a][0] = "8"
                collectionView.reloadData()
            }
        }
        if end_game_all() == true {
            popUpEndGame()
        }
    }
    @IBAction func mainButton_9(_ sender: Any) {
               if variables.selectCell != nil {
            let a = variables.selectCell![1]
            if mainArray.testArray[a][0] == "" {
                mainArray.testArray[a][0] = "9"
                mainArray.testArray[a][2] = "2"
                collectionView.reloadData()
            } else if mainArray.testArray[a][0] != "" && mainArray.testArray[a][2] == "2" {
                mainArray.testArray[a][0] = "9"
                collectionView.reloadData()
            }
        }
        if end_game_all() == true {
            popUpEndGame()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}


//Создание и заполнение ячеек игрового поля
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // return mainArray.allNumbers_text.count
        return mainArray.testArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MainCollectionViewCell {
          //  itemCell.nameLabel.text = mainArray.allNumbers_text[indexPath.row]
            
           // let a:String = mainArray.testArray[indexPath.row][0] as! String
            itemCell.nameLabel.text = mainArray.testArray[indexPath.row][0] as? String
            
            
            //Заполнение цветом ячеек
            //1 - Обычный стартовый фон всего поля
            if mainArray.testArray[indexPath.row][1] == "1" {
                itemCell.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            //2 - Фон выбранной ячейки
            } else if mainArray.testArray[indexPath.row][1] == "2" {
                itemCell.layer.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            //3 - Фон выделения областей при выборе ячейки
            } else if mainArray.testArray[indexPath.row][1] == "3" {
                itemCell.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
            
            itemCell.layer.borderWidth = 1.0 //толщина границы ячейки
            
            
            //Цвет текста
            //1 - Цвет шрифта изначальных значений
            if mainArray.testArray[indexPath.row][2] == "1" {
                itemCell.nameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            //2 - Цвет шрифта заполненных пользователем значений
            } else if mainArray.testArray[indexPath.row][2] == "2" {
                itemCell.nameLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            }
            
            
            
            
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    
    
    
    
    
    
    
    
    func change_color () {
     //   collectionView.cellForItem(at: place as IndexPath)?.backgroundColor = UIColor.black
     //   collectionView.cellForItem(at: IndexPath.init(row: 1, section: 0))?.backgroundColor = UIColor.black
        collectionView.reloadData()
        collectionView.cellForItem(at: IndexPath.init(row: 1, section: 0))?.backgroundColor = UIColor.init(red: 79, green: 158, blue: 236, alpha: 1.0)
    }
    
    
    

    //Действие при тапе по ячейке
    func collectionView (_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //    if variables.selectCell != nil {
   //        collectionView.cellForItem(at: variables.selectCell!)?.backgroundColor = UIColor.lightGray
   //     }
   //     collectionView.cellForItem(at: indexPath as IndexPath)?.backgroundColor = #colorLiteral(red: 0.35546875, green: 0.605743838, blue: 1, alpha: 1)
        //let tapCell = collectionView.cellForItem(at: indexPath as IndexPath)
            
            
            
        
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
        
            collectionView.reloadData()
    }
        
    func popUpEndGame() {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpVCid") as! PopUpViewController //Мы получаем ссылку на PopUpViewController, причем получаем ссылку мы при помощи метода, который обращается к StoryBoard и находит контроллер, у которого идентификатор popUpVCid.
        self.addChild(popUpVC) //Добавляем полученный контроллер PopUpViewController в качестве дочернего к ViewController
        popUpVC.view.frame = self.view.frame  // Размеры View нового контроллера мы устанавливаем равными размера View текущего контроллера.
        self.view.addSubview(popUpVC.view) //Непосредственно выводим на экран то,  как отображается PopUpViewController. Т.е. добавляем View PopUpViewController в стек той кучи View, которые уже есть.
        popUpVC.didMove(toParent: self) //Вызываем метод делегата, чтобы сообщить всем делегатам, о том, что контроллер мы отобразили.
    }
    
    
    
    
    


    
    
}
