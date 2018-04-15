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
    
    required convenience init(coder aDecoder: NSCoder) {
        let Number = aDecoder.decodeInteger(forKey: "Number")
        let Title1 = aDecoder.decodeObject(forKey: "Title") as! String
        let Explanation = aDecoder.decodeObject(forKey: "Explanation") as! String
        let Answer_Correct = aDecoder.decodeInteger(forKey: "Answer_Correct")
        let Attempts = aDecoder.decodeInteger(forKey: "Attempts")
        let Num_1 = aDecoder.decodeObject(forKey: "Num_1") as! String
        let Num_2 = aDecoder.decodeObject(forKey: "Num_2") as! String
        let Num_3 = aDecoder.decodeObject(forKey: "Num_3") as! String
        let Num_4 = aDecoder.decodeObject(forKey: "Num_4") as! String
        let operator_1 = aDecoder.decodeObject(forKey: "operator_1") as! String
        let operator_2 = aDecoder.decodeObject(forKey: "operator_2") as! String
        let operator_3 = aDecoder.decodeObject(forKey: "operator_3") as! String
        let firstClose = aDecoder.decodeBool(forKey: "firstClose")
        let lastClose = aDecoder.decodeBool(forKey: "lastClose")
        self.init(Title: Title1, Number: Number, Explantion: Explanation, Answer_Correct: Answer_Correct, Attempts: Attempts, Num_1: Num_1, Num_2: Num_2, Num_3: Num_3, Num_4: Num_4, operator_1: operator_1, operator_2: operator_2, operator_3: operator_3, firstClose: firstClose, lastClose: lastClose)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(Title, forKey: "Title")
        aCoder.encode(Number, forKey: "Number")
        aCoder.encode(Explanation, forKey: "Explanation")
        aCoder.encode(Answer_Correct, forKey: "Answer_Correct")
        aCoder.encode(Attempts, forKey: "Attempts")
        aCoder.encode(isCurrect, forKey: "isCurrect")
        aCoder.encode(Num_1, forKey: "Num_1")
        aCoder.encode(Num_2, forKey: "Num_2")
        aCoder.encode(Num_3, forKey: "Num_3")
        aCoder.encode(Num_4, forKey: "Num_4")
        aCoder.encode(operator_1, forKey: "operator_1")
        aCoder.encode(operator_2, forKey: "operator_2")
        aCoder.encode(operator_3, forKey: "operator_3")
        aCoder.encode(firstClose, forKey: "firstClose")
        aCoder.encode(lastClose, forKey: "lastClose")
    }
}
