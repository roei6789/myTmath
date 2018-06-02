//
//  riddleVC.swift
//  Math
//
//  Created by Aviv Maor on 2/17/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit
import AVFoundation

class riddleVC: UIViewController {
    
    @IBOutlet var settingsView: UIView!
    @IBOutlet weak var volumeMusic: UISlider!
    @IBOutlet weak var volumeSounds: UISlider!

    @IBOutlet var rightAnwerView: UIView!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet var wrongAnswerView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var gameBarImage: UIImageView!
    @IBOutlet weak var gameBarView: UIView!
    
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var riddleTitle: UILabel!
    @IBOutlet weak var riddleQuestion: UILabel!
    @IBOutlet weak var riddleIMG: UIImageView!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var image_top_const: NSLayoutConstraint!
    @IBOutlet weak var answer_Top_Const: NSLayoutConstraint!
    
    //timer
    var time = 0
    var timer = Timer()
    
    //initiolize variables
    let thisGame = Game.sharedInstance
    var selectedWorld = -1
    var SelectedQuestion = -1
    //var thisQuestion :  Question?
    var thisQuestion :  Question_Geometry?
    var questionNumber : Int = -1
    var correctAnwer : Int = -1
    //var attemps : Int =  -1
    var isCorrect = false
    //back from popup indicator
    //var backFromPopup = false
    
    //sounds & music
    var player : AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initiolize variables
        selectedWorld = thisGame.SelectedWorld
        SelectedQuestion  = thisGame.SelectedQuestion
//        questionNumber = (thisQuestion?.Number)!
//        correctAnwer = (thisQuestion?.Answer_Correct)!
        
        thisQuestion = thisGame.getQuestion(world: selectedWorld, question: SelectedQuestion) as? Question_Geometry //need to check for nil
        //attemps = thisQuestion!.Attempts
        
        //UI initiolize
        //navigation bar
        self.navigationController?.navigationBar.isHidden = true
        //popup views
        settingsView.layer.cornerRadius = 14
        rightAnwerView.layer.cornerRadius = 14
        wrongAnswerView.layer.cornerRadius = 14
        retryButton.layer.borderColor = UIColor.black.cgColor
        retryButton.layer.borderWidth = CGFloat(0.8)
        retryButton.layer.cornerRadius = 8
        //UI - text field
        answerField.layer.cornerRadius = 13
        answerField.layer.borderWidth = CGFloat(2)
        answerField.layer.borderColor = UIColor.black.cgColor
        //question data
        self.riddleTitle.text = thisQuestion?.Title
        self.riddleQuestion.text = thisQuestion?.Explanation
        self.riddleIMG.image = UIImage(named : (thisQuestion?.Picture)!)
        
        //abserver for keyboard
        let center : NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        center.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)

        startTimer()
        //sounds & music
        player = thisGame.musicPlayer
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        startTimer()
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
        if (answerField.text != "" ){
            valid = true
        }
        return valid
    }
   
 
    // MARK: OnClick Methods.
    @IBAction func onClickCheck(_ sender: Any) {
        self.view.endEditing(true)
        if(checkValidInput()){
            //stop watch + visual effect
            thisQuestion?.Attempts = (thisQuestion?.Attempts)! + 1
            //check answer
            clearUIForPopup()
            if(checkAnswer()){
                //correct answer!!
                //update question
                correctAnswer()
                //animate in
                animateIn(animateView: rightAnwerView)
            }
            else{
                //Incorrect answer
                wrongAnswer()
            }
        }
    }
    
    // MARK: Private Methods.
    //update question
    func correctAnswer (){
        thisQuestion?.isCurrect = true
        thisGame.Player?.addPoint()
        thisGame.updateGame(user: thisGame.Player!, game: thisGame, worldNum: selectedWorld, levelNum: SelectedQuestion, question: thisQuestion!)
    }
    
    func wrongAnswer(){
        animateIn(animateView: wrongAnswerView)
    }
    @IBAction func onClickPause(_ sender: Any) {
        self.view.endEditing(true)
        pauseTimer()
        clearUIForPopup()
        animateIn(animateView: settingsView)
}
    
    @IBAction func onClickBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickNextLevel(_ sender: Any) {
        thisQuestion?.didPressNext = true
        thisGame.updateGame(user: thisGame.Player!, game: thisGame, worldNum: selectedWorld, levelNum: SelectedQuestion, question: thisQuestion!)
        navigationController?.popViewController(animated: false)
        
    }
    
    @IBAction func onClickBackToLevel(_ sender: Any) {
        animateOut(animateView: settingsView)
        restoreUIFromPopup()
        startTimer()
    }
    
