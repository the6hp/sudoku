//
//  MainViewController.swift
//  uicollectionView_lesson
//
//  Created by Alexander Penkov on 09.01.2020.
//  Copyright © 2020 Alexander Penkov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    
    @IBOutlet weak var mainViewGameButton: UIButton!
    @IBOutlet weak var mainviewStatisticButton: UIButton!
    @IBOutlet weak var mainViewSettingsButton: UIButton!
    @IBOutlet weak var mainViewResumeGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonMain()
        
        //Убрать нижную границу у нав бара
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //Убираем текст кнопки "Назад"
        self.navigationItem.backBarButtonItem?.title = ""
    }
    
    func buttonMain() {
        mainViewGameButton.backgroundColor = .clear
        mainViewGameButton.layer.cornerRadius = 25
        mainViewGameButton.layer.borderWidth = 1
        mainViewGameButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        mainviewStatisticButton.backgroundColor = .clear
        mainviewStatisticButton.layer.cornerRadius = 25
        mainviewStatisticButton.layer.borderWidth = 1
        mainviewStatisticButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        mainViewSettingsButton.backgroundColor = .clear
        mainViewSettingsButton.layer.cornerRadius = 25
        mainViewSettingsButton.layer.borderWidth = 1
        mainViewSettingsButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        mainViewResumeGameButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        mainViewResumeGameButton.layer.cornerRadius = 25
        mainViewResumeGameButton.layer.borderWidth = 1
        mainViewResumeGameButton.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
        if variables.savedGame == true {
            mainViewResumeGameButton.isHidden = false
        } else {
            mainViewResumeGameButton.isHidden = true
        }
    }

    @IBAction func continueGameButton(_ sender: Any) {
        fill_array_all()
    }
    

}
