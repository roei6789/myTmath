//
//  ThinkNSolve_1VC.swift
//  Math
//
//  Created by Aviv Maor on 4/1/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class ThinkNSolve_1VC: UIViewController {

    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var riddle: UILabel!
    @IBOutlet weak var answerField: UITextField!
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var titleViewHeightConst: NSLayoutConstraint!
    @IBOutlet weak var questionViewHeightConst: NSLayoutConstraint!
    
    //initiolize variables
    let thisGame = Game.sharedInstance
    var selectedWorld = -1
    var SelectedQuestion = -1
    //var thisQuestion :  Question?
    var thisQuestion :  Question_Thinks_solve?
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
        thisQuestion = thisGame.getQuestion(world: selectedWorld, question: SelectedQuestion) as? Question_Thinks_solve //need to check for nil
        
        //UI initiolize
        //navigation bar
        self.navigationController?.isNavigationBarHidden = true
        //UI - text field
        answerField.layer.cornerRadius = 13
        answerField.layer.borderWidth = CGFloat(2)
        answerField.layer.borderColor = UIColor.black.cgColor
        
        //question data
        self.titleLable.text  = thisQuestion?.Title
        self.questionLable.text = thisQuestion?.Explanation
        self.riddle.text = (thisQuestion?.content)! + "= "
        
        //abserver for keyboard
        let center : NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        center.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)
    }

    @IBAction func onClickCheck(_ sender: Any) {
        if(checkValidInput()){
            //stop watch + visual effect
            thisQuestion?.Attempts = (thisQuestion?.Attempts)! + 1
            //check answer
            if(checkAnswer()){
                //correct answer!!
                correctAnswer()
            }
            else{
                //Incorrect answer
                 wrongAnswer()
                
            }
        }
    }
    @IBAction func onClickBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    // MARK: Private Methods.
    fileprivate func checkAnswer() -> Bool{
        if let correct : Int = thisQuestion?.Answer_Correct{
            let strCorrect :String = String(correct)
            if answerField.text == strCorrect{
                return true
            }
            else{
                return false
            }
        }
        return false
    }
    
    fileprivate func checkValidInput() -> Bool {
        var valid = false
        if (answerField.text != ""){
           valid = true
        }
        return valid
    }
    
    func correctAnswer (){
        performSegue(withIdentifier: "showCorrectAnswerView", sender: self)
        thisQuestion?.isCurrect = true
        thisGame.Player?.addPoint()
        thisGame.updateGame(user: thisGame.Player!, game: thisGame, worldNum: selectedWorld, levelNum: SelectedQuestion, question: thisQuestion!)
    }
    
    func wrongAnswer(){
        performSegue(withIdentifier: "showWrongAnswerView", sender: self)
    }

    // MARK: Keyboard Methods.
    @objc func keyboardDidShow (notification : Notification){
        let info : NSDictionary = notification.userInfo! as NSDictionary
        let keyboardHeight = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.height
        
        UIView.animate(withDuration: 0.8, animations: {
         //  self.titleViewHeightConst.constant = CGFloat(100)
            self.questionViewHeightConst.constant = CGFloat(100)
          //  self.checkButton.frame.origin.y = CGFloat(270)
            self.view.layoutIfNeeded()
        }, completion: { (complete) in})
    }//keyboard Did Show
    
    @objc func keyboardWillHide (notification : Notification){
        //position Next Button when keyBoard disappears
        UIView.animate(withDuration: 0.8, animations: {
            //self.titleViewHeightConst.constant = CGFloat(150)
            self.questionViewHeightConst.constant = CGFloat(250)
          //  self.checkButton.frame.origin.y = CGFloat(570)
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
    
}
