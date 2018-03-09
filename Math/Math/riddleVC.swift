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
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var steper: UIStepper!
    @IBOutlet weak var checkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.riddleTitle.text = riddles[myIndex]
        self.riddleIMG.image = UIImage(named : "level1")
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickCheck(_ sender: Any) {
    }
 

}
