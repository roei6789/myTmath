//
//  User.swift
//  Math
//
//  Created by Maor Dascalu on 9.3.2018.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import Foundation
import UIKit
class  Question : NSObject, NSCoding{
    //  var ID: Int
    var Title: String = ""
    var Number:Int = 0
    var Explanation: String = ""
    var Answer_Correct:Int = 0
    var Attempts:Int = 0
    var isCurrect: Bool = false
    var didPressNext : Bool = false
    //var Time_taken:Timer
    
    init(Title:String) {
        self.Title = Title
    }
    
    required convenience init(coder aDecoder: NSCoder) {
         let Title1 = aDecoder.decodeObject(forKey: "Title") as! String
//        _ = aDecoder.decodeInteger(forKey: "Number")
//        let Explanation = aDecoder.decodeObject(forKey: "Explanation") as! String
//        let Answer_Correct = aDecoder.decodeInteger(forKey: "Answer_Correct")
//        let Attempts = aDecoder.decodeInteger(forKey: "Attempts")
//        let isCurrect = aDecoder.decodeBool(forKey: "isCurrect")
        self.init(Title: Title1)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(Title, forKey: "Title")
//        aCoder.encode(Number, forKey: "Number")
//        aCoder.encode(Explanation, forKey: "Explanation")
//        aCoder.encode(Answer_Correct, forKey: "Answer_Correct")
//        aCoder.encode(Attempts, forKey: "Attempts")
//        aCoder.encode(isCurrect, forKey: "isCurrect")
    }
}



