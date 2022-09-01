//
//  User.swift
//  Models
//
//  Created by Gunoo on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public struct User {
    
    public var id: Int
    
    public var name: String
    
    public var gender: Gender
    
    public var career: String
    
    public var birth: Date
    
    public var age: Int
    
    public var address: String
    
    public var pictures: [String]
    
    public var picture: String {
        if pictures.isEmpty {
            return ""
        }
        else {
            return pictures[0]
        }
    }
    
    public var answers: [Answer]
    
    public var answer1: Answer {
        if answers.isEmpty {
            return .init(questionID: 0, answer: "")
        }
        else {
            return answers[0]
        }
    }
    
    public var answer2: Answer {
        if answers.count < 2 {
            return .init(questionID: 0, answer: "")
        }
        else {
            return answers[1]
        }
    }
    
    public var answer3: Answer {
        if answers.count < 3 {
            return .init(questionID: 0, answer: "")
        }
        else {
            return answers[2]
        }
    }
    
    public var keyword: [Keyword]
    
    public init(
        id: Int,
        name: String,
        gender: Gender,
        career: String,
        birth: Date,
        age: Int,
        address: String,
        pictures: [String],
        answers: [Answer],
        keyword: [Keyword]
    ) {
        self.id = id
        self.name = name
        self.gender = gender
        self.career = career
        self.birth = birth
        self.age = age
        self.address = address
        self.pictures = pictures
        self.answers = answers
        self.keyword = keyword
    }
}
