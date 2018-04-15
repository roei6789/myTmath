//
//  Question_Thinks_solve.swift
//  Math
//
//  Created by Maor Dascalu on 25.3.2018.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import Foundation

class Question_Thinks_solve: Question {
    
    var content : String
   // var Picture:String
    init(Title:String , Number:Int , Explantion:String,
         Answer_Correct:Int, Attempts:Int ,Content:String) {
        content = Content
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
        let Content = aDecoder.decodeObject(forKey: "Content") as! String
        self.init(Title: Title1, Number: Number, Explantion: Explanation, Answer_Correct: Answer_Correct, Attempts: Attempts, Content: Content)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(Title, forKey: "Title")
        aCoder.encode(Number, forKey: "Number")
        aCoder.encode(Explanation, forKey: "Explanation")
        aCoder.encode(Answer_Correct, forKey: "Answer_Correct")
        aCoder.encode(Attempts, forKey: "Attempts")
        aCoder.encode(isCurrect, forKey: "isCurrect")
        aCoder.encode(content, forKey: "Content")
    }
    
    
}
