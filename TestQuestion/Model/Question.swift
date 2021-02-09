//
//  Question.swift
//  TestQuestion
//
//  Created by Сергей Голенко on 09.02.2021.
//

import Foundation

class Question {
    let answer : Bool
    let questionText : String
    
    init(text : String, correctAnswer : Bool){
        answer = correctAnswer
        questionText = text
    }
    
}