//    @IBAction func onClickBack(_ sender: Any) {
//        if isCorrect{
//            animateOut(animateView: rightAnwerView)
//        }
//        else {
//            animateOut(animateView: wrongAnswerView)
//        }
//        restoreUIFromPopup()
//        navigationController?.popViewController(animated: true)
//    }
    
    @IBAction func onClickTryAgain(_ sender: Any) {
        //animate out
        animateOut(animateView: wrongAnswerView)
        restoreUIFromPopup()
        startTimer()
    }
    
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
            animateView.alpha = 1
            //resizing view
            animateView.transform = CGAffineTransform.identity
        }
    }
    
    //animate  view out
    func animateOut(animateView : UIView){
        UIView.animate(withDuration: 0.3, animations: {
            animateView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            //            self.visualEffect.alpha = 0
            animateView.alpha = 0
            //            self.visualEffect.effect = nil
        }) { (succees : Bool) in
            animateView.removeFromSuperview()
        }
    }
    

    // MARK: private Methods.
    //UI changes for popup
    func clearUIForPopup() {
        gameBarImage.isHidden = true
        gameBarView.isHidden = true
        questionView.isHidden = true
        answerView.isHidden = true
        backButton.isHidden = false
    }
    //UI changes for popup
    func restoreUIFromPopup() {
        gameBarImage.isHidden = false
        gameBarView.isHidden = false
        questionView.isHidden = false
        answerView.isHidden = false
        backButton.isHidden = true
    }
    
    // MARK: keyboard Methods.
    @objc func keyboardDidShow (notification : Notification){
//        let info : NSDictionary = notification.userInfo! as NSDictionary
//        let keyboardHeight = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.height
        
        UIView.animate(withDuration: 0.8, animations: {
            //    self.answerView.frame.origin.y = self.view.frame.height - keyboardHeight - self.answerView.frame.height
            self.riddleQuestion.isHidden = true
            self.image_top_const.constant = CGFloat(5)
            self.answer_Top_Const.constant = CGFloat(300)
            //self.answerView.frame.origin.y = (self.answerView.frame.origin.y - 130)
            self.view.layoutIfNeeded()
        }, completion: { (complete) in})
        
    }//keyboard Did Show
    
    @objc func keyboardWillHide (notification : Notification){
        //position Next Button when keyBoard disappears
        UIView.animate(withDuration: 0.8, animations: {
            //self.answerView.frame.origin.y = self.questionViewHeight.constant
            self.riddleQuestion.isHidden = false
            self.image_top_const.constant = CGFloat(115)
            self.answer_Top_Const.constant = CGFloat(430)
            //move up answer filed - change this
           // self.answerView.frame.origin.y = (self.answerView.frame.origin.y + 130)
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
    
    // MARK: Music Methods.
    
    @IBAction func musicVolumeDidChange(_ sender: Any) {
        let value = self.volumeMusic.value
        player.setVolume(value, fadeDuration: 0.0)
    }
    
    @IBAction func soundsVolumeDidChange(_ sender: Any) {
        let value = self.volumeSounds.value
        //player.setVolume(value, fadeDuration: 0.0)
    }
    
    // MARK: Timer Methods.
    func startTimer () {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerAddSecond), userInfo: nil, repeats: true)
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        timer.invalidate()
        time = 0
    }
    
    @objc func TimerAddSecond(){
        time += 1
        timerLabel.text = String(time)
    }
    
}
