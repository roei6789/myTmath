//
//  MyAchievementsVC.swift
//  Math
//
//  Created by Aviv Maor on 4/23/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class MyAchievementsVC: UIViewController {

    @IBOutlet weak var world1_count_label: UILabel!
    @IBOutlet weak var world2_count_label: UILabel!
    @IBOutlet weak var world3_count_label: UILabel!
    @IBOutlet weak var world1_star_label: UILabel!
    @IBOutlet weak var world2_star_label: UILabel!
    @IBOutlet weak var world3_star_label: UILabel!
    @IBOutlet weak var goldStar1: UIImageView!
    @IBOutlet weak var goldStar2: UIImageView!
    @IBOutlet weak var goldStar3: UIImageView!
    
    //initiolize variables
    let thisGame = Game.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        world1_count_label.text = String(thisGame.getPointsPerWorld(worldNum: 1))
        world2_count_label.text = String(thisGame.getPointsPerWorld(worldNum: 2))

    }

    override func viewDidAppear(_ animated: Bool) {
        golsStarAnimation(worldStar: self.goldStar1, worldNumber: 1)
    }

    func golsStarAnimation(worldStar : UIImageView, worldNumber : Int) {
        let numberOfCurrect : Int = thisGame.WorldsList[worldNumber - 1].getUserPoints()
        for index in 0...numberOfCurrect {
            animateIn(worldStar: worldStar, number: String(index))
        }
    }
    
    //animate settings view in
    func animateIn(worldStar : UIImageView , number : String){
        //incrising the size effect
        worldStar.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        //animation
        UIView.animate(withDuration: 0.6) {
            //resizing setting view
            self.goldStar1.transform = CGAffineTransform.identity
            self.world1_star_label.text = number
        }
    }
    
    func animateIn2(number : String){
        //incrising the size effect
        goldStar1.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        //animation
        UIView.animate(withDuration: 0.6) {
            //resizing setting view
            self.goldStar1.transform = CGAffineTransform.identity
            self.world1_star_label.text = number
        }
    }
    
    func animate(){
        UIView.animate(withDuration: 0.8, animations: {
            self.goldStar1.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.goldStar1.transform = CGAffineTransform.identity
        }) { (succees : Bool) in
            return
        }
    }
    

}
