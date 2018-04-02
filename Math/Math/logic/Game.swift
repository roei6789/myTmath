//
//  Game.swift
//  Math
//
//  Created by Maor Dascalu on 25.3.2018.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import Foundation

class Game {
    let Player : User
    var currentWorlds : [Worlds]
    var sharedInstance = Game.init()
    init(){
        //if there is a game stored in mobile data
        if let thisGame = UserDefaults.standard.object(forKey: "Game") as? Game {
            self.Player = thisGame.Player
            self.currentWorlds = thisGame.currentWorlds
        }
        else {
            //intialize game
            self.Player = User.init(First_name: "", Last_name: "", User_name: "")
            self.currentWorlds = []
            //call intialize method
        }
   }//init
    
    
}

