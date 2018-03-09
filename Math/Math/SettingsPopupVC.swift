//
//  SettingsPopupVC.swift
//  Math
//
//  Created by Aviv Maor on 3/9/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class SettingsPopupVC: UIViewController {

    @IBOutlet weak var popup: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //ui editing
        self.popup.layer.cornerRadius = 10
        
    }

    @IBAction func dismissPopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
