//
//  User.swift
//  Math
//
//  Created by Maor Dascalu on 9.3.2018.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import Foundation
import UIKit
class Worlds {
    var ID:Int
    var Name:String
    var Array_Questions: [Question]
    var picture:String
    var Number_of_q_answrd:Int
    var Number_of_q_in_world:Int
    init(ID:Int , Name:String , Array_Questions:[Question],
         picture:String) {
        self.ID = ID
        self.Name = Name
        self.Array_Questions = Array_Questions
        self.picture = picture
        self.Number_of_q_answrd = 0
        self.Number_of_q_in_world = self.Array_Questions.count
    }
}


