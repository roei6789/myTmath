//
//  worldsVC2.swift
//  Math
//
//  Created by Aviv Maor on 3/6/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class worldsVC2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

        var riddles = ["1","2","3","4","5","6","7","8","9","10","11"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return riddles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorldsCollectionViewCell2", for: indexPath) as! WorldsCollectionViewCell2
        cell.nuberLabel.text = riddles[indexPath.row]
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
    }
}
