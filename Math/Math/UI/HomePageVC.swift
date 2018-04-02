//
//  HomePageVC.swift
//  Math
//
//  Created by Aviv Maor on 2/28/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var myAchivmentsButton: UIButton!
    @IBOutlet weak var about: UIButton!
  
    @IBOutlet var settingsView: UIView!
    
    let thisGame = Game.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ui inisialize
        self.playButton.layer.cornerRadius = 10
        //settings - ui inisialize
        self.settingsView.layer.cornerRadius = 10
        
       // getUserData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
 
        
    }

    @IBAction func onClickPlay(_ sender: Any) {
    }
    
    @IBAction func onClickAchivments(_ sender: Any) {
    }
    
    @IBAction func onClickAbout(_ sender: Any) {
    }
    
    @IBAction func onClickSettings(_ sender: Any) {
        animateIn()
    }
    
    @IBAction func dismissSettings(_ sender: Any) {
        animateOut()
    }
    
    
    
    //animate settings view in
    func animateIn(){
        self.view.addSubview(settingsView)
        settingsView.center = self.view.center
        //incrising the size effect
        settingsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        //set opacity  to 0 =  transperent
        settingsView.alpha = 0
        
        //animation
        UIView.animate(withDuration: 0.4) {
            //setting visual effece
            //self.visualEffect.effect = self.effect
            //setting view visuality
            self.settingsView.alpha = 1
            //resizing setting view
            self.settingsView.transform = CGAffineTransform.identity
        }
    }
    
    //animate settings view out
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.settingsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.settingsView.alpha = 0
           // self.visualEffect.effect = nil
        }) { (succees : Bool) in
            self.settingsView.removeFromSuperview()
        }
    }

}
