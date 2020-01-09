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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Сгругление углов поп-апа
        MessageView.layer.cornerRadius = 24
        
        //прозрачность фона
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        moveIn()
    }
    
    @IBAction func popUpClose(_ sender: Any) {
        self.view.removeFromSuperview()
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
    

}
