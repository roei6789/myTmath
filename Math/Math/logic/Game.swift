//
//  Game.swift
//  Math
//
//  Created by Maor Dascalu on 25.3.2018.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import Foundation

class Game {

    let Player : User?
    var WorldsList : [Worlds] = []
    var SelectedWorld = -1
    var SelectedQuestion = -1
    static var sharedInstance = Game.init()
    init(){
        //if there is a game stored in mobile data
        if let savedPlayer = UserDefaults.standard.object(forKey: "User") as? User,
            let savedWorlds = UserDefaults.standard.object(forKey: "WorldsList") as? [Worlds]{
            self.Player = savedPlayer
            self.WorldsList = savedWorlds
        }
        else {
            //intialize game
           self.Player = User.init(First_name: "", Last_name: "", User_name: "")
//            self.currentWorlds = [:]
            //call intialize method
            initWorlds()
        }
   }//init
    
    func initWorlds (){
        let world_1 = Worlds.init(ID: 1, Name: "חידות הנדסיות", Array_Questions: build_QG_Array(), picture: "World1")
        
         let world_2 = Worlds.init(ID: 2, Name: "חשוב וחשב", Array_Questions: build_QTS_Array(), picture: "World2")
        
        let thisworlds : [ Worlds] = [ world_1 ,world_2]
        WorldsList = thisworlds
    }
    
    func getQuestion(world: Int, question:Int) -> (Question){
     let q = self.WorldsList[world].Array_Questions[question]
        return q
    }
    
    func updateGame(user : User){
        UserDefaults.standard.set(user, forKey: "User")
        UserDefaults.standard.synchronize()
    }
    
    func updateGame(user: User, game : Game, worldNum : Int, levelNum : Int, question : Question){
        let thisGame = game
        let selectedWorld = thisGame.WorldsList[worldNum]
        selectedWorld.Array_Questions[levelNum] = question
        //game.WorldsList[worldNum].Array_Questions[levelNum] = question
        //UserDefaults.standard.set(game.WorldsList, forKey: "WorldsList")
        UserDefaults.standard.set(selectedWorld, forKey: "WorldsList")
        UserDefaults.standard.set(user, forKey: "User")
        UserDefaults.standard.synchronize()
    }
    
    func upfateGame(user : User, question: Question){
        UserDefaults.standard.set(user, forKey: "User")
        let thisWorlds = Game.sharedInstance.WorldsList
        thisWorlds[0].Array_Questions[question.Number] = question
        UserDefaults.standard.set(thisWorlds, forKey: "WorldsList")
        UserDefaults.standard.synchronize()
    }
    
