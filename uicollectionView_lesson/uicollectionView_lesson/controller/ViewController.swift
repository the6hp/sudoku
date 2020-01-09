//
//  ViewController.swift
//  uicollectionView_lesson
//
//  Created by Alexander Penkov on 08.01.2020.
//  Copyright © 2020 Alexander Penkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var place = IndexPath(item: 14, section: 0)
    
    @IBAction func test_button(_ sender: Any) {
        change_color()
        newtest()
    }
    
    @IBAction func mainButton_1(_ sender: Any) {
        if variables.selectCell != nil {
            let a = variables.selectCell![1]
            print(a)
            mainArray.allNumbers_text[a] = "1"
            collectionView.reloadData()
        }
    }
    @IBAction func mainButton_2(_ sender: Any) {
    }
    @IBAction func mainButton_3(_ sender: Any) {
    }
    @IBAction func mainButton_4(_ sender: Any) {
    }
    @IBAction func mainButton_5(_ sender: Any) {
    }
    @IBAction func mainButton_6(_ sender: Any) {
    }
    @IBAction func mainButton_7(_ sender: Any) {
    }
    @IBAction func mainButton_8(_ sender: Any) {
    }
    @IBAction func mainButton_9(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainArray.allNumbers_text.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MainCollectionViewCell {
            
            itemCell.nameLabel.text = mainArray.allNumbers_text[indexPath.row]
            
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    func change_color () {
     //   collectionView.cellForItem(at: place as IndexPath)?.backgroundColor = UIColor.black
     //   collectionView.cellForItem(at: IndexPath.init(row: 1, section: 0))?.backgroundColor = UIColor.black
        collectionView.deselectItem(at: variables.selectCell!, animated: true)
        collectionView.reloadData()
    }
    
    
    

    //Действие при тапе по ячейке
    func collectionView (_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if variables.selectCell != nil {
            collectionView.cellForItem(at: variables.selectCell as! IndexPath)?.backgroundColor = UIColor.lightGray
            collectionView.deselectItem(at: variables.selectCell!, animated: true)
        }
            collectionView.cellForItem(at: indexPath as IndexPath)?.backgroundColor = UIColor.white
            //let tapCell = collectionView.cellForItem(at: indexPath as IndexPath)
            variables.selectCell = indexPath //получаем номер выделенной ячейки
            print("selectCell", variables.selectCell)
        

    }
        
    func newtest() {
     //   var newArray = mainArray.allNumbers
    }
    
    
    
    

    
    
}
