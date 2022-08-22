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

public struct AnswerViewModel {
    public var answer: String
    public var questionId: Int
    
    public init(answer: String, questionId: Int) {
        self.answer = answer
        self.questionId = questionId
    }
}

public struct QuestionViewModel {
    public var question: String
    public var answer1: String
    public var answer2: String
    public var questionId: Int
    
    public init(
        question: String,
        answer1: String,
        answer2: String,
        questionId: Int
    ) {
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
        self.questionId = questionId
    }
}
