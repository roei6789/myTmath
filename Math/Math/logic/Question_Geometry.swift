//
//  Question_Geometry.swift
//  Math
//
//  Created by Maor Dascalu on 9.3.2018.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//



import Foundation

class Question_Geometry: Question {
    var Picture : String
    init(Title:String , Number:Int , Explantion:String,
         Answer_Correct:Int, Attempts:Int, Picture:String) {
        self.Picture = Picture
        super.init(Title: Title)
        self.Title = Title
        self.Number = Number
        self.Explanation = Explantion
        self.Answer_Correct = Answer_Correct
        self.Attempts = Attempts
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let Number = aDecoder.decodeInteger(forKey: "Number")
        let Title1 = aDecoder.decodeObject(forKey: "Title") as! String
        let Explanation = aDecoder.decodeObject(forKey: "Explanation") as! String
        let Answer_Correct = aDecoder.decodeInteger(forKey: "Answer_Correct")
        let Attempts = aDecoder.decodeInteger(forKey: "Attempts")
       // let Picture = aDecoder.decodeObject(forKey: "Picture") as! String
        var Picture  = aDecoder.decodeObject(forKey: "Picture")
        if Picture == nil {
            Picture = ""
        }
        self.init(Title: Title1, Number: Number, Explantion: Explanation, Answer_Correct: Answer_Correct, Attempts: Attempts, Picture: Picture as! String)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(Title, forKey: "Title")
        aCoder.encode(Number, forKey: "Number")
        aCoder.encode(Explanation, forKey: "Explanation")
        aCoder.encode(Answer_Correct, forKey: "Answer_Correct")
        aCoder.encode(Attempts, forKey: "Attempts")
        aCoder.encode(isCurrect, forKey: "isCurrect")
        aCoder.encode(Picture, forKey: "Picture")
    }

    
    
}

