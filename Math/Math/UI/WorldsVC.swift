//
//  WorldsVC.swift
//  Math
//
//  Created by Aviv Maor on 2/17/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class WorldsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    //initiolize variables
    let thisGame = Game.sharedInstance
    var thisWorlds : [String : Worlds] = [:]
    static var selectedWorld = 0

    var worldsIMG  = [UIImage(named: "rectangles"),UIImage(named: "magicSqures"),UIImage(named: "matches")]
    var worldsTitle = ["חידות מצולעים","ריבועי קסם","חידות גפרורים"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initiolize variables
         thisWorlds = thisGame.currentWorlds
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thisGame.currentWorlds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "worldsCollectionViewCell", for: indexPath) as! worldsCollectionViewCell
        let cellImag = UIImage (named: (self.thisWorlds[String(indexPath.row + 1)]?.picture)!)
        cell.worldIMG.image = cellImag //worldsIMG[indexPath.row]
        cell.worlfLable.text = self.thisWorlds[String(indexPath.row + 1)]?.Name //worldsTitle[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       riddlesListVC2.selectedWorld = indexPath.row + 1
        performSegue(withIdentifier: "toRiddleList", sender: self)
    }


}
