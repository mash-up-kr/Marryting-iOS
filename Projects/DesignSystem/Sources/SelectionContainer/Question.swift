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

public enum QuestionType: Int {
    case fight = 0
    case communication
    case date
    case none

    public struct Question {
        var question: String
        var answer1: String
        var answer2: String

        static let dummy: Question = .init(question: "", answer1: "", answer2: "")
    }

    var question: Question {
        switch self {
        case .fight:
            return QuestionType.questions[0]
        case .communication:
            return QuestionType.questions[1]
        case .date:
            return QuestionType.questions[2]
        case .none:
            return Question.dummy
        }
    }

    public static let questions: [Question] = [
        Question(question: "싸울 때", answer1: "생각 정리하고 이야기", answer2: "그 자리에서 바로 이야기"),
        Question(question: "연락할 때", answer1: "별로 중요하지 않아요", answer2: "자주 할수록 좋아요"),
        Question(question: "데이트할 때", answer1: "계획적인 데이트", answer2:  "데이트할 때")
    ]
}
