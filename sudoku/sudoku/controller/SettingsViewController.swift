//Экран настроек

import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

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
            tableView.reloadData()
            saveData()

        case 5:
            if settings.autocheckError == false {
                settings.autocheckError = true
            } else if settings.autocheckError == true {
                settings.autocheckError = false
                settings.errorLimit = false
            }
            tableView.reloadData()
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
            } else if settings.selectedSameNumber == true {
                settings.selectedSameNumber = false

            }
            saveData()

        case 10:
            if settings.autoDeleteNote == false {
                settings.autoDeleteNote = true
            } else if settings.autoDeleteNote == true {
                settings.autoDeleteNote = false
            }
            saveData()
            
        case 11:
            if settings.nightMode == false {
                settings.nightMode = true
            } else if settings.nightMode == true {
                settings.nightMode = false
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
        loadData()
        tableView.dataSource = self as? UITableViewDataSource
        tableView.delegate = self as? UITableViewDelegate
        self.tableView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    //    self.tableView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)

        self.navigationItem.title?  = NSLocalizedString("settings", comment: "")

        
        let MSAppCenter_Key = Bundle.init(for: AppDelegate.self).infoDictionary?["MSAppCenter_Key"] as! String
        MSAppCenter.start(MSAppCenter_Key, withServices:[
          MSCrashes.self
        ])

    }

}


extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Количество секторов
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
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
    //    } else if section == 6 {
   //         return 1
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
            cell.titleSettingsCell.text = NSLocalizedString("sound_effects", comment: "")
            cell.switchSettingsOutlet.isOn = settings.sound
            cell.switchSettingsOutlet.tag = 1
        case [0, 1]:
            cell.titleSettingsCell.text = NSLocalizedString("auto_lock", comment: "")
            cell.switchSettingsOutlet.isOn = settings.autolockScreen
            cell.switchSettingsOutlet.tag = 2
        case [0, 2]:
            cell.titleSettingsCell.text = NSLocalizedString("timer", comment: "")
            cell.switchSettingsOutlet.isOn = settings.timer
            cell.switchSettingsOutlet.tag = 3
        case [0, 3]:
            cell.titleSettingsCell.text = NSLocalizedString("mistakes_limit", comment: "")
            cell.switchSettingsOutlet.isOn = settings.errorLimit
            cell.switchSettingsOutlet.tag = 4
            
            if settings.errorLimit == false && settings.autocheckError == false {
                cell.switchSettingsOutlet.isEnabled = false
            } else {
                cell.switchSettingsOutlet.isEnabled = true
            }
            
        case [1, 0]:
            cell.titleSettingsCell.text = NSLocalizedString("auto_check_for_mistakes", comment: "")
            cell.switchSettingsOutlet.isOn = settings.autocheckError
            cell.switchSettingsOutlet.tag = 5
        case [1, 1]:
            cell.titleSettingsCell.text = NSLocalizedString("hide_used_numbers", comment: "")
            cell.switchSettingsOutlet.isOn = settings.hideUsedNumbers
            cell.switchSettingsOutlet.tag = 6
        case [2, 0]:
            cell.titleSettingsCell.text = NSLocalizedString("highlight_duplicates", comment: "")
            cell.switchSettingsOutlet.isOn = settings.selectRepeating
            cell.switchSettingsOutlet.tag = 7
        case [3, 0]:
            cell.titleSettingsCell.text = NSLocalizedString("highlight_areas", comment: "")
            cell.switchSettingsOutlet.isOn = settings.selectedArea
            cell.switchSettingsOutlet.tag = 8
        case [4, 0]:
            cell.titleSettingsCell.text = NSLocalizedString("highlight_identical_numbers", comment: "")
            cell.switchSettingsOutlet.isOn = settings.selectedSameNumber
            cell.switchSettingsOutlet.tag = 9
        case [5, 0]:
            cell.titleSettingsCell.text = NSLocalizedString("auto_remove_notes", comment: "")
            cell.switchSettingsOutlet.isOn = settings.autoDeleteNote
            cell.switchSettingsOutlet.tag = 10
        case [6, 0]:
            cell.titleSettingsCell.text = "Тёмная тема"
            cell.switchSettingsOutlet.isOn = settings.nightMode
            cell.switchSettingsOutlet.tag = 11
        default:
            break
        }

        return cell
    }
    
    //Работа с секторами
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return NSLocalizedString("description_mistakes_limit", comment: "")
        case 1:
            return NSLocalizedString("description_hide_used_numbers", comment: "")
        case 2:
            return NSLocalizedString("description_highlight_duplicates", comment: "")
        case 3:
            return NSLocalizedString("description_highlight_areas", comment: "")
        case 4:
            return NSLocalizedString("description_highlight_identical_numbers", comment: "")
        case 5:
            return NSLocalizedString("description_auto_remove_notes", comment: "")
        default:
            return ""
        }
    }
    
    
}
