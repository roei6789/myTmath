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
    var thisWorlds : [Worlds] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ui inisialize
        navigationController?.navigationBar.isHidden = true
        //initiolize variables
         thisWorlds = thisGame.WorldsList
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (thisWorlds.count + 3 )
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "worldsCollectionViewCell", for: indexPath) as! worldsCollectionViewCell
        if (indexPath.row < thisWorlds.count) {
        let cellImag = UIImage (named: (self.thisWorlds[indexPath.row].picture))
        cell.worldIMG.image = cellImag //worldsIMG[indexPath.row]
        cell.worlfLable.text = self.thisWorlds[indexPath.row].Name //worldsTitle[indexPath.row]
        }
        else{
            cell.worldIMG.image = UIImage(named: "level_lock")
            cell.worlfLable.text = "בקרוב..."
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       thisGame.SelectedWorld = indexPath.row 
        performSegue(withIdentifier: "toRiddleList", sender: self)
    }

    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
