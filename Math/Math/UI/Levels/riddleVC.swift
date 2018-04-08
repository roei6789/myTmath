//
//  riddleVC.swift
//  Math
//
//  Created by Aviv Maor on 2/17/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class riddleVC: UIViewController {

    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var riddleTitle: UILabel!
    @IBOutlet weak var riddleQuestion: UILabel!
    @IBOutlet weak var riddleIMG: UIImageView!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var questionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var answerViewTop: NSLayoutConstraint!
    
    //initiolize variables
    let thisGame = Game.sharedInstance
    var selectedWorld = -1
    var SelectedQuestion = -1
    //var thisQuestion :  Question?
    var thisQuestion :  Question_Geometry?
    var questionNumber : Int = -1
    var correctAnwer : Int = -1
    var attemps : Int =  -1
    var isCorrect = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initiolize variables
        selectedWorld = thisGame.SelectedWorld
        SelectedQuestion  = thisGame.SelectedQuestion
//        questionNumber = (thisQuestion?.Number)!
//        correctAnwer = (thisQuestion?.Answer_Correct)!
//        attemps = (thisQuestion?.Attempts)!
        thisQuestion = thisGame.getQuestion(world: selectedWorld, question: SelectedQuestion) as? Question_Geometry //need to check for nil
        
        //UI initiolize
        //navigation bar
//        self.navigationController?.isNavigationBarHidden = true
        self.questionViewHeight.constant = (self.view.frame.height / 4 ) * 3
        //question data
        self.riddleTitle.text = thisQuestion?.Title
        self.riddleQuestion.text = thisQuestion?.Explanation
        self.riddleIMG.image = UIImage(named : (thisQuestion?.Picture)!)
        
        //abserver for keyboard
        let center : NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        center.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)

    }
    
    
   
    @objc func keyboardDidShow (notification : Notification){
    let info : NSDictionary = notification.userInfo! as NSDictionary
    let keyboardHeight = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.height
    
    UIView.animate(withDuration: 0.8, animations: {
    self.answerView.frame.origin.y = self.view.frame.height - keyboardHeight - self.answerView.frame.height
        self.view.layoutIfNeeded()
    }, completion: { (complete) in})
    }//keyboard Did Show
    
    @objc func keyboardWillHide (notification : Notification){
    //position Next Button when keyBoard disappears
        UIView.animate(withDuration: 0.8, animations: {
            self.answerView.frame.origin.y = self.questionViewHeight.constant
            self.view.layoutIfNeeded()
        }, completion: { (complete) in})
        
    }//keyboard Will Hide
    
    //when app goes to background - close keyboard
    @objc func appMovedToBackground(){
        self.answerField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

    @IBAction func onClickCheck(_ sender: Any) {
    }
 

}
