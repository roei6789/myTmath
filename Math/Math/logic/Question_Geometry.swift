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
    
    
}

