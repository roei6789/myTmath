//
//  ThinkNSolve_2_VC.swift
//  Math
//
//  Created by Aviv Maor on 4/1/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class ThinkNSolve_2_VC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

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
    

}
