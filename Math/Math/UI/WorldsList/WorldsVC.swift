//
//  WorldsVC.swift
//  Math
//
//  Created by Aviv Maor on 2/17/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class WorldsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var pointsLabel: UIButton!
    
    
    //initiolize variables
    let thisGame = Game.sharedInstance
    var thisWorlds : [Worlds] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ui inisialize
        navigationController?.navigationBar.isHidden = true
        //initiolize variables
         thisWorlds = thisGame.WorldsList
        let points = thisGame.getUserPoints()
        pointsLabel.setTitle(String(points), for: pointsLabel.state)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let points = thisGame.getUserPoints()
        pointsLabel.setTitle(String(points), for: pointsLabel.state)
        self.myCollection.reloadData()
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
        cell.layer.cornerRadius = 4
        if (indexPath.row < thisWorlds.count) {
            let cellImag = UIImage (named: (self.thisWorlds[indexPath.row].picture))
            cell.worldIMG.image = cellImag //worldsIMG[indexPath.row]
            cell.worlfLable.text = self.thisWorlds[indexPath.row].Name //worldsTitle[indexPath.row]
            let numOfRiddles = thisWorlds[indexPath.row].Array_Questions.count
            let pointsInlevel = thisWorlds[indexPath.row].getUserPoints()
            cell.pointsLabel.text = String(pointsInlevel) + " / " + String(numOfRiddles)
        }
        else{
            cell.worldIMG.image = UIImage(named: "level_lock")
            cell.worldIMG.layer.cornerRadius = 8
            cell.worlfLable.text = "בקרוב..."
            cell.pointsLabel.text = "0" + " / " + "0"

        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < 2 {
            thisGame.SelectedWorld = indexPath.row
            performSegue(withIdentifier: "toRiddleList", sender: self)
        }
    }

    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
