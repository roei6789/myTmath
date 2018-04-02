//
//  Question_Thinks_solve_2.swift
//  Math
//
//  Created by Maor Dascalu on 2.4.2018.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import Foundation

class Question_Thinks_solve_2: Question {
    var Num_1:String
    var Num_2:String
    var Num_3:String
    var Num_4:String
    var operator_1:String
    var operator_2:String
    var operator_3:String
    var firstClose:Bool
    var lastClose:Bool
    
    // var Picture:String
    init(Title:String , Number:Int , Explantion:String,
         Answer_Correct:Int, Attempts:Int , Num_1:String, Num_2:String, Num_3:String,Num_4:String, operator_1:String, operator_2:String,operator_3:String, firstClose:Bool, lastClose:Bool) {
        self.Num_1 = Num_1
        self.Num_2 = Num_2
        self.Num_3 = Num_3
        self.Num_4 = Num_4
        self.operator_1 = operator_1
        self.operator_2 = operator_2
        self.operator_3 = operator_3
        self.firstClose = firstClose
        self.lastClose = lastClose
        super.init(Title: Title)
        self.Title = Title
        self.Number = Number
        self.Explanation = Explantion
        self.Answer_Correct = Answer_Correct
        self.Attempts = Attempts
        //self.Time_taken = Time_taken
    }
}
