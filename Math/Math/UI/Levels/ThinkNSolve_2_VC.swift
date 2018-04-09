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
    @IBOutlet weak var answerLable: UILabel!
    
    @IBOutlet weak var signField_1: UITextField!
    @IBOutlet weak var signField_2: UITextField!
    @IBOutlet weak var signField_3: UITextField!
    
    @IBOutlet weak var pickerView_1: UIPickerView!
    @IBOutlet weak var pickerView_2: UIPickerView!
    @IBOutlet weak var pickerView_3: UIPickerView!
    
    @IBOutlet weak var leftClose: UIButton!
    @IBOutlet weak var rightClose: UIButton!
    
    
    //initiolize variables
    let thisGame = Game.sharedInstance
    var selectedWorld = -1
    var SelectedQuestion = -1
    var thisQuestion :  Question_Thinks_solve_2?
    var questionNumber : Int = -1
    var correctAnwer : Int = -1
    var attemps : Int =  -1
    var isCorrect = false
    //think N solve 2 vars
    var Num_1:String = "1"
    var Num_2:String = "1"
    var Num_3:String = "1" 
    var Num_4:String = "1"
    var answer:String = "1"
    var operator_1:String = "+"
    var operator_2:String = "+"
    var operator_3:String = "+"
    var firstClose:Bool = false
    var lastClose:Bool = false
    
    let signes = ["+", "-", "X", ":"]
    let signesExtra = ["+", "-", "X", ":",
                       ")+", "+(", ")+(",
                       ")-", "-(", ")-(",
                       ")X", "X(", ")x(",
                       "):", ":(", "):("]
    var indexOn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initiolize variables
        selectedWorld = thisGame.SelectedWorld
        SelectedQuestion  = thisGame.SelectedQuestion
//        questionNumber = (thisQuestion?.Number)!
//        correctAnwer = (thisQuestion?.Answer_Correct)!
//        attemps = (thisQuestion?.Attempts)!
        thisQuestion = thisGame.getQuestion(world: selectedWorld, question: SelectedQuestion) as? Question_Thinks_solve_2 //need to check for nil
        //Think N Solve 2 var initiolize
        self.Num_1 = (thisQuestion?.Num_1)!
        self.Num_2 = (thisQuestion?.Num_2)!
        self.Num_3 = (thisQuestion?.Num_3)!
        self.Num_4 = (thisQuestion?.Num_4)!
        self.answer = String(thisQuestion?.Answer_Correct as! Int)
        self.operator_1 = (thisQuestion?.operator_1)!
        self.operator_2 = (thisQuestion?.operator_2)!
        self.operator_3 = (thisQuestion?.operator_3)!
        self.firstClose = (thisQuestion?.firstClose)!
        self.lastClose = (thisQuestion?.lastClose)!
        
        //UI initiolize
        //navigation bar
//        self.navigationController?.isNavigationBarHidden = true
        
        //question data
        self.titleLable.text  = thisQuestion?.Title
        self.questionLable.text = thisQuestion?.Explanation
        
        self.numberLabel_1.text = Num_1
        self.numberLabel_2.text = Num_2
        self.numberLabel_3.text = Num_3
        self.answerLable.text = "= " + answer
        
        //remove the visual effect at start
        effect = visualEffect.effect
        self.visualEffect.alpha = 0
        visualEffect.effect = nil
        //accecability labels
        pickerView_1.accessibilityLabel = "1"
        pickerView_2.accessibilityLabel = "2"
        pickerView_3.accessibilityLabel = "3"
        //brackets buttons
        self.rightClose.setTitleColor(UIColor.gray, for: UIControlState.normal)
        self.rightClose.setTitleColor(UIColor.black, for: UIControlState.selected)
        self.leftClose.setTitleColor(UIColor.gray, for: UIControlState.normal)
        self.leftClose.setTitleColor(UIColor.black, for: UIControlState.selected)
        
        
        

    }
    // MARK: OnClick Methods.
    @IBAction func onClickCheck(_ sender: Any) {
        if(checkValidInput()){
            //stop watch + visual effect
            thisQuestion?.Attempts = (thisQuestion?.Attempts)! + 1
            //check answer
            if(checkAnswer()){
                //correct answer!!
                correctAnswer()
                //animate in
                animateIn(animateView: rightAnwerView)
            }
            else{
                //Incorrect answer
                animateIn(animateView: wrongAnswerView)
            }
        }
    }
    
    @IBAction func onClickLeftClose(_ sender: Any) {
    }
    
    // MARK: Sub Views Methods.
    
    @IBAction func onClickNextLevel(_ sender: Any) {
    }
    @IBAction func onClickBack(_ sender: Any) {
        if isCorrect{
            animateOut(animateView: rightAnwerView)
        }
        else {
            animateOut(animateView: wrongAnswerView)
        }
        
    }
    @IBAction func onClickTryAgain(_ sender: Any) {
        //animate out
    }
    

    @IBAction func onClickBracket(_ sender: UIButton) {
        if sender.isSelected{
          sender.isSelected = false
        }
        else{
            sender.isSelected = true
        }
            
    }
    
    
    // MARK: Private Methods.
    fileprivate func checkAnswer() -> Bool{
        if (signField_1.text == operator_1 && signField_2.text == operator_2 && signField_3.text == operator_3){
            return true
        }
        return false
    }
    
    fileprivate func checkValidInput() -> Bool {
        var valid = false
        if (signField_1.text != "" && signField_2.text != "" && signField_3.text != "" ) {
            valid = true
        }
        return valid
    }
    
    func correctAnswer (){
        thisQuestion?.isCurrect = true
        thisGame.Player?.addPoint()
        thisGame.updateGame(user: thisGame.Player!, game: thisGame, worldNum: selectedWorld, levelNum: SelectedQuestion, question: thisQuestion!)
    }
    
    // MARK: Picker Methods.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.accessibilityLabel == "2" {
            return self.signesExtra.count
        }
        return self.signes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.accessibilityLabel == "2" {
            return self.signesExtra[row]
        }
        return self.signes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.accessibilityLabel {
        case "1":
            self.signField_1.text = signes[row]
        case "2":
            self.signField_2.text = signesExtra[row]
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

    // MARK: Keyboard Methods.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}
