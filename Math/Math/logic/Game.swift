//
//  Game.swift
//  Math
//
//  Created by Maor Dascalu on 25.3.2018.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import Foundation
import AVFoundation

class Game {

    let Player : User?
    var WorldsList : [Worlds] = []
    var SelectedWorld = -1
    var SelectedQuestion = -1
    static var sharedInstance = Game.init()
    
    //sounds & music
    var musicPlayer : AVAudioPlayer = AVAudioPlayer()
    
    
    init(){
//        //if there is a game stored in mobile data
////        let userDefaults = UserDefaults.standard
////            let decoded  = userDefaults.object(forKey: "WorldsList") as! Data
////            let decodedWorldsList = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Worlds]
////        if (decodedWorldsList.count > 0) {   //(decodedWorldsList != nil)
////            //self.Player = savedPlayer
////            self.Player = User.init(First_name: "", Last_name: "", User_name: "")
////            self.WorldsList = decodedWorldsList
////        }
//        if /*let savedPlayer = UserDefaults.standard.object(forKey: "User") as? User,*/
//            let savedWorlds = UserDefaults.standard.array(forKey: "WorldsList") as? [Worlds]{
//            //self.Player = savedPlayer
//             self.Player = User.init(First_name: "", Last_name: "", User_name: "")
//            self.WorldsList = savedWorlds
//        }
//        else {
//            //intialize game
//           self.Player = User.init(First_name: "", Last_name: "", User_name: "")
//            //call intialize method
//            initWorlds()
//        }
        
        //intialize game
        self.Player = User.init(First_name: "", Last_name: "", User_name: "")
        //call intialize method
        initWorlds()
        getDataFromLocaldb()
        
        //music & sounds
        //sounds & music
        do {
            let audioPath = Bundle.main.path(forResource: "The xx Intro", ofType: "aac")
            try musicPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            
            //            let audioSession = AVAudioSession.sharedInstance()
            //            do{
            //                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            //            }
            //            catch{
            //
            //            }
        }
        catch{
            print("could not find music")
        }
        musicPlayer.prepareToPlay()
        musicPlayer.setVolume(0.5 , fadeDuration: 0.5)
        musicPlayer.numberOfLoops = -1
   }//init
    
    func initWorlds (){
        let q_init = Q_create()
        let world_1 = Worlds.init(ID: 1, Name: "חידות הנדסיות", Array_Questions: q_init.build_QG_Array(), picture: "World1")
        let world_2 = Worlds.init(ID: 2, Name: "חשוב וחשב", Array_Questions: q_init.build_QTS_Array(), picture: "World2")
        let thisworlds : [ Worlds] = [ world_1 ,world_2]
        WorldsList = thisworlds
    }
    
    func getQuestion(world: Int, question:Int) -> (Question){
     let q = self.WorldsList[world].Array_Questions[question]
        return q
    }
    
    func getUserPoints() -> Int{
        var points = 0
        for world in WorldsList{
            points += world.getUserPoints()
        }
        return  points
    }
    
    func getPointsPerWorld(worldNum : Int) -> Int{
        let points = WorldsList[worldNum - 1].getUserPoints()
        return  points
    }
    
    // MARK: Restore Data Methods
    func getDataFromLocaldb(){
        let userDefaults = UserDefaults.standard
        for world in WorldsList{
            if let world_points = userDefaults.array(forKey: world.Name) as? [Bool]{
                var qIndex = 0
                for q in world.Array_Questions{
                    q.isCurrect = world_points[qIndex]
                    qIndex += 1
                }//for
            }//if
        }//for
    }
    
     // MARK: Save / Update Methods.
//    func SaveGame(){
//        let userDefaults = UserDefaults.standard
//        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: self.WorldsList)
//        userDefaults.set(encodedData, forKey: "WorldsList")
//        userDefaults.synchronize()
//    }
    
    func SaveGame(){
        let userDefaults = UserDefaults.standard
        for world in WorldsList{
        userDefaults.set(world.getUserCurrectQ(), forKey: world.Name)
        }
        
    }
    
    func updateGame(user: User, game : Game, worldNum : Int, levelNum : Int, question : Question){
        game.WorldsList[worldNum].Array_Questions[levelNum] = question
        self.WorldsList = game.WorldsList
        
        SaveGame()
        
//        //save in user defualts
//        let userDefaults = UserDefaults.standard
//        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: game.WorldsList)
//        userDefaults.set(encodedData, forKey: "WorldsList")
//        userDefaults.synchronize()

        //UserDefaults.standard.set(game.WorldsList, forKey: "WorldsList")
        //UserDefaults.standard.set(user, forKey: "Player")
        //UserDefaults.standard.synchronize()
    }
    
    func upfateGame(user : User, question: Question){
        UserDefaults.standard.set(user, forKey: "User")
        let thisWorlds = Game.sharedInstance.WorldsList
        thisWorlds[0].Array_Questions[question.Number] = question
        UserDefaults.standard.set(thisWorlds, forKey: "WorldsList")
        UserDefaults.standard.synchronize()
    }
    
    
    }

    
    