    func build_QG_Array() ->(Array<Question>)  {
        let QG1 =
            Question_Geometry.init(
                Title: "ריבועים בריבוע",
                Number: 1,
                Explantion: "הריבוע הגדול מתחלק לריבועים קטנים, כמה ריבועים בגדלים שונים אתה רואה בשרטוט?",
                Answer_Correct: 14,
                Attempts: 0,
                Picture: "q1.png"
        )
        let QG2 =
            Question_Geometry.init(
                Title: "מלבנים במלבן",
                Number: 2,
                Explantion: "המלבן מחולק ל8 ריבועים. כמה מלבנים שונים ניתן למצוא בשרטוט?",
                Answer_Correct: 19,
                Attempts: 0,
                Picture: "q2.png"
        )
        let QG3 =
            Question_Geometry.init(
                Title: "משולשים במשולש",
                Number: 3,
                Explantion: "בשרטוט משולשים רבים. כמה משולשים אתה רואה?",
                Answer_Correct: 13,
                Attempts: 0,
                Picture: "q3.png"
        )
        let QG4 =
            Question_Geometry.init(
                Title: "צורות הנדסיות",
                Number: 4,
                Explantion: "בשרטוט מסתתרות צורות הנדסיות רבות. כמה משולשים אתה רואה?",
                Answer_Correct: 13,
                Attempts: 0,
                Picture: "q4.png"
        )
        
        let QG5 =
            Question_Geometry.init(
                Title: "צורות הנדסיות",
                Number:5 ,
                Explantion: "בשרטוט מסתתרות צורות הנדסיות רבות. כמה מעויינים אתה רואה?",
                Answer_Correct:9 ,
                Attempts: 0,
                Picture: "q5.png"
        )
        let QG6 =
            Question_Geometry.init(
                Title: "צורות הנדסיות",
                Number:6 ,
                Explantion:"בשרטוט מסתתרות צורות הנדסיות רבות. כמה טרפזים אתה רואה?" ,
                Answer_Correct:18 ,
                Attempts: 0,
                Picture: "q6.png"
        )
        
        let QG7 =
            Question_Geometry.init(
                Title: "ריבועים בריבוע",
                Number:7 ,
                Explantion: "כמה ריבועים בגדלים שונים מסתתרים בשרטוט?",
                Answer_Correct:14 ,
                Attempts: 0,
                Picture: "q7.png"
        )
        let QG8 =
            Question_Geometry.init(
                Title: "ריבועים בריבוע",
                Number:8 ,
                Explantion: "כמה ריבועים בגדלים שונים מסתתרים בשרטוט?",
                Answer_Correct: 30,
                Attempts:0 ,
                Picture: "q8.png"
        )
        
        let QG9 =
            Question_Geometry.init(
                Title: "ריבועים בריבוע",
                Number:9 ,
                Explantion:"כמה ריבועים בגדלים שונים מסתתרים בשרטוט?" ,
                Answer_Correct:55 ,
                Attempts:0 ,
                Picture: "q9.png"
        )
        let QG10 =
            Question_Geometry.init(
                Title: "מעויינים במעוין",
                Number:10 ,
                Explantion: "מעוין מחולק למעוינים קטנים. כמה מעוינים בגדלים שונים מסתתרים בשרטוט?",
                Answer_Correct:30 ,
                Attempts:0 ,
                Picture: "q10.png"
        )
        let QG11 =
            Question_Geometry.init(
                Title: "מלבנים במלבן",
                Number:11 ,
                Explantion: "המלבן מחולק ל12 ריבועים. כמה מלבנים שונים אפשר למצוא בשרטוט?",
                Answer_Correct: 40,
                Attempts:0 ,
                Picture: "q11.png"
        )
        let QG12 =
            Question_Geometry.init(
                Title:"מעוינים במשולש" ,
                Number:12 ,
                Explantion:"כמה מעוינים מסתתרים בשרטוט?",
                Answer_Correct: 21,
                Attempts: 0,
                Picture: "q12.png"
        )
        let QG13 =
            Question_Geometry.init(
                Title:"משולשים במחומש" ,
                Number:13 ,
                Explantion:"במחומש שורטטו אלכסונים, כך נוצרו משולשים רבים. כמה משולשים בשרטוט?",
                Answer_Correct: 35,
                Attempts: 0,
                Picture: "q13.png"
        )
        let QG14 =
            Question_Geometry.init(
                Title:"טרפזים במשולש",
                Number:14 ,
                Explantion:"בתוך השרטוט מסתתרים טרפזים רבים. כמה טרפזים מסתתרים?",
                Answer_Correct: 57,
                Attempts: 0,
                Picture: "q14.png"
        )
        let Question_Geometry_array = [QG1,QG2,QG3,QG4,QG5,QG6,QG7,QG8,QG9,QG10,QG11,QG12,QG13,QG14]
        return(Question_Geometry_array)
    }
    
