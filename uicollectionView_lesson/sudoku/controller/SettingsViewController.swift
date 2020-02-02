//Экран настроек

import UIKit

class SettingsViewController: UIViewController {

    let idSettingCell = "settingCell"
    
    @IBAction func switchSettings(_ sender: UISwitch!) {
        switch sender.tag {
        case 1:
            if settings.sound == false {
                settings.sound = true
            } else if settings.sound == true {
                settings.sound = false
            }
            
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
            
            saveData()
        case 2:
            if settings.autolockScreen == false {
                settings.autolockScreen = true
            } else if settings.autolockScreen == true {
                settings.autolockScreen = false
            }
            saveData()

        case 3:
            if settings.timer == false {
                settings.timer = true
            } else if settings.timer == true {
                settings.timer = false
            }
            saveData()

        case 4:
            if settings.errorLimit == false {
                settings.errorLimit = true
            } else if settings.errorLimit == true {
                settings.errorLimit = false
            }
            saveData()

        case 5:
            if settings.autocheckError == false {
                settings.autocheckError = true
            } else if settings.autocheckError == true {
                settings.autocheckError = false
            }
            saveData()

        case 6:
            if settings.hideUsedNumbers == false {
                settings.hideUsedNumbers = true
            } else if settings.hideUsedNumbers == true {
                settings.hideUsedNumbers = false
            }
            saveData()

        case 7:
            if settings.selectRepeating == false {
                settings.selectRepeating = true
            } else if settings.selectRepeating == true {
                settings.selectRepeating = false
            }
            saveData()

        case 8:
            if settings.selectedArea == false {
                settings.selectedArea = true
            } else if settings.selectedArea == true {
                settings.selectedArea = false
            }
            saveData()

        case 9:
            if settings.selectedSameNumber == false {
                settings.selectedSameNumber = true
                print("Настройки. Переключение выделения повторных значений. ", settings.selectedSameNumber)
            } else if settings.selectedSameNumber == true {
                settings.selectedSameNumber = false
                print("Настройки. Переключение выделения повторных значений. ", settings.selectedSameNumber)

            }
            saveData()

        case 10:
            if settings.autoDeleteNote == false {
                settings.autoDeleteNote = true
            } else if settings.autoDeleteNote == true {
                settings.autoDeleteNote = false
            }
            saveData()

        default:
            break
        }
        
        saveData()
    }
      
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self as? UITableViewDataSource
        tableView.delegate = self as? UITableViewDelegate
        self.tableView.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 0.4102900257)

    }

}


extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Количество секторов
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    // Количество ячеек + разбитие на сектора
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return  4
        } else if section == 1 {
            return 2
        } else if section == 2 {
            return 1
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return 1
        } else if section == 5 {
            return 1
        } else if section == 6 {
            return 1
        } else {
            return 0
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") as! SettingsTableViewCell
         
        //Таргет для свитча
        cell.switchSettingsOutlet.addTarget(self, action: #selector(self.switchSettings(_:)), for: .valueChanged)
        
        switch indexPath {
        case [0, 0]:
            cell.titleSettingsCell.text = "Звуковые эффекты"
            cell.switchSettingsOutlet.isOn = settings.sound
            cell.switchSettingsOutlet.tag = 1
        case [0, 1]:
            cell.titleSettingsCell.text = "Автоблокировка экрана"
            cell.switchSettingsOutlet.isOn = settings.autolockScreen
            cell.switchSettingsOutlet.tag = 2
        case [0, 2]:
            cell.titleSettingsCell.text = "Таймер"
            cell.switchSettingsOutlet.isOn = settings.timer
            cell.switchSettingsOutlet.tag = 3
        case [0, 3]:
            cell.titleSettingsCell.text = "Лимит ошибок"
            cell.switchSettingsOutlet.isOn = settings.errorLimit
            cell.switchSettingsOutlet.tag = 4
        case [1, 0]:
            cell.titleSettingsCell.text = "Автопроверка ошибок"
            cell.switchSettingsOutlet.isOn = settings.autocheckError
            cell.switchSettingsOutlet.tag = 5
        case [1, 1]:
            cell.titleSettingsCell.text = "Скрывать использованные цифры"
            cell.switchSettingsOutlet.isOn = settings.hideUsedNumbers
            cell.switchSettingsOutlet.tag = 6
        case [2, 0]:
            cell.titleSettingsCell.text = "Выделять повторы"
            cell.switchSettingsOutlet.isOn = settings.selectRepeating
            cell.switchSettingsOutlet.tag = 7
        case [3, 0]:
            cell.titleSettingsCell.text = "Выделять области"
            cell.switchSettingsOutlet.isOn = settings.selectedArea
            cell.switchSettingsOutlet.tag = 8
        case [4, 0]:
            cell.titleSettingsCell.text = "Выделять одинаковые числа"
            cell.switchSettingsOutlet.isOn = settings.selectedSameNumber
            cell.switchSettingsOutlet.tag = 9
        case [5, 0]:
            cell.titleSettingsCell.text = "Автоудаление заметок"
            cell.switchSettingsOutlet.isOn = settings.autoDeleteNote
            cell.switchSettingsOutlet.tag = 10
        default:
            break
        }
        

        
        
        return cell
    }
    
    //Работа с секторами
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Ограничение на 3 ошибки за игру. Требуется автопроверка ошибок."
        case 1:
            return "Скрывать цифры, если на поле их уже 9"
        case 2:
            return "Выделение повторяющихся значений в блоке, строке и столбце"
        case 3:
            return "Выделение блока, строки и столбца выделенного числа"
        case 4:
            return "При выборе числа выделять на поле все одинаковые значения"
        case 5:
            return "Удаление из заметок вводимых чисел"
        default:
            return ""
        }
    }
}
