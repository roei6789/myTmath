//
//  User.swift
//  Math
//
//  Created by Maor Dascalu on 9.3.2018.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import Foundation
import UIKit
class  Question {
    //  var ID: Int
    var Title: String = ""
    var Number:Int = 0
    var Explanation: String = ""
    var Answer_Correct:Int = 0
    var Attempts:Int = 0
    var isCurrect: Bool = false
    //var Time_taken:Timer
    
    init(Title:String) {
        self.Title = Title
    }
}



