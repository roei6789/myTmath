//
//  User.swift
//  Math
//
//  Created by Maor Dascalu on 9.3.2018.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import Foundation
import UIKit
class User {
 //   var ID: Int
    var First_Name: String = "no name"
    var Last_Name: String = "no name"
    var User_name:String = "no name"
    var Points: Int
    var Level:String
  //  var Last_login_date:Date
    
    init(First_name:String , Last_name:String , User_name:String) {
        self.First_Name = First_name
        self.Last_Name = Last_name
        self.User_name = User_name
        self.Points = 0
        self.Level = "מתחיל"
        
    }
    
    func Get_points() -> Int {
        return self.Points
    }
    func Get_points(Points:Int) {
        self.Points = Points
    }
    func Get_Level() -> String {
        return self.Level
    }
    
    func addPoint() {
        self.Points = self.Points + 1
        updateLevel()
    }

    func updateLevel() {
        if self.Points < 7 {
          self.Level = "מתחיל"
        }
        if self.Points > 6 && self.Points < 15 {
         self.Level = "בינוני"
        }
        if self.Points > 14 {
         self.Level = "איינשטיין"
        }
    }
    
}

