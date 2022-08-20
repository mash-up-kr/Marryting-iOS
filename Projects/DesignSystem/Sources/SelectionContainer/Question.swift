//
//  Question.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/22.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public enum AnswerSelection {
    case none
    case first
    case second
}

public struct Answer {
    public var answer: String
    public var questionId: String
    
    static let dummy: Answer = .init(answer: "", questionId: "")
}

public struct Question {
    public var question: String
    public var answer1: String
    public var answer2: String
    public var questionId: String

    static let dummy: Question = .init(question: "", answer1: "", answer2: "", questionId: "")
    
    public static let tempDummy: [Question] = [
        Question(question: "싸울 때", answer1: "생각 정리하고 이야기", answer2: "그 자리에서 바로 이야기", questionId: "0"),
        Question(question: "연락할 때", answer1: "별로 중요하지 않아요", answer2: "자주 할수록 좋아요", questionId: "1"),
        Question(question: "데이트할 때", answer1: "계획적인 데이트", answer2:  "데이트할 때", questionId: "2")
    ]
}
