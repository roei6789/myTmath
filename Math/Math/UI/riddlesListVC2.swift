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
    static var selectedWorld = 0
    
    var myIndex = 0
    var riddles = ["1","2","3","4","5","6","7","8","9","10","11"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initiolize variables
        thisWorldLevels = (thisGame.currentWorlds[String(riddlesListVC2.selectedWorld)]?.Array_Questions)!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thisWorldLevels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RiddlesCollectionViewCell2", for: indexPath) as! RiddlesCollectionViewCell2
        cell.nuberLabel.text = String(thisWorldLevels[indexPath.row].Number)
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
        myIndex = indexPath.row
        performSegue(withIdentifier: "toRiddle", sender: self)
    }
}

