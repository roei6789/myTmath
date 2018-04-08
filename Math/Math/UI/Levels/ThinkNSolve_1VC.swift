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
//        self.navigationController?.isNavigationBarHidden = true
        
        //question data
        self.titleLable.text  = thisQuestion?.Title
        self.questionLable.text = thisQuestion?.Explanation
        self.riddle.text = thisQuestion?.content
    }

    @IBAction func onClickCheck(_ sender: Any) {
        if(checkValidInput()){
            //stop watch + visual effect
            //check answer
            if(checkAnswer()){
                //correct answer!!
            }
            else{
                //Incorrect answer
            }
        }
    }
    
    // MARK: Private Methods.
    fileprivate func checkAnswer() -> Bool{
        return true
    }
    
    fileprivate func checkValidInput() -> Bool {
        var valid = false
        if (answerField.text != ""){
           valid = true
        }
        return valid
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
