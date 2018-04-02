//
//  ThinkNSolve_2_VC.swift
//  Math
//
//  Created by Aviv Maor on 4/1/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class ThinkNSolve_2_VC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //effect variables
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    var effect : UIVisualEffect!
    
    @IBOutlet var rightAnwerView: UIView!
    
    @IBOutlet var wrongAnswerView: UIView!
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var numberLabel_1: UILabel!
    @IBOutlet weak var numberLabel_2: UILabel!
    @IBOutlet weak var numberLabel_3: UILabel!
    @IBOutlet weak var numberLabel_4: UILabel!
    
    @IBOutlet weak var signField_1: UITextField!
    @IBOutlet weak var signField_2: UITextField!
    @IBOutlet weak var signField_3: UITextField!
    
    @IBOutlet weak var pickerView_1: UIPickerView!
    @IBOutlet weak var pickerView_2: UIPickerView!
    @IBOutlet weak var pickerView_3: UIPickerView!
    
    let signes = ["+", "-", "X", ":"]
    var indexOn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initiolaize ui
        //remove the visual effect at start
        effect = visualEffect.effect
        self.visualEffect.alpha = 0
        visualEffect.effect = nil
        //accecability labels
        pickerView_1.accessibilityLabel = "1"
        pickerView_2.accessibilityLabel = "2"
        pickerView_3.accessibilityLabel = "3"

    }

    @IBAction func onClickCheck(_ sender: Any) {
        if(checkValidInput()){
            //stop watch + visual effect
            //check answer
            if(checkAnswer()){
                //correct answer!!
                //animate in
                animateIn(animateView: rightAnwerView)
            }
            else{
                //Incorrect answer
                animateIn(animateView: wrongAnswerView)
            }
        }
    }
    
    // MARK: Sub Views Methods.
    
    @IBAction func onClickNextLevel(_ sender: Any) {
    }
    @IBAction func onClickBack(_ sender: Any) {
        animateOut(animateView: rightAnwerView)
        
    }
    @IBAction func onClickTryAgain(_ sender: Any) {
        //animate out
    }
    
    
    // MARK: Private Methods.
    fileprivate func checkAnswer() -> Bool{
        return true
    }
    
    fileprivate func checkValidInput() -> Bool {
        var valid = false
        if (signField_1.text != "" && signField_2.text != "" && signField_3.text != "" ) {
            valid = true
        }
        return valid
    }
    
    // MARK: Picker Methods.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.signes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.signes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.accessibilityLabel {
        case "1":
            self.signField_1.text = signes[row]
        case "2":
            self.signField_2.text = signes[row]
        case "3":
            self.signField_3.text = signes[row]
        default:
            self.signField_1.text = signes[row]
        }
        
    }
    
    // MARK: Animation Methods.
    //animate  view in
    func animateIn( animateView : UIView){
        self.view.addSubview(animateView)
        animateView.center = self.view.center
        //incrising the size effect
        animateView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        //set opacity  to 0 =  transperent
        animateView.alpha = 0
        //animation
        UIView.animate(withDuration: 0.4) {
            //setting visual effece
            self.visualEffect.effect = self.effect
            self.visualEffect.alpha = 1
            // view visuality
            animateView.alpha = 1
            //resizing setting view
            animateView.transform = CGAffineTransform.identity
        }
    }
    
    //animate  view out
    func animateOut(animateView : UIView){
        UIView.animate(withDuration: 0.3, animations: {
            animateView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.visualEffect.alpha = 0
            animateView.alpha = 0
            self.visualEffect.effect = nil
        }) { (succees : Bool) in
            animateView.removeFromSuperview()
        }
    }


}
