//
//  PopUpViewController.swift
//  uicollectionView_lesson
//
//  Created by Alexander Penkov on 10.01.2020.
//  Copyright © 2020 Alexander Penkov. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    
    @IBOutlet weak var MessageView: UIView!
    @IBOutlet weak var labelTitleEndGame: UILabel!
    @IBOutlet weak var closeButtonEndGamePopUp: UIButton!
    @IBOutlet weak var levelLabelEndGame: UILabel!
    @IBOutlet weak var timeLabelEndGame: UILabel!
    
    
    override func viewDidLoad() {
        
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
        
    }
    
    @IBAction func popUpClose(_ sender: Any) {
        
        //Таптик отклик
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        self.view.removeFromSuperview()
        
        variables.countMin = 0
        variables.countSec = 0
        saveData()

   //     openMainView()
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
    
        
        let newController = self.storyboard!.instantiateViewController(withIdentifier: "gameView")
        //the identifier above comes from storyboard
        self.navigationController!.pushViewController(newController, animated : true)
 
    }
    
    
    
    
    func textLabel () {
        
        if variables.countError > 2 {
            labelTitleEndGame.text = "Проигрыш"
        }
        
        var levelGameLabel: String = ""
        var timeGameLabel: String = ""
         
         if variables.levelGame == 0 {
             levelGameLabel = "Легкий"
         } else if variables.levelGame == 1 {
             levelGameLabel = "Средний"
         } else if variables.levelGame == 2 {
             levelGameLabel = "Сложный"
         } else if variables.levelGame == 3 {
             levelGameLabel = "Эксперт"
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
        
        levelLabelEndGame.text = "Уровень: \(levelGameLabel)"
        timeLabelEndGame.text = "Время: \(timeGameLabel)"
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
        case 320:
            self.MessageView.frame = CGRect(x: 50, y: 150, width: 220, height: 200)
            self.labelTitleEndGame.frame = CGRect(x: 50, y: 20, width: 125, height: 30)
            self.levelLabelEndGame.frame = CGRect(x: 35, y: 70, width: 180, height: 30)
            self.timeLabelEndGame.frame = CGRect(x: 35, y: 100, width: 180, height: 30)
            self.closeButtonEndGamePopUp.frame = CGRect(x: 38, y: 150, width: 150, height: 30)
        case 414:
            self.MessageView.frame = CGRect(x: 95, y: 230, width: 225, height: 200)
            self.labelTitleEndGame.frame = CGRect(x: 50, y: 20, width: 125, height: 30)
            self.levelLabelEndGame.frame = CGRect(x: 35, y: 70, width: 180, height: 30)
            self.timeLabelEndGame.frame = CGRect(x: 35, y: 100, width: 180, height: 30)
            self.closeButtonEndGamePopUp.frame = CGRect(x: 38, y: 150, width: 150, height: 30)
        default:
            break
        }
        
        
    }
    

}
