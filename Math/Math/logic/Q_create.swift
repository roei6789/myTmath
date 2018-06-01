//
//  geometricQ_json.swift
//  Math
//
//  Created by Aviv Maor on 3/25/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import Foundation

class Q_create{

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
                Picture: "q4.png"
        )
        let QG6 =
            Question_Geometry.init(
                Title: "צורות הנדסיות",
                Number:6 ,
                Explantion:"בשרטוט מסתתרות צורות הנדסיות רבות. כמה טרפזים אתה רואה?" ,
                Answer_Correct:18 ,
                Attempts: 0,
                Picture: "q4.png"
        )
        
        let QG7 =
            Question_Geometry.init(
                Title: "ריבועים בריבוע",
                Number:7 ,
                Explantion: "כמה ריבועים בגדלים שונים מסתתרים בשרטוט?",
                Answer_Correct:14 ,
                Attempts: 0,
                Picture: "q5.png"
        )
        let QG8 =
            Question_Geometry.init(
                Title: "ריבועים בריבוע",
                Number:8 ,
                Explantion: "כמה ריבועים בגדלים שונים מסתתרים בשרטוט?",
                Answer_Correct: 30,
                Attempts:0 ,
                Picture: "q6.png"
        )
        
        let QG9 =
            Question_Geometry.init(
                Title: "ריבועים בריבוע",
                Number:9 ,
                Explantion:"כמה ריבועים בגדלים שונים מסתתרים בשרטוט?" ,
                Answer_Correct:55 ,
                Attempts:0 ,
                Picture: "q7.png"
        )
        let QG10 =
            Question_Geometry.init(
                Title: "מעויינים במעוין",
                Number:10 ,
                Explantion: "מעוין מחולק למעוינים קטנים. כמה מעוינים בגדלים שונים מסתתרים בשרטוט?",
                Answer_Correct:30 ,
                Attempts:0 ,
                Picture: "q8.png"
        )
        let QG11 =
            Question_Geometry.init(
                Title: "מלבנים במלבן",
                Number:11 ,
                Explantion: "המלבן מחולק ל12 ריבועים. כמה מלבנים שונים אפשר למצוא בשרטוט?",
                Answer_Correct: 40,
                Attempts:0 ,
                Picture: "q9.png"
        )
        let QG12 =
            Question_Geometry.init(
                Title:"מעוינים במשולש" ,
                Number:12 ,
                Explantion:"כמה מעוינים מסתתרים בשרטוט?",
                Answer_Correct: 21,
                Attempts: 0,
                Picture: "q10.png"
        )
        let QG13 =
            Question_Geometry.init(
                Title:"משולשים במחומש" ,
                Number:13 ,
                Explantion:"במחומש שורטטו אלכסונים, כך נוצרו משולשים רבים. כמה משולשים בשרטוט?",
                Answer_Correct: 35,
                Attempts: 0,
                Picture: "q11.png"
        )
        let QG14 =
            Question_Geometry.init(
                Title:"טרפזים במשולש",
                Number:14 ,
                Explantion:"בתוך השרטוט מסתתרים טרפזים רבים. כמה טרפזים מסתתרים?",
                Answer_Correct: 57,
                Attempts: 0,
                Picture: "q12.png"
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
            Content: "9 x 1 + 2 "
        )
        let QTS2 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 2,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 21,
            Attempts: 0,
            Content: "9 x 2 + 3 "
        )
        
        let QTS3 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 3,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 31,
            Attempts: 0,
            Content: " 9 x 3 + 4 "
        )
        
        let QTS4 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 4,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 41,
            Attempts: 0,
            Content: "9 x 4 + 5 "
        )
        
        let QTS5 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 5,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 101,
            Attempts: 0,
            Content: "9 x 10 + 11 "
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
            Content: "9 x 12 + 13 "
        )
        
        let QTS8 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 8,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 131,
            Attempts: 0,
            Content: "9 x 13 + 14 "
        )
        
        let QTS9 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 9,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 141,
            Attempts: 0,
            Content: "9 x 14 + 15 "
        )
        
        let QTS10 = Question_Thinks_solve.init(
            Title:"חשבון משעשע",
            Number: 10,
            Explantion: "פתור את התרגילים הבאים ללא עזרת מחשבון",
            Answer_Correct: 151,
            Attempts: 0,
            Content: "9 x 15 + 16 "
        )
        let QTS_2_11 = Question_Thinks_solve_2.init(
            Title: "בנה את המספר",
            Number: 11,
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. " + "\n" + " הוסף סוגריים לפי הצורך" ,
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
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. " + "\n" + " הוסף סוגריים לפי הצורך" ,
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
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. " + "\n" + " הוסף סוגריים לפי הצורך" ,
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
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. " + "\n" + " הוסף סוגריים לפי הצורך" ,
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
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. " + "\n" + " הוסף סוגריים לפי הצורך" ,
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
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. " + "\n" + " הוסף סוגריים לפי הצורך" ,
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
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. " + "\n" + " הוסף סוגריים לפי הצורך" ,
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
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. " + "\n" + " הוסף סוגריים לפי הצורך" ,
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
            Explantion:  "על כל קו שים אחד מהסימנים +,-,x,:. " + "\n" + " הוסף סוגריים לפי הצורך" ,
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
        let Question_Think_Solve_array_mix = [QTS1,QTS_2_11,
                                              QTS2,QTS_2_12,
                                              QTS3,QTS_2_13,
                                              QTS4,QTS_2_14,
                                              QTS5,QTS_2_15,
                                              QTS6,QTS_2_16,
                                              QTS7,QTS_2_17,
                                              QTS8,QTS_2_18,
                                              QTS9,QTS_2_19,
                                              QTS10]
        return(Question_Think_Solve_array_mix)
    }
   
}

