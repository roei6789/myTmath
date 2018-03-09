//
//  riddleVC.swift
//  Math
//
//  Created by Aviv Maor on 2/17/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class riddleVC: UIViewController {

    @IBOutlet weak var riddleTitle: UILabel!
    
    @IBOutlet weak var riddleQuestion: UILabel!
    
    @IBOutlet weak var riddleIMG: UIImageView!
    
    @IBOutlet weak var answerField: UITextField!
    
    @IBOutlet weak var checkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.riddleTitle.text = riddles[myIndex]
        self.riddleIMG.image = UIImage(named : "level1")
        self.answerField.placeholder = "0"
        self.answerField.keyboardType = UIKeyboardType.numberPad
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickCheck(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
