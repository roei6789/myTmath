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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
