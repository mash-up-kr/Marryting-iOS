//
//  UserDefaults.swift
//  DataSource
//
//  Created by Woody on 2022/08/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public struct LocalUser: Codable {
    public var id: Int
    public var name: String
    public var gender: LocalGender
    public var career: String
    public var birth: Date
    public var age: Int
    public var address: String
    public var pictures: [String]
    public var answers: [LocalAnswer]
    public var keyword: [LocalKeyword]
    public init(
        id: Int,
        name: String,
        gender: LocalGender,
        career: String,
        birth: Date,
        age: Int,
        address: String,
        pictures: [String],
        answers: [LocalAnswer],
        keyword: [LocalKeyword]
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

public struct LocalAnswer: Codable {
    public var questionID: Int
    public var answer: String

    public init(
        questionID: Int,
        answer: String
    ) {
        self.questionID = questionID
        self.answer = answer
    }
}

public struct LocalKeyword: Codable {
    public var id: Int
    public var keyword: String

    public init(
        id: Int,
        keyword: String
    ) {
        self.id = id
        self.keyword = keyword
    }
}


public enum LocalGender: Codable {
    case male
    case female
}
