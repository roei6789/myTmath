//
//  User.swift
//  Math
//
//  Created by Maor Dascalu on 9.3.2018.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import Foundation
import UIKit
class Worlds : NSObject , NSCoding {

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
    
    func getUserPoints() -> Int{
        UpdateUserPoints()
        return self.Number_of_q_answrd
    }
    
    func UpdateUserPoints(){
        var points = 0
        for question in Array_Questions{
            if question.isCurrect{
                points += 1
            }
        }
        self.Number_of_q_answrd = points
    }
    
    func getUserCurrectQ() -> [Bool]{
        var q_correct : [Bool] = []
        for q in Array_Questions{
            q_correct.append(q.isCurrect)
        }
        return q_correct
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let ID = aDecoder.decodeInteger(forKey: "ID")
        let Name = aDecoder.decodeObject(forKey: "Name") as! String
        let Array_Questions = aDecoder.decodeObject(forKey: "Array_Questions") as! [Question]
        let picture = aDecoder.decodeObject(forKey: "picture") as! String
        _ = aDecoder.decodeInteger(forKey: "Number_of_q_answrd")
        _ = aDecoder.decodeInteger(forKey: "Number_of_q_in_world")
        self.init(ID: ID, Name: Name, Array_Questions: Array_Questions, picture: picture)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(ID, forKey: "ID")
        aCoder.encode(Name, forKey: "Name")
        aCoder.encode(Array_Questions, forKey: "Array_Questions")
        aCoder.encode(picture, forKey: "picture")
        aCoder.encode(Number_of_q_answrd, forKey: "Number_of_q_answrd")
        aCoder.encode(Number_of_q_in_world, forKey: "Number_of_q_in_world")
    }
}


