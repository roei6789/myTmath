//
//  HomaPageVC2.swift
//  Math
//
//  Created by Aviv Maor on 3/3/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class HomaPageVC2: UIViewController {
    //effect variables
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    var effect : UIVisualEffect!
    
    @IBOutlet var settingsView: UIView!
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var soundSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //remove the visual effect at start
        effect = visualEffect.effect
        visualEffect.alpha = 0
        visualEffect.effect = nil
        
        //ui additind
        settingsView.layer.cornerRadius = 10
        
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
            self.visualEffect.effect = self.effect
            self.visualEffect.alpha = 1
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
            self.visualEffect.alpha = 0
            self.settingsView.alpha = 0
            self.visualEffect.effect = nil
        }) { (succees : Bool) in
            self.settingsView.removeFromSuperview()
        }
    }

}