    func build_QTS_Array() -> Array<Question> {
        let QTS1 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 1,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 11,
            Attempts: 0,
            Content: "9x1+2"
        )
        let QTS2 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 2,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 21,
            Attempts: 0,
            Content: "9x2+3"
        )
        
        let QTS3 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 3,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 31,
            Attempts: 0,
            Content: "9x3+4"
        )
        
        let QTS4 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 4,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 41,
            Attempts: 0,
            Content: "9x4+5"
        )
        
        let QTS5 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 5,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 101,
            Attempts: 0,
            Content: "9x10+11"
        )
        let QTS6 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 6,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 111,
            Attempts: 0,
            Content: "9x11+12"
        )
        let QTS7 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 7,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 121,
            Attempts: 0,
            Content: "9x12+13"
        )
        
        let QTS8 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 8,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 131,
            Attempts: 0,
            Content: "9x13+14"
        )
        
        let QTS9 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 9,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 141,
            Attempts: 0,
            Content: "9x14+15"
        )
        
        let QTS10 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 10,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 151,
            Attempts: 0,
            Content: "9x15+16"
        )
        let QTS_2_11 = Question_Thinks_solve_2.init(
            Title: "בנה את המספר",
            Number: 11,
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. הוסף סוגריים לפי הצורך" ,
            Answer_Correct: 1,
            Attempts: 0,
            Num_1: "1",
            Num_2: "2",
            Num_3: "3",
            Num_4: "4",
            operator_1: "X",
            operator_2: "+",
            operator_3: "-",
            firstClose: false,
            lastClose:false
        )
        
        let QTS_2_12 = Question_Thinks_solve_2.init(
            Title: "בנה את המספר",
            Number: 12,
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. הוסף סוגריים לפי הצורך" ,
            Answer_Correct: 2,
            Attempts: 0,
            Num_1: "1",
            Num_2: "2",
            Num_3: "3",
            Num_4: "4",
            operator_1: "+",
            operator_2: "+",
            operator_3: "-",
            firstClose: false,
            lastClose:false
        )
        
        let QTS_2_13 = Question_Thinks_solve_2.init(
            Title: "בנה את המספר",
            Number: 13,
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. הוסף סוגריים לפי הצורך" ,
            Answer_Correct: 3,
            Attempts: 0,
            Num_1: "1",
            Num_2: "2",
            Num_3: "3",
            Num_4: "4",
            operator_1: "+",
            operator_2: "X",
            operator_3: "-",
            firstClose: false,
            lastClose:false
        )
        
        let QTS_2_14 = Question_Thinks_solve_2.init(
            Title: "בנה את המספר",
            Number: 14,
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. הוסף סוגריים לפי הצורך" ,
            Answer_Correct: 4,
            Attempts: 0,
            Num_1: "1",
            Num_2: "2",
            Num_3: "3",
            Num_4: "4",
            operator_1: "+",
            operator_2: "-",
            operator_3: "+",
            firstClose: false,
            lastClose:false
        )
        
        let QTS_2_15 = Question_Thinks_solve_2.init(
            Title: "בנה את המספר",
            Number: 15,
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. הוסף סוגריים לפי הצורך" ,
            Answer_Correct: 5,
            Attempts: 0,
            Num_1: "4",
            Num_2: "4",
            Num_3: "3",
            Num_4: "4",
            operator_1: "+",
            operator_2: "(:",
            operator_3: "+",
            firstClose: true,
            lastClose:false
        )
        
        let QTS_2_16 = Question_Thinks_solve_2.init(
            Title: "בנה את המספר",
            Number: 16,
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. הוסף סוגריים לפי הצורך" ,
            Answer_Correct: 6,
            Attempts: 0,
            Num_1: "1",
            Num_2: "2",
            Num_3: "3",
            Num_4: "4",
            operator_1: ":",
            operator_2: "X",
            operator_3: "X",
            firstClose: false,
            lastClose:false
        )
        let QTS_2_17 = Question_Thinks_solve_2.init(
            Title: "בנה את המספר",
            Number: 17,
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. הוסף סוגריים לפי הצורך" ,
            Answer_Correct: 1,
            Attempts: 0,
            Num_1: "4",
            Num_2: "4",
            Num_3: "4",
            Num_4: "4",
            operator_1: "+",
            operator_2: "):(",
            operator_3: "+",
            firstClose: true,
            lastClose:true
        )
        let QTS_2_18 = Question_Thinks_solve_2.init(
            Title: "בנה את המספר",
            Number: 18,
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. הוסף סוגריים לפי הצורך" ,
            Answer_Correct: 2,
            Attempts: 0,
            Num_1: "4",
            Num_2: "4",
            Num_3: "4",
            Num_4: "4",
            operator_1: ":",
            operator_2: "+",
            operator_3: ":",
            firstClose: false,
            lastClose:false
        )
        let QTS_2_19 = Question_Thinks_solve_2.init(
            Title: "בנה את המספר",
            Number: 19,
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. הוסף סוגריים לפי הצורך" ,
            Answer_Correct: 3,
            Attempts: 0,
            Num_1: "4",
            Num_2: "4",
            Num_3: "4",
            Num_4: "4",
            operator_1: "+",
            operator_2: "+",
            operator_3: "):",
            firstClose: true,
            lastClose:false
        )
        
        
        let Question_Think_Solve_array = [QTS1,QTS2,QTS3,QTS4,QTS5,QTS6,QTS7,QTS8,QTS9,QTS10,QTS_2_11,QTS_2_12,QTS_2_13,QTS_2_14,QTS_2_15,QTS_2_16,QTS_2_17,QTS_2_18,QTS_2_19]
        return(Question_Think_Solve_array)
        
        
        
        
        
        
        
        
    }
    
    }

    
    


