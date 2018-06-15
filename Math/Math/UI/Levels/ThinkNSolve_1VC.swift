//
//  ThinkNSolve_1VC.swift
//  Math
//
//  Created by Aviv Maor on 4/1/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit
import AVFoundation

class ThinkNSolve_1VC: UIViewController {

    @IBOutlet var settingsView: UIView!
    @IBOutlet weak var volumeMusic: UISlider!
    @IBOutlet weak var volumeSounds: UISlider!
    
    @IBOutlet var rightAnwerView: UIView!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet var wrongAnswerView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var gameBarImage: UIImageView!
    @IBOutlet weak var gameBarView: UIView!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
     @IBOutlet weak var giftImg: UIImageView!
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var riddle: UILabel!
    @IBOutlet weak var answerField: UITextField!
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var titleViewHeightConst: NSLayoutConstraint!
    @IBOutlet weak var questionViewHeightConst: NSLayoutConstraint!
    
    //timer
    var time = 0
    var timer = Timer()
    
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
    
    //sounds & music
    var musicPlayer : AVAudioPlayer = AVAudioPlayer()
    var musicPlayerCorrect : AVAudioPlayer = AVAudioPlayer()
    var musicPlayerIncorrect : AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //initiolize variables
        selectedWorld = thisGame.SelectedWorld
        SelectedQuestion  = thisGame.SelectedQuestion
        thisQuestion = thisGame.getQuestion(world: selectedWorld, question: SelectedQuestion) as? Question_Thinks_solve //need to check for nil
        questionNumber = SelectedQuestion + 1 //(thisQuestion?.Number)!
        isCorrect = (thisQuestion?.isCurrect)!
        //        correctAnwer = (thisQuestion?.Answer_Correct)!
        //        attemps = (thisQuestion?.Attempts)!
        
        //UI initiolize
        //navigation bar
        self.navigationController?.isNavigationBarHidden = true
        //UI popup views
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
        self.titleLable.text  = thisQuestion?.Title
        self.questionLable.text = thisQuestion?.Explanation
        self.riddle.text = (thisQuestion?.content)! + "= "
        self.questionNumberLabel.text = String(questionNumber)
        if isCorrect {
            self.giftImg.image = UIImage(named: "gift_green")
        }
        
        //abserver for keyboard
        let center : NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        center.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)
        
        startTimer()
        //sounds & music
        musicPlayer = thisGame.musicPlayer
        musicPlayerCorrect = thisGame.musicPlayerCorrect
        musicPlayerIncorrect = thisGame.musicPlayerIncorrect
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    // MARK: OnClick Methods.
    @IBAction func onClickCheck(_ sender: Any) {
        self.view.endEditing(true)
        if(checkValidInput()){
            //stop watch + visual effect
            pauseTimer()
            thisQuestion?.Attempts = (thisQuestion?.Attempts)! + 1
            clearUIForPopup()
            //check answer
            if(checkAnswer()){
                //correct answer!!
                correctAnswer()
                //animate in
                musicPlayerCorrect.play()
                animateIn(animateView: rightAnwerView)
            }
            else{
                //Incorrect answer
                musicPlayerIncorrect.play()
                 wrongAnswer()
            }
        }
    }
    @IBAction func onClickBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickPause(_ sender: Any) {
        self.view.endEditing(true)
        pauseTimer()
        clearUIForPopup()
        animateIn(animateView: settingsView)
    }
    
    @IBAction func onClickBackToLevel(_ sender: Any) {
        animateOut(animateView: settingsView)
        restoreUIFromPopup()
        startTimer()
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
        thisQuestion?.isCurrect = true
        thisGame.Player?.addPoint()
        thisGame.updateGame(user: thisGame.Player!, game: thisGame, worldNum: selectedWorld, levelNum: SelectedQuestion, question: thisQuestion!)
    }
    
    func wrongAnswer(){
       animateIn(animateView: wrongAnswerView)
    }
    
    //UI changes for popup
    func clearUIForPopup() {
        gameBarImage.isHidden = true
        gameBarView.isHidden = true
        titleView.isHidden = true
        questionView.isHidden = true
        checkButton.isHidden = true
        backButton.isHidden = false
    }
    //UI changes for popup
    func restoreUIFromPopup() {
        gameBarImage.isHidden = false
        gameBarView.isHidden = false
        titleView.isHidden = false
        questionView.isHidden = false
        checkButton.isHidden = false
        backButton.isHidden = true
    }
    
    // MARK: Sub Views Methods.
    
    @IBAction func onClickNextLevel(_ sender: Any) {
        thisQuestion?.didPressNext = true
        thisGame.updateGame(user: thisGame.Player!, game: thisGame, worldNum: selectedWorld, levelNum: SelectedQuestion, question: thisQuestion!)
        navigationController?.popViewController(animated: false)
        
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
            animateView.alpha = 1
            //resizing view
            animateView.transform = CGAffineTransform.identity
        }
    }
    
    //animate  view out
    func animateOut(animateView : UIView){
        UIView.animate(withDuration: 0.3, animations: {
            animateView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            animateView.alpha = 0
        }) { (succees : Bool) in
            animateView.removeFromSuperview()
        }
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
    
    func resumeTimer () {
        timer.fire()
    }
    
    @objc func TimerAddSecond(){
        time += 1
        timerLabel.text = String(time)
    }
    
    
    // MARK: Keyboard Methods.
    @objc func keyboardDidShow (notification : Notification){        
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
    // MARK: Music Methods.
    
    @IBAction func musicVolumeDidChange(_ sender: Any) {
        let value = self.volumeMusic.value
        musicPlayer.setVolume(value, fadeDuration: 0.0)
    }
    
    @IBAction func soundsVolumeDidChange(_ sender: Any) {
        let value = self.volumeSounds.value
        musicPlayerCorrect.setVolume(value, fadeDuration: 0.0)
        musicPlayerIncorrect.setVolume(value, fadeDuration: 0.0)
    }
    
}
