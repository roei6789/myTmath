//
//  riddlesListVC2.swift
//  Math
//
//  Created by Aviv Maor on 3/9/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class riddlesListVC2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //initiolize variables
    let thisGame = Game.sharedInstance
    var thisWorldLevels : [ Question] = []
    var selectedWorld = -1
    var selectedLevel = -1
    var numUnLock = 0
    //UI initiolize
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var pointsLabel: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ui inisialize
        navigationController?.navigationBar.isHidden = true
        //initiolize variables
        selectedWorld = thisGame.SelectedWorld
        thisWorldLevels = thisGame.WorldsList[thisGame.SelectedWorld].Array_Questions
        let points = thisGame.getUserPoints()
        pointsLabel.setTitle(String(points), for: pointsLabel.state)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        selectedWorld = thisGame.SelectedWorld
        thisWorldLevels = thisGame.WorldsList[thisGame.SelectedWorld].Array_Questions
         self.myCollectionView.reloadData()
        self.numUnLock = 0
        let points = thisGame.getUserPoints()
        pointsLabel.setTitle(String(points), for: pointsLabel.state)
        
        //click on next level (back from question)
        if selectedLevel > -1 {
            let lastQuestion = thisWorldLevels[selectedLevel]
            if lastQuestion.didPressNext{
                lastQuestion.didPressNext = false
                thisGame.updateGame(user: thisGame.Player!, game: thisGame, worldNum: selectedWorld, levelNum: selectedLevel, question: lastQuestion)
                clickNextLevel(row: selectedLevel + 1)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thisWorldLevels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RiddlesCollectionViewCell2", for: indexPath) as! RiddlesCollectionViewCell2
        cell.backgroundColor = UIColor.clear
        cell.nuberLabel.isHidden = false
        //cell.nuberLabel.text = String(thisWorldLevels[indexPath.row].Number)
        cell.nuberLabel.text = String(indexPath.row + 1)
        if thisWorldLevels[indexPath.row].isCurrect {
            cell.img.image = UIImage(named: "oval_riddels_v")
            cell.nuberLabel.isHidden = true
        }
        else{
            cell.img.image = UIImage(named: "Oval_riddels")
            self.numUnLock += 1
        }
        //add lock image + disable
        if self.numUnLock > 4 {
            cell.img.image = UIImage(named: "oval_riddels_lock")
            cell.nuberLabel.isHidden = true
        }
        //reset counter
        if indexPath.row == thisWorldLevels.count - 1{
            self.numUnLock = 0
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout : UICollectionViewLayout, sizeForItemAt indePath : IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4 - 1
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout : UICollectionViewLayout, minimumLineSpacingForSectionAt section : Int) -> CGFloat {
        
        return 1.0
    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout : UICollectionViewLayout, minimumInterItemSpaceingForSectionAt section : Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected: " + String(indexPath.row) )
        self.selectedLevel = indexPath.row
        thisGame.SelectedQuestion = indexPath.row
        //move to correct View
        let ques = thisGame.getQuestion(world: thisGame.SelectedWorld, question: thisGame.SelectedQuestion)
        let cell = myCollectionView.cellForItem(at: indexPath)as! RiddlesCollectionViewCell2
        if cell.img.image != UIImage(named: "oval_riddels_lock") {
    
            if ques is Question_Geometry{
               performSegue(withIdentifier: "toRiddle_G", sender: self)
            }
            else if ques is Question_Thinks_solve {
                performSegue(withIdentifier: "toRiddle_TS1", sender: self)
            }
            else{
                performSegue(withIdentifier: "toRiddle_TS2", sender: self)
            }
        }
    }
    
    func clickNextLevel (row : Int) {
        print("selected: " + String(row) )
        self.selectedLevel = row
        thisGame.SelectedQuestion = row
        //move to correct View
        let ques = thisGame.getQuestion(world: thisGame.SelectedWorld, question: thisGame.SelectedQuestion)
        if ques is Question_Geometry{
            performSegue(withIdentifier: "toRiddle_G", sender: self)
        }
        else if ques is Question_Thinks_solve {
            performSegue(withIdentifier: "toRiddle_TS1", sender: self)
        }
        else{
            performSegue(withIdentifier: "toRiddle_TS2", sender: self)
        }
       
    }
    
    // MARK: Private Methods.
    func toNextQuestion(){
        
    }
    @IBAction func onClickBack(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }
}

