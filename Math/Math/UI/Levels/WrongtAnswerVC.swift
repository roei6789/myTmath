//
//  WrongtAnswerVC.swift
//  Math
//
//  Created by Aviv Maor on 4/13/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class WrongtAnswerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func dismissPopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }

}
