//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by India Doria on 3/31/20.
//  Copyright © 2020 India Doria. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: CharacterType
}

enum CharacterType: String {
    case carla = "Carla 👩🏽‍🦱",  jd = "J.D. 🧑🏻‍⚕️", cox = "Dr. Cox👨🏼‍🦱", elliott = "Elliott👩🏼‍⚕️", turk = "Turk🧑🏾‍🦲"

var definition: String {
switch self {
    case .carla:
        return "You are incredibly strong-willed and a good friend."
    case .jd:
        return "You will do anything to make the people you love happy. Even lie to them."
    case .cox:
        return "You care deeply about the people you love, but have a hard time showing it."
    case .elliott:
        return "You are odd, but have a very sensitive side that you don't show often."
    case .turk:
        return "You are silly, but can be counted on. Your friends know this."
    
    }
}
}
