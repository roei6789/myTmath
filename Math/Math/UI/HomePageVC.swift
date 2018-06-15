//
//  HomePageVC.swift
//  Math
//
//  Created by Aviv Maor on 2/28/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit
import AVFoundation

class HomePageVC: UIViewController {

    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var backButton: UIView!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var myAchivmentsButton: UIButton!
    @IBOutlet weak var about: UIButton!
    @IBOutlet weak var pointsLabel: UIButton!
    
    @IBOutlet var settingsView: UIView!
    @IBOutlet weak var volumeMusic: UISlider!
    @IBOutlet weak var volumeSounds: UISlider!
    
    //sounds & music
    var musicPlayer : AVAudioPlayer = AVAudioPlayer()
    
    let thisGame = Game.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ui inisialize
        navigationController?.navigationBar.isHidden = true
        self.playButton.layer.cornerRadius = 10
        //settings - ui inisialize
        self.settingsView.layer.cornerRadius = 14
        
       // getUserData()
        
       //sounds & music
        musicPlayer = thisGame.musicPlayer
        musicPlayer.play()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let points = thisGame.getUserPoints()
        pointsLabel.setTitle(String(points), for: pointsLabel.state)
        
    }

    @IBAction func onClickPlay(_ sender: Any) {
    }
    
    @IBAction func onClickAchivments(_ sender: Any) {
         performSegue(withIdentifier: "showAchievements", sender: self)
        
    }
    
    @IBAction func onClickAbout(_ sender: Any) {
        performSegue(withIdentifier: "showAboutView", sender: self)
        
    }
    
    @IBAction func onClickSettings(_ sender: Any) {
        clearUIForPopup()
        animateIn(animateView: settingsView)
    }
    
    @IBAction func dismissSettings(_ sender: Any) {
        animateOut(animateView: settingsView)
        restoreUIFromPopup()
    }
    
    
    
    //animate settings view in
    func animateIn( animateView : UIView){
        self.view.addSubview(animateView)
        animateView.center = self.view.center
        //incrising the size effect
        animateView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        //set opacity  to 0 =  transperent
        animateView.alpha = 0
        //animation
        UIView.animate(withDuration: 0.4) {
            animateView.alpha = 1
            //resizing view
            animateView.transform = CGAffineTransform.identity
        }
    }
    
    //animate settings view out
    func animateOut(animateView : UIView){
        UIView.animate(withDuration: 0.3, animations: {
            animateView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            animateView.alpha = 0
        }) { (succees : Bool) in
            animateView.removeFromSuperview()
        }
    }

    @IBAction func musicVolumeDidChange(_ sender: Any) {
        let value = self.volumeMusic.value
        musicPlayer.setVolume(value, fadeDuration: 0.0)
    }
    
    @IBAction func soundsVolumeDidChange(_ sender: Any) {
        let value = self.volumeSounds.value
        //player.setVolume(value, fadeDuration: 0.0)
    }
    
    //UI changes for popup
    func clearUIForPopup() {
        barView.isHidden = true
        logoImg.isHidden = true
        playButton.isHidden = true
        about.isHidden = true
        myAchivmentsButton.isHidden = true
        backButton.isHidden = false
    }
    //UI changes for popup
    func restoreUIFromPopup() {
        barView.isHidden = false
        logoImg.isHidden = false
        playButton.isHidden = false
        about.isHidden = false
        myAchivmentsButton.isHidden = false
        backButton.isHidden = true
    }
}
