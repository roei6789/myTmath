//
//  AboutVC.swift
//  Math
//
//  Created by Aviv Maor on 5/8/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var scoreLable: UIButton!
    
    @IBOutlet weak var bookImg: UIImageView!
    @IBOutlet weak var grandmaImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI
        navigationController?.navigationBar.isHidden = true
        settingsButton.isHidden = true
        scoreLable.isHidden = true
        bookImg.layer.cornerRadius = 14
        grandmaImg.layer.cornerRadius = CGFloat(14)
//        grandmaImg.layer.backgroundColor
//        grandmaImg.layer.borderColor
//        grandmaImg.layer.borderWidth
//        grandmaImg.layer.shadowColor
//        grandmaImg.layer.shadowOffset
//        grandmaImg.layer.shadowRadius
//        grandmaImg.layer.shadowOpacity
//        grandmaImg.layer.shadowPath = CGPath.init(roundedRect: CGRect.init(x: 25, y: 150, width: 120, height: 120), cornerWidth: CGFloat.init(14), cornerHeight: CGFloat(14), transform: nil)
//        grandmaImg.layer.layoutIfNeeded()
    }


    
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
