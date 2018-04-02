//
//  WorldsVC.swift
//  Math
//
//  Created by Aviv Maor on 2/17/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class WorldsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    var worldsIMG  = [UIImage(named: "rectangles"),UIImage(named: "magicSqures"),UIImage(named: "matches")]
    var worldsTitle = ["חידות מצולעים","ריבועי קסם","חידות גפרורים"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "worldsCollectionViewCell", for: indexPath) as! worldsCollectionViewCell
        cell.worldIMG.image = worldsIMG[indexPath.row]
        cell.worlfLable.text = worldsTitle[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        performSegue(withIdentifier: "toRiddleList", sender: self)
    }


}
